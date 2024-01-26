/obj/item/clothing/gloves/color/black
	var/fingerless_variation = /obj/item/clothing/gloves/fingerless

/obj/item/clothing/gloves/color/black/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER)
		if(can_be_cut && icon_state == initial(icon_state))//only if not dyed
			to_chat(user, span_notice("You snip the fingertips off of [src]."))
			I.play_tool_sound(src)
			var/obj/item/clothing/gloves/fingerless/FG = fingerless_variation
			new FG(drop_location())
			qdel(src)
	..()


/obj/item/clothing/gloves/color/black/tactifool
	name = "tactical black gloves"
	desc = "Standart tactical gloves issued for use with security low rank personnel."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "combat"
	item_state = "black_tactifool"
	can_be_cut = 1
	fingerless_variation = /obj/item/clothing/gloves/fingerless/tactifool

/obj/item/clothing/gloves/fingerless/tactifool
	name = "tactical fingerless gloves"
	desc = "Plain tactical gloves issued for use with security low rank personnel. These are without fingertips."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "combat_fingerless"
	item_state = "fingerless_tactifool"

/obj/item/clothing/gloves/fingerless/bigboss/combat
	name = "\improper tactical fingerless gloves"
	desc = "These high-quality tactical gloves are made of genuine leather and suede. They provide thermal protection even without fingers covered. Looks expensive."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "combat_fingerless"
	item_state = "tacticalgloves"
	cold_protection = ARMS|HANDS
	heat_protection = ARMS|HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	armor = list(MELEE = 15, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50, WOUND = 0, ELECTRIC = 0)
