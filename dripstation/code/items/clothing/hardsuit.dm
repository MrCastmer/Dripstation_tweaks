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
	desc = "A special prototipe suit that protects against agressive, hazardous, low pressure environments and has some bullet and laser protection. Previously used by Nanotrasen in deep space expeditions. Has reinforced plating for wildlife encounters and light cargo exoskelet."
	item_state = "hardsuit-hvymining"
	icon_state = "hardsuit-hvymining"
	hardsuit_type = "hvymining"
	icon = 'dripstation/icons/obj/clothing/hardsuits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hardsuits.dmi'
	slowdown = 0.5
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

// sec override

/obj/item/clothing/head/helmet/space/hardsuit/security
	desc = "A standart security helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "sec_helm0"
	item_state = "sec_helm"

/obj/item/clothing/suit/space/hardsuit/security
	desc = "A standart issue security suit that protects against hazardous, low pressure environments. Has an additional layer of armor."
	icon_state = "sec_hardsuit"
	item_state = "sec_hardsuit"

/obj/item/clothing/head/helmet/space/hardsuit/security/pilot
	name = "security pilots's hardsuit helmet"
	desc = "A special security helmet designed for long-term operations in a hazardous, low pressure environment. Has an additional layer of armor for wildlife encounters."
	icon_state = "pilot_helm0"
	item_state = "pilot_helm"
	armor = list(MELEE = 45, BULLET = 25, LASER = 30, ENERGY = 0, BOMB = 50, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20)

/obj/item/clothing/suit/space/hardsuit/security/pilot
	name = "security pilots's hardsuit"
	desc = "A special security suit designed for long-term operations in hazardous, low pressure environments. Has an additional layer of armor for wildlife encounters."
	icon_state = "pilot_hardsuit"
	item_state = "pilot_hardsuit"
	armor = list(MELEE = 45, BULLET = 25, LASER = 30, ENERGY = 0, BOMB = 50, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/pilot

/obj/item/clothing/head/helmet/space/hardsuit/security/warden
	name = "warden's hardsuit helmet"
	desc = "A special bulky spaceproof helmet worn by the NT security low-rank command staff. Has additional energy protection."
	icon_state = "warden_helm0"
	item_state = "warden_helm"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 20, BOMB = 45, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20)

/obj/item/clothing/suit/space/hardsuit/security/warden
	name = "warden's hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has additional energy protection."
	icon_state = "warden_hardsuit"
	item_state = "warden_hardsuit"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 20, BOMB = 45, BIO = 100, RAD = 50, FIRE = 85, ACID = 85, WOUND = 20)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/warden

/obj/item/clothing/head/helmet/space/hardsuit/security/hos
	name = "head of security's hardsuit helmet"
	desc = "A special bulky helmet worn by the NT security elite. Heavy armoured, space ready and somewhat fire resistant."
	icon_state = "sechos_helm0"
	item_state = "sechos_helm"

/obj/item/clothing/suit/space/hardsuit/security/hos
	name = "head of security's hardsuit"
	desc = "A special bulky suit that protects against various hazardous, low pressure environments. Heavy armoured, space ready and somewhat fire resistant."
	icon_state = "sechos_hardsuit"
	item_state = "sechos_hardsuit"
	slowdown = 1.1