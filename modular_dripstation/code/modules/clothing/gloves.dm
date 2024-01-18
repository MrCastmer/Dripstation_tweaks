/obj/item/clothing/gloves/fingerless/bigboss/combat
	name = "\improper tactical fingerless gloves"
	desc = "These high-quality tactical gloves are made of genuine leather and suede. They provide thermal protection even without fingers covered. Looks expensive."
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "tacticalgloves"
	item_state = "tacticalgloves"
	siemens_coefficient = 1 // Bare fingers
	cold_protection = ARMS|HANDS
	heat_protection = ARMS|HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	armor = list(MELEE = 15, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50)
