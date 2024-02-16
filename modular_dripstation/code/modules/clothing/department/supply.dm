// ###### QM ######
/obj/item/clothing/suit/hooded/wintercoat/QM
	name = "quartermaster`s winter coat"
	desc = "placeholder."
	icon_state = "coatqm"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	
	allowed = list(/obj/item/pickaxe, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/boxcutter, /obj/item/export_scanner, /obj/item/cargo_teleporter, /obj/item/melee/classic_baton)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/QM

/obj/item/clothing/suit/hooded/wintercoat/QM/attackby(obj/item/I, params)
	if(!istype(I, /obj/item/clothing/suit/armor/vest/alt))
		return
	if(!usr.canUseTopic(src, BE_CLOSE))
		return
	if(usr.is_holding(src))
		usr.visible_message("[usr] attaches [I] to [src].", span_notice("You attach [I] to [src]."))
		qdel(src)
		qdel(I)
		var/obj/item/armor = new /obj/item/clothing/suit/hooded/wintercoat/QM/armored
		usr.put_in_hands(armor)
	else
		to_chat(usr, span_info("You should hold [src] in your hands."))
		return

/obj/item/clothing/head/hooded/winterhood/QM
	name = "quartermaster`s winter hood"
	desc = "placeholder."
	icon_state = "winterhood_qm"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/suit/hooded/wintercoat/QM/armored
	name = "quartermaster`s armored winter coat"
	desc = "placeholder. This one is reinforced with real bulletproof armor platening."
	icon_state = "coatqm_armored"
	body_parts_covered = CHEST
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)
	var/armor_type = /obj/item/clothing/suit/armor/vest/alt

/obj/item/clothing/suit/hooded/wintercoat/QM/armored/Initialize()
	. = ..()
	allowed |= GLOB.security_vest_allowed

/obj/item/clothing/suit/hooded/wintercoat/QM/armored/AltClick(slot, obj/item/I, params)
	if(!usr.canUseTopic(src, BE_CLOSE))
		return
	I = src.armor_type
	usr.visible_message("[usr] removes armor from [src].", span_notice("You remove armor from [src]."))
	new I(get_turf(src))
	var/obj/item/nonarmored = new /obj/item/clothing/suit/hooded/wintercoat/QM
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