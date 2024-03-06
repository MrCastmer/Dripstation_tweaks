// ###### QM ######
/obj/item/clothing/suit/hooded/wintercoat/qm
	name = "quartermaster`s winter coat"
	desc = "placeholder."
	icon_state = "coatqm"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	
	allowed = list(/obj/item/pickaxe, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/boxcutter, /obj/item/export_scanner, /obj/item/cargo_teleporter, /obj/item/melee/classic_baton)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/qm

/obj/item/clothing/suit/hooded/wintercoat/qm/attackby(obj/item/I, params)
	if(!istype(I, /obj/item/clothing/suit/armor/vest/alt))
		return
	if(!usr.canUseTopic(src, BE_CLOSE))
		return
	if(usr.is_holding(src))
		usr.visible_message("[usr] attaches [I] to [src].", span_notice("You attach [I] to [src]."))
		qdel(src)
		qdel(I)
		var/obj/item/armor = new /obj/item/clothing/suit/hooded/wintercoat/qm/armored
		usr.put_in_hands(armor)
	else
		to_chat(usr, span_info("You should hold [src] in your hands."))
		return

/obj/item/clothing/head/hooded/winterhood/qm
	name = "quartermaster`s winter hood"
	desc = "placeholder."
	icon_state = "winterhood_qm"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/suit/hooded/wintercoat/qm/armored
	name = "quartermaster`s armored winter coat"
	desc = "placeholder. This one is reinforced with real bulletproof armor platening."
	icon_state = "coatqm_armored"
	body_parts_covered = CHEST
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	var/armor_type = /obj/item/clothing/suit/armor/vest/alt

/obj/item/clothing/suit/hooded/wintercoat/qm/armored/Initialize()
	. = ..()
	allowed |= GLOB.security_vest_allowed

/obj/item/clothing/suit/hooded/wintercoat/qm/armored/AltClick(slot, obj/item/I, params)
	if(!usr.canUseTopic(src, BE_CLOSE))
		return
	I = src.armor_type
	usr.visible_message("[usr] removes armor from [src].", span_notice("You remove armor from [src]."))
	new I(get_turf(src))
	var/obj/item/nonarmored = new /obj/item/clothing/suit/hooded/wintercoat/qm
	if(slot == ITEM_SLOT_OCLOTHING)
		if(usr.equip_to_slot_if_possible(nonarmored,ITEM_SLOT_OCLOTHING,0,0,1))
			return 1
	else
		usr.put_in_hands(nonarmored)
	qdel(src)

/obj/item/clothing/suit/trenchcoatqm
	name = "Quartermaster`s coat"
	desc = "Modern multi-purpose trenchcoat, enchanced with naturall fur. Someone who wears this means really serious business."
	icon_state = "trenchcoatqm_open"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	clothing_flags = THICKMATERIAL
	mutantrace_variation = MUTANTRACE_VARIATION
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 10, BOMB = 10, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	allowed = list(/obj/item/pickaxe, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/boxcutter, /obj/item/export_scanner, /obj/item/cargo_teleporter, /obj/item/melee/classic_baton)

/obj/item/clothing/head/qmhat
	name = "quartermaster's formal hat"
	desc = "Classic hat issued to quartermaster."
	icon_state = "qmhat"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/beret/quartermaster
	name = "quartermaster's formal beret"
	desc = "Classic beret issued to quartermaster."
	icon_state = "beretqm"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/under/rank/cargo
	icon_state = "qm"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/cargo/qm.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/cargo/qm.dmi'

/obj/item/clothing/under/rank/cargo/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/cargo/official
	icon_state = "qmtanofficial"

/obj/item/clothing/under/rank/cargo/supply_chief
	icon_state = "supply_chief"

/obj/item/clothing/under/rank/cargo/skirt/supply_chief
	icon_state = "supply_chief_skirt"

/obj/item/clothing/under/rank/cargo/supply_chief/alt
	icon_state = "supply_chiefalt"

/obj/item/clothing/under/rank/cargo/skirt/supply_chief/alt
	icon_state = "supply_chiefalt_skirt"

/obj/item/clothing/under/rank/cargo/qmc
	icon_state = "qmc"
	desc = "For those cases when you need to order alcohol for the entire station."

/obj/item/clothing/under/rank/cargo/turtleneck/alt
	name = "quartermaster's tactical turtleneck"
	desc = "Why would a cargo head need to be a tacticool? Ask their coworkers."
	icon_state = "qmtactical"

// ###### CARGO TECH ######
/obj/item/clothing/under/rank/cargotech
	custom_price = 50
	icon_state = "cargotech"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/cargo/cargotech.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/cargo/cargotech.dmi'

/obj/item/clothing/under/rank/cargotech/customs
	name = "customs uniform"
	icon_state = "customs_uniform"
	desc = "Slick uniform issued to Cargonia guard."

/obj/item/clothing/under/rank/cargotech/mail
	name = "mailman uniform"
	icon_state = "mailroom_technician"
	desc = "Uniform issued to Cargonia mailmen. NOTHING STOPS THE MAIL!"

/obj/item/clothing/under/rank/cargotech/delivery
	name = "delivery officer uniform"
	icon_state = "deliveries_officer"
	desc = "Uniform issued to Cargonia delivery officials. Deliver with style!"

/obj/item/clothing/under/rank/cargotech/jean
	name = "technician's tacticool cargo pants"
	icon_state = "cargotechjean"
	desc = "Tactical version of standart cargo uniform."

/obj/item/clothing/under/rank/cargotech/skirt/jean
	name = "technician's tacticool skirt"
	icon_state = "cargotechjean_skirt"
	desc = "Tactical version of standart cargo skirt."

/obj/item/clothing/under/rank/cargotech/skirt/mail
	name = "mailwoman skirt"
	icon_state = "mailroom_technician_skirt"
	desc = "Skirt issued to Cargonia mailwomen. NOTHING STOPS THE MAIL!"

/obj/item/clothing/under/rank/cargotech/skirt/delivery
	name = "delivery officer skirt"
	icon_state = "deliveries_officer_skirt"
	desc = "Skirt issued to Cargonia delivery officials. Deliver with style!"

/////Miner//////
/obj/item/clothing/under/rank/miner
	name = "miner tactical overalls"
	desc = "It's a tactical jumpsuit with a sturdy set of overalls. It is very dirty."
	icon_state = "turtleneck_miner_alt"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/cargo/miner.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/cargo/miner.dmi'
	custom_price = 50

/obj/item/clothing/under/rank/miner/lavaland
	desc = "A green uniform for operating in hazardous environments. Real classic."

/obj/item/clothing/under/rank/miner/turtleneck
	name = "miner tactical turtleneck"
	desc = "It's a tactical jumpsuit with a sturdy set of pants. It is very dirty."
	icon_state = "turtleneck_miner"
	custom_price = 80

/obj/item/clothing/under/rank/miner/turtleneck/skirt
	name = "miner tactical skirtleneck"
	desc = "It's a tactical skirt with a sturdy set of pants. It is very dirty."
	icon_state = "skirtleneck_miner_skirt"

// ###### CARGO STAFF ######

/obj/item/clothing/head/welding/tagilla
	name = "UBEI welding helmet"
	desc = "A painted welding helmet, this one looks like it's calling you to hit someone with a sledgehammer."
	icon_state = "tagillawelding"	
	item_state = "tagillawelding"	
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

obj/item/clothing/suit/hooded/wintercoat/cargo
	allowed = list(/obj/item/pickaxe, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/boxcutter, /obj/item/export_scanner, /obj/item/cargo_teleporter)

/obj/machinery/vending/wardrobe/cargo_wardrobe
	name = "CargoDrobe"
	desc = "A highly advanced vending machine for buying cargo related clothing."
	icon_state = "cargodrobe"
	product_ads = "Upgraded Style! Pick yours today!;These shorts are comfy and easy to wear, get yours now!"
	vend_reply = "Thank you for using the CargoDrobe!"
	products = list(/obj/item/clothing/suit/hooded/wintercoat/cargo = 3,
					/obj/item/clothing/under/rank/cargotech = 3,
					/obj/item/clothing/under/rank/cargotech/skirt = 3,
					/obj/item/clothing/under/rank/cargotech/customs = 2,
					/obj/item/clothing/under/rank/cargotech/jean = 2,
					/obj/item/clothing/under/rank/cargotech/skirt/jean = 2,
					/obj/item/clothing/under/rank/cargotech/mail = 3,
					/obj/item/clothing/under/rank/cargotech/skirt/mail = 3,
					/obj/item/clothing/under/rank/cargotech/delivery = 3,
					/obj/item/clothing/under/rank/cargotech/skirt/delivery = 3,
					/obj/item/clothing/under/rank/miner = 2,
					/obj/item/clothing/shoes/sneakers/black = 3,
					/obj/item/clothing/shoes/xeno_wraps/cargo = 3,
					/obj/item/clothing/gloves/fingerless = 3,
					/obj/item/clothing/head/soft = 3,
					/obj/item/radio/headset/headset_cargo = 3,
					/obj/item/clothing/accessory/armband/cargo = 3,
					/obj/item/storage/bag/mail = 3)
	premium = list(/obj/item/clothing/under/rank/miner/turtleneck = 1,
					/obj/item/clothing/under/rank/miner/turtleneck/skirt = 1,
					/obj/item/clothing/under/rank/cargotech/turtleneck = 1,
					/obj/item/clothing/under/rank/cargotech/skirt/turtleneck = 1,
					/obj/item/clothing/shoes/workboots/cargo = 2,
					/obj/item/clothing/shoes/workboots/mining = 2)