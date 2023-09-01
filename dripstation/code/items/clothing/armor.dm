//Engineering
/obj/item/clothing/head/helmet/space/hardsuit/engine
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 10) //WHY fireres?
	resistance_flags = null // Just WHY?

/obj/item/clothing/suit/space/hardsuit/engine
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 10) //WHY fireres?
	resistance_flags = null // Just WHY?

/obj/item/clothing/head/helmet/space/hardsuit/ert
	armor = list(MELEE = 45, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 50, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10)

/obj/item/clothing/suit/space/hardsuit/ert
	armor = list(MELEE = 45, BULLET = 40, LASER = 40, ENERGY = 35, BOMB = 50, BIO = 100, RAD = 100, FIRE = 80, ACID = 80, WOUND = 10)
	slowdown = 0.5

/obj/item/clothing/suit/space/hardsuit/deathsquad
	slowdown = 0.7

/obj/item/clothing/suit/armor/riot
	armor = list(MELEE = 50, BULLET = 10, LASER = 10, ENERGY = 40, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 80, WOUND = 30)

/obj/item/clothing/head/helmet/riot
	armor = list(MELEE = 45, BULLET = 15, LASER = 5, ENERGY = 35, BOMB = 5, BIO = 2, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/head/helmet/swat
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayhelmet.dmi'

/obj/item/clothing/suit/armor/vest/russian
	name = "bulletproof slav chest rig"
	desc = "A bulletproof robust vest with forest camo. Good thing there's plenty of forests to hide in around here, right?"
	icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayarmor.dmi'
	icon_state = "rus_carrier"
	item_state = "rus_carrier"
	body_parts_covered = CHEST|GROIN
	armor = list(MELEE = 25, BULLET = 50, LASER = 25, ENERGY = 15, BOMB = 40, BIO = 0, RAD = 20, FIRE = 20, ACID = 50, WOUND = 15)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/chestrig

/datum/component/storage/concrete/pockets/chestrig
	quickdraw = TRUE
	max_combined_w_class = 3

/datum/component/storage/concrete/pockets/chestrig/Initialize()
	. = ..()
	set_holdable(list(	/obj/item/reagent_containers/autoinjector/medipen,
						/obj/item/radio,
						/obj/item/ammo_box/a762))

/obj/item/clothing/head/helmet/rus_helmet
	name = "/improper Altin helmet"
    icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayhelmet.dmi'
	armor = list(MELEE = 30, BULLET = 45, LASER = 20, ENERGY = 10, BOMB = 40, BIO = 0, RAD = 20, FIRE = 30, ACID = 50, WOUND = 5)

/obj/item/clothing/head/helmet/rus_ushanka
	armor = list(MELEE = 10, BULLET = 5, LASER = 5,ENERGY = 20, BOMB = 5, BIO = 50, RAD = 20, FIRE = -10, ACID = 0, WOUND = 5)

/obj/item/clothing/head/helmet/laserproof
    name = "reflective helmet"
    desc = "A helmet that excels in protecting the wearer against energy projectiles, as well as occasionally reflecting them."
    icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayhelmet.dmi'
    icon_state = "ablative_helmet"
	item_state = "ablative_helmet"
    armor = list(MELEE = 5, BULLET = 5, LASER = 60, ENERGY = 50, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 50

/obj/item/clothing/head/helmet/laserproof/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/armor/laserproof
    icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayarmor.dmi'
	icon_state = "ablative"
	item_state = "ablative"

/obj/item/clothing/suit/armor/vest/bulletproof
	armor = list(MELEE = 15, BULLET = 60, LASER = 10, ENERGY = 10, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)

/obj/item/clothing/suit/armor/vest/combat
    name = "combat vest"
	desc = "Type III bulletproof armor usually issued to paramilitary groups and real soldiers alike. Protects full body and arms. Has additional armor against energy based weaponry."
    icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayarmor.dmi'
    icon_state = "combat"
	item_state = "combat"
    body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
    blood_overlay_type = "armor"
	armor = list(MELEE = 15, BULLET = 60, LASER = 20, ENERGY = 20, BOMB = 50, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/vest/slick
	name = "\improper Slick Plate Carrier"
	desc = "A simple yet effective bulletproof armor. The most minimalistic design offers reliable protection of the chest."
	icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayarmor.dmi'
    icon_state = "slick"
	item_state = "slick"
    body_parts_covered = CHEST
    blood_overlay_type = "armor"
	armor = list(MELEE = 5, BULLET = 80, LASER = 30, ENERGY = 20, BOMB = 60, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 20)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/swat/syndicate
    name = "assault armor"
	desc = "A heavily armored suit that protects against moderate damage. Used by high ranking PMC operatives across human space. This one is kinda suspicious colored."
    icon = 'dripstation/icons/obj/bayicon.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/bay/bayarmor.dmi'
    icon_state = "heavys"
	item_state = "heavys"
    flags_inv = null
    slowdown = 0.3