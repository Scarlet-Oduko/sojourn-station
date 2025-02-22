/datum/trade_station/suit_up
	name_pool = list(
		"ATB 'Suit Up!'" = "Aster's Trade Beacon 'Suit Up!': \"Suits, voidsuits and more for you, traveler!\""
	)
	uid = "suit_up"
	start_discovered = TRUE
	spawn_always = TRUE
	markup = COMMON_GOODS
	offer_limit = 20
	base_income = 3200
	wealth = 0
	secret_inv_threshold = 24000
	recommendations_needed = 1
	stations_recommended = list("rigs", "mecha")
	assortiment = list(
		"Voidsuits" = list(
			/obj/item/clothing/suit/space/void,
			/obj/item/clothing/suit/space/void/atmos = custom_good_amount_range(list(1, 5)),
			/obj/item/clothing/suit/space/void/mining = custom_good_amount_range(list(1, 5)),
			/obj/item/clothing/suit/space/void/engineering = custom_good_amount_range(list(-5, 3)),
			/obj/item/clothing/suit/space/void/medical = custom_good_amount_range(list(-5, 3)),
			/obj/item/clothing/suit/space/void/security = custom_good_amount_range(list(-5, 1)),
			/obj/item/clothing/suit/space/void/SCAF = custom_good_amount_range(list(-5, 1))
		),
		"RIGs" =  list(
			/obj/item/rig/eva = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/medical = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/light = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/hazmat = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/combat = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/hazard = custom_good_amount_range(list(1, 5)),
			/obj/item/rig/industrial = custom_good_amount_range(list(1, 5))
		),
		"Rig modules" = list(
			/obj/item/rig_module/device/healthscanner,
			/obj/item/rig_module/device/drill,
			/obj/item/rig_module/device/orescanner,
			/obj/item/rig_module/device/rcd,
			/obj/item/rig_module/modular_injector,
			/obj/item/rig_module/modular_injector/combat,
			/obj/item/rig_module/modular_injector/medical,
			/obj/item/rig_module/maneuvering_jets,
			/obj/item/rig_module/device/flash,
			/obj/item/rig_module/grenade_launcher,
			/obj/item/rig_module/mounted,
			/obj/item/rig_module/mounted/egun,
			/obj/item/rig_module/mounted/taser,
			/obj/item/rig_module/held/energy_blade,
			/obj/item/rig_module/held/shield,
			/obj/item/rig_module/fabricator,
			/obj/item/rig_module/fabricator/energy_net,
			/obj/item/rig_module/stealth_field,
			/obj/item/rig_module/vision/meson,
			/obj/item/rig_module/vision/nvg,
			/obj/item/rig_module/vision/sechud,
			/obj/item/rig_module/vision/medhud,
			/obj/item/rig_module/vision/thermal,
			/obj/item/rig_module/storage
		)
	)

	offer_types = list(
		/obj/item/tool/tape_roll = offer_data("tape roll", 100, 0),
		/obj/item/tool/surgicaldrill = offer_data("surgical drill", 400, 0),
		/obj/item/cell/large = offer_data("large cell", 200, 0)
	)