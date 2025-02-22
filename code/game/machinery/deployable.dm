/*
CONTAINS:
Deployable items
Barricades

for reference:
	access_security = 1
	access_brig = 2
	access_armory = 3
	access_forensics_lockers= 4
	access_moebius = 5
	access_morgue = 6
	access_tox = 7
	access_tox_storage = 8
	access_genetics = 9
	access_engine = 10
	access_engine_equip= 11
	access_maint_tunnels = 12
	access_external_airlocks = 13
	access_emergency_storage = 14
	access_change_ids = 15
	access_ai_upload = 16
	access_teleporter = 17
	access_eva = 18
	access_heads = 19
	access_captain = 20
	access_all_personal_lockers = 21
	access_chapel_office = 22
	access_tech_storage = 23
	access_atmospherics = 24
	access_bar = 25
	access_janitor = 26
	access_crematorium = 27
	access_kitchen = 28
	access_robotics = 29
	access_rd = 30
	access_cargo = 31
	access_construction = 32
	access_chemistry = 33
	access_cargo_bot = 34
	access_hydroponics = 35
	access_manufacturing = 36
	access_virology = 39
	access_cmo = 40
	access_merchant = 41
	access_court = 42
	access_clown = 43
*/

//Barricades!
/obj/structure/barricade
	name = "barricade"
	desc = "An improvised barrier designed to block access."
	icon = 'icons/obj/structures.dmi'
	icon_state = "barricade"
	anchored = 1.0
	density = 1.0
	health = 100
	maxHealth = 100
	var/material/material

/obj/structure/barricade/New(newloc, material_name)
	..(newloc)
	if(!material_name)
		material_name = "wood"
	material = get_material_by_name("[material_name]")
	if(!material)
		qdel(src)
		return
	name = "[material.display_name] barricade"
	desc = "This space is blocked off by a barricade made of [material.display_name]."
	color = material.icon_colour
	maxHealth = material.integrity
	health = maxHealth

/obj/structure/barricade/attack_generic(var/mob/user, var/damage, var/attack_verb, var/wallbreaker)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage)
		return 1

/obj/structure/barricade/proc/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message(SPAN_WARNING("\The [src] breaks down!"))
		playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
		dismantle()
		qdel(src)

/obj/structure/barricade/get_matter()
	. = ..()
	if(material)
		LAZYAPLUS(., material.name, 5)

/obj/structure/barricade/get_material()
	return material

/obj/structure/barricade/attackby(obj/item/W as obj, mob/user as mob)
	if(user.a_intent == I_HELP && istype(W, /obj/item/gun))
		var/obj/item/gun/G = W
		G.gun_brace(user, src)
		return
	if(istype(W, /obj/item/stack))
		var/obj/item/stack/D = W
		if(D.get_material_name() != material.name)
			return //hitting things with the wrong type of stack usually doesn't produce messages, and probably doesn't need to.
		if(health < maxHealth)
			if(D.get_amount() < 1)
				to_chat(user, SPAN_WARNING("You need one sheet of [material.display_name] to repair \the [src]."))
				return
			visible_message(SPAN_NOTICE("[user] begins to repair \the [src]."))
			if(do_after(user,20,src) && health < maxHealth)
				if(D.use(1))
					health = maxHealth
					visible_message(SPAN_NOTICE("[user] repairs \the [src]."))
				return
		return
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		switch(W.damtype)
			if("fire")
				health -= W.force * 1
			if("brute")
				health -= W.force * 0.75
			else
		if(health <= 0)
			visible_message(SPAN_DANGER("The barricade is smashed apart!"))
			dismantle()
			qdel(src)
			return
		..()

/obj/structure/barricade/proc/dismantle()
	drop_materials(drop_location())
	qdel(src)
	return

/obj/structure/barricade/ex_act(severity)
	switch(severity)
		if(1.0)
			visible_message(SPAN_DANGER("\The [src] is blown apart!"))
			qdel(src)
			return
		if(2.0)
			health -= 25
			if(health <= 0)
				visible_message(SPAN_DANGER("\The [src] is blown apart!"))
				dismantle()
			return

/obj/structure/barricade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if(air_group || (height==0))
		return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	else
		return 0

//Actual Deployable machinery stuff
/obj/machinery/deployable
	name = "deployable"
	desc = "deployable"
	icon = 'icons/obj/objects.dmi'
	req_access = list(access_security)//I'm changing this until these are properly tested./N

/obj/machinery/deployable/barrier
	name = "deployable barrier"
	desc = "A deployable barrier. Swipe your ID card to lock/unlock it, can even brace guns on it."
	icon = 'icons/obj/objects.dmi'
	anchored = 0
	density = 1
	icon_state = "barrier0"
	health = 100
	maxHealth = 100
	var/locked = 0
//	req_access = list(access_maint_tunnels)

/obj/machinery/deployable/attack_generic(var/mob/user, var/damage, var/attack_verb, var/wallbreaker)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage)
		return 1

/obj/machinery/deployable/proc/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message(SPAN_WARNING("\The [src] breaks down!"))
		playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
		dismantle()
		qdel(src)

/obj/machinery/deployable/barrier/New()
	..()

	icon_state = "barrier[locked]"

/obj/machinery/deployable/barrier/attackby(obj/item/W as obj, mob/user as mob)
	if(user.a_intent == I_HELP && istype(W, /obj/item/gun))
		var/obj/item/gun/G = W
		G.gun_brace(user, src)
		return
	if(W.GetIdCard())
		if(allowed(user))
			if	(emagged < 2.0)
				locked = !locked
				anchored = !anchored
				icon_state = "barrier[locked]"
				if((locked == 1.0) && (emagged < 2.0))
					to_chat(user, "Barrier lock toggled on.")
					return
				else if((locked == 0.0) && (emagged < 2.0))
					to_chat(user, "Barrier lock toggled off.")
					return
			else
				var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
				s.set_up(2, 1, src)
				s.start()
				visible_message(SPAN_WARNING("BZZzZZzZZzZT"))
				return
		return
	else if(istype(W, /obj/item/tool/wrench))
		if(health < maxHealth)
			health = maxHealth
			emagged = 0
			req_access = list(access_security)
			visible_message(SPAN_WARNING("[user] repairs \the [src]!"))
			return
		else if(emagged > 0)
			emagged = 0
			req_access = list(access_security)
			visible_message(SPAN_WARNING("[user] repairs \the [src]!"))
			return
		return
	else
		switch(W.damtype)
			if("fire")
				health -= W.force * 0.75
			if("brute")
				health -= W.force * 0.5
			else
		if(health <= 0)
			explode()
		..()

/obj/machinery/deployable/barrier/ex_act(severity)
	switch(severity)
		if(1.0)
			explode()
			return
		if(2.0)
			health -= 25
			if(health <= 0)
				explode()
			return

/obj/machinery/deployable/barrier/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		return
	if(prob(50/severity))
		locked = !locked
		anchored = !anchored
		icon_state = "barrier[locked]"

/obj/machinery/deployable/barrier/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if(air_group || (height==0))
		return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	else
		return 0

/obj/machinery/deployable/barrier/proc/explode()

	visible_message(SPAN_DANGER("[src] blows apart!"))
	var/turf/Tsec = get_turf(src)

/*	var/obj/item/stack/rods/ =*/
	new /obj/item/stack/rods(Tsec)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()

	explosion(src.loc,0,0,2)
	if(src)
		qdel(src)

/obj/machinery/deployable/barrier/emag_act(var/remaining_charges, var/mob/user)
	if(emagged == 0)
		emagged = 1
		req_access.Cut()
		req_one_access.Cut()
		to_chat(user, "You break the ID authentication lock on \the [src].")
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message(SPAN_WARNING("BZZzZZzZZzZT"))
		return 1
	else if(emagged == 1)
		emagged = 2
		to_chat(user, "You short out the anchoring mechanism on \the [src].")
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message(SPAN_WARNING("BZZzZZzZZzZT"))
		return 1
