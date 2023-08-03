	//Elite Mining hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/heavymining
	name = "elite mining hardsuit helmet"
	desc = "A special prototipe helmet designed for work in a agressive, hazardous, low pressure environment. Has reinforced plating for wildlife encounters and dual floodlights. Seems very tough."
	icon_state = "hardsuit0-hvymining"
	item_state = "hardsuit0-hvymining"
	hardsuit_type = "hvymining"
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'
	resistance_flags = FIRE_PROOF | ACID_PROOF | LAVA_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 70, BULLET = 25, LASER = 20, ENERGY = 20, BOMB = 70, BIO = 100, RAD = 60, FIRE = 100, ACID = 100, WOUND = 15)

/obj/item/clothing/head/helmet/space/hardsuit/heavymining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate,2,/obj/item/stack/sheet/animalhide/carpdragon, list(BULLET = 5, LASER = 10, BOMB = 5, RAD = 10, WOUND = 2.5))

/obj/item/clothing/suit/space/hardsuit/heavymining
	name = "elite mining hardsuit"
	desc = "A special prototipe suit that protects against agressive, hazardous, low pressure environments and has some armor protection. Previously used by Nanotrasen in deep space expeditions. Has reinforced plating for wildlife encounters and light cargo exoskelet."
	item_state = "hardsuit-hvymining"
	icon_state = "hardsuit-hvymining"
	hardsuit_type = "hvymining"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	slowdown = 0.4
	resistance_flags = FIRE_PROOF | ACID_PROOF | LAVA_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 70, BULLET = 25, LASER = 20, ENERGY = 20, BOMB = 70, BIO = 100, RAD = 60, FIRE = 100, ACID = 100, WOUND = 15)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/heavymining
	strip_delay = 180
	equip_delay_other = 180
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/twohanded/kinetic_crusher, /obj/item/pickaxe, /obj/item/pickaxe/drill/jackhammer, /obj/item/shield/riot/goliath, /obj/item/shield/riot/roman)

/obj/item/clothing/suit/space/hardsuit/heavymining/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate,2,/obj/item/stack/sheet/animalhide/carpdragon, list(BULLET = 5, LASER = 10, BOMB = 5, RAD = 15, WOUND = 2.5))