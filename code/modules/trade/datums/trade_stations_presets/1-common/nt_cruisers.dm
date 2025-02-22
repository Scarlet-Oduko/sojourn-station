/datum/trade_station/nt_cruisers
	icon_states = "nt_cruiser"
	markup = RARE_GOODS	// dept-specific stuff should be more expensive for guild
	name_pool = list(
		"CAV 'Faith'" = "Church of Absolute Vessel 'Faith': \"We are currently resupplying from Nadezhda, but we can sell a few items from our stock.\"",
		"CAV 'Hope'" = "Church of Absolute Vessel 'Hope': \"We're in the system for the next few hours before we make a round trip to the confederacy, we're certainly willing to sell our goods.\""
		)
	icon_states = "nt_cruiser"
	uid = "nt_basic"
	start_discovered = TRUE
	spawn_always = TRUE
	base_income = 1600
	wealth = 0
	secret_inv_threshold = 2000
	recommendation_threshold = 4000
	stations_recommended = list("trapper")
	assortiment = list(
		"Biomatter products" = list(
			/obj/item/reagent_containers/food/snacks/meat,
			/obj/item/reagent_containers/food/drinks/milk,
			/obj/item/soap/church,
			/obj/item/storage/pouch/small_generic,
			/obj/item/storage/pouch/medium_generic,
			/obj/item/storage/pouch/large_generic,
			/obj/item/storage/pouch/medical_supply,
			/obj/item/storage/pouch/engineering_tools,
			/obj/item/storage/pouch/engineering_supply,
			/obj/item/storage/pouch/tubular,
			/obj/item/storage/pouch/tubular/vial,
			/obj/item/storage/pouch/ammo,
			/obj/item/clothing/accessory/holster,
			/obj/item/clothing/accessory/holster/armpit,
			/obj/item/clothing/accessory/holster/waist,
			/obj/item/clothing/accessory/holster/hip
		),
		"Agro Supply" = list(
			/obj/structure/largecrate/animal/corgi,
			/obj/structure/largecrate/animal/cow,
			/obj/structure/largecrate/animal/goat,
			/obj/structure/largecrate/animal/cat,
			/obj/structure/largecrate/animal/chick,
		),
		"Custodial Supply" = list(
			/obj/item/reagent_containers/glass/bucket,
			/obj/item/mop,
			/obj/item/caution,
			/obj/item/storage/bag/trash,
			/obj/item/device/lightreplacer,
			/obj/item/reagent_containers/spray/cleaner,
			/obj/item/reagent_containers/glass/rag,
			/obj/item/grenade/chem_grenade/cleaner/nt_cleaner,
			/obj/item/grenade/chem_grenade/antiweed/nt_antiweed,
			/obj/structure/mopbucket
		),
		"Non-Recharging Biomatter Cells" = list(
			/obj/item/cell/small/neotheology,
			/obj/item/cell/medium/neotheology,
			/obj/item/cell/large/neotheology
		),
		"Energy Weapons" = list(
			/obj/item/gun/energy/taser,
			/obj/item/gun/energy/ntpistol,
			/obj/item/gun/energy/laser = custom_good_amount_range(list(1, 5)),
			/obj/item/gun/energy/ionrifle = custom_good_amount_range(list(1, 4)),
			/obj/item/gun/energy/sniperrifle = custom_good_amount_range(list(-8, 1)),
			/obj/item/gun/energy/crossbow/largecrossbow = custom_good_amount_range(list(-8, 1))
		),
		"Ballistic weapons" = list(
			/obj/item/gun/projectile/mk58,
			/obj/item/gun/projectile/mk58/wood,
			/obj/item/gun/projectile/revolver/lemant,
			/obj/item/gun/projectile/shotgun/pump/combat,
			/obj/item/gun/projectile/grenade
		)
	)

	secret_inventory = list(
		"Melee weapons" = list(
			/obj/item/tool/sword/nt/shortsword,
			/obj/item/tool/sword/nt/longsword = custom_good_amount_range(list(-1, 2)),
			/obj/item/tool/knife/dagger/nt,
			/obj/item/tool/sword/nt/spear,
			/obj/item/shield/buckler/nt
		),
		"Holy Grenades" = list(
			/obj/item/grenade/smokebomb/nt = custom_good_amount_range(list(1, 4)),
			/obj/item/grenade/flashbang/nt = custom_good_amount_range(list(1, 4))
		),
		"Tool & Weapon Mods" = list(
			/obj/item/tool_upgrade/augment/sanctifier,
			/obj/item/tool_upgrade/productivity/whetstone = custom_good_amount_range(list(-3, 2)),
			/obj/item/gun_upgrade/barrel/excruciator = custom_good_amount_range(list(-3, 2))
		),
		"Plasma weapons" = list(
			/obj/item/gun/energy/plasma/martyr,
			/obj/item/gun/energy/plasma = custom_good_amount_range(list(-3, 2)),
			/obj/item/gun/energy/plasma/destroyer = custom_good_amount_range(list(-3, 2))
		),
		"Non-Recharging Biomatter Plasma Cells" = list(
			/obj/item/cell/small/neotheology/plasma,
			/obj/item/cell/medium/neotheology/plasma,
			/obj/item/cell/large/neotheology/plasma
		),
		"Wine" = list(
			/obj/item/reagent_containers/food/drinks/cans/cahors/cargo,
			/obj/item/reagent_containers/food/drinks/bottle/ntcahors/cargo
		)
	)
	offer_types = list(
		/obj/item/clothing/suit/space/void/NTvoid = offer_data("angel voidsuit", 1250, 15),
		/obj/item/clothing/shoes/hermes_shoes = offer_data("hermes shoes", 420, 10),
		/obj/item/reagent_containers/food/snacks/grown = offer_data("spare grown food", 10, 120)
	)

/obj/item/reagent_containers/food/drinks/cans/cahors/cargo
	price_tag = 600

/obj/item/reagent_containers/food/drinks/cans/cahors/cargo/New()
	price_tag = 60

/obj/item/reagent_containers/food/drinks/bottle/ntcahors/cargo
	price_tag = 1200

/obj/item/reagent_containers/food/drinks/bottle/ntcahors/cargo/New()
	price_tag = 100