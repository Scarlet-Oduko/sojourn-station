/obj/item/gun/projectile/clarissa
	name = "\"Clarissa\" pistol"
	desc = "A small, easily concealable, but somewhat underpowered gun produced by \"H&S\" as a preciser to the \"Giskard\". Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/clarissa.dmi'
	icon_state = "clarissa"
	item_state = "clarissa"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_PLASTIC = 6)
	price_tag = 250
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	damage_multiplier = 0.7
	recoil_buildup = 2 //weakest gun in the damn game

/obj/item/gun/projectile/clarissa/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/clarissa/makarov
	name = "\"Makarov\" pistol"
	desc = "Old-designed pistol used by space communists. Small and easily concealable. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/makarov.dmi'
	icon_state = "makarov"
	damage_multiplier = 1.1
	recoil_buildup = 8
	price_tag = 700
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_ILLEGAL = 3)
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/clarissa/moebius
	name = "SI HG .35 Auto \"Malpractice\"" // SI stands for Soteria Institution
	desc = "A small, easily concealable, but somewhat underpowered gun produced by SI as based off the \"Little Commit\" but ended up being a copy of the \"Clarissa\" with white paint. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/clarissa_white.dmi'
	price_tag = 200

/obj/item/gun/projectile/clarissa/moebius/preloaded_cbo

/obj/item/gun/projectile/clarissa/moebius/preloaded_cbo/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/drum/soporific_cbo(src)
