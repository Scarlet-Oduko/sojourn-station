/obj/machinery/shieldwallgen/ameridian
	name = "ameridian sonic fence generator"
	desc = "A sonic fence generator specially designed to contain and destroy ameridian crystals."
	shield_type = /obj/machinery/shieldwall/ameridian
	circuit = /obj/item/circuitboard/ameridianshieldwallgen
	req_access = list()

/obj/machinery/shieldwall/ameridian
	name = "sonic fence"
	desc = "A sonic fence specially designed to destroy ameridian crystals by targeting its resonant frequency. \
			However, any amount of interference alter the frequency and doesn't damage the crystal, thus allowing \
			people to carry them through the field."
	density = FALSE

/obj/machinery/shieldwall/ameridian/New()
	..()
	spawn(1)
		for(var/obj/structure/ameridian_crystal/AC in get_turf(src))
			if(istype(AC, /obj/structure/ameridian_crystal/spire)) // Don't destroy spires.
				continue
			AC.visible_message("[AC] shatters.")
			AC.Destroy()

/obj/machinery/shieldwall/ameridian/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return TRUE // Everything can go through, it's a sound barrier, not a physical thing

/obj/machinery/shieldwall/ameridian/Crossed(atom/movable/O)
	if(istype(O, /obj/item/stack/material/ameridian))
		O.visible_message(SPAN_NOTICE("[O] shatter into dust under the sonic field."))
		qdel(O)
		return

	if(istype(O, /mob/living/carbon/superior_animal/ameridian_golem))
		var/mob/living/carbon/superior_animal/ameridian_golem/G = O
		G.drop_amount = 0 // The crystal golem is obliterated, don't drop any loot.
		G.death() // Golem die.
		return
