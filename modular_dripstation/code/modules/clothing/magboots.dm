/obj/item/clothing/shoes/magboots
	alternate_worn_layer = BELT_LAYER
	var/magpulse_name = "mag-pulse traction system"
	item_state = "magboots"
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'

/obj/item/clothing/shoes/magboots/attack_self(mob/user)
	if(magpulse)
		clothing_flags &= ~NOSLIP
		slowdown = SHOES_SLOWDOWN
	else
		clothing_flags |= NOSLIP
		slowdown = slowdown_active
	magpulse = !magpulse
	icon_state = "[magboot_state][magpulse]"
	to_chat(user, span_notice("You [magpulse ? "enable" : "disable"] the [magpulse_name]."))
	user.update_inv_shoes()	//so our mob-overlays update
	user.update_gravity(user.has_gravity())
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/clothing/shoes/magboots/security
	armor = list(MELEE = 15, BULLET = 10, LASER = 5, ENERGY = 10, BOMB = 15, BIO = 20, RAD = 0, FIRE = 20, ACID = 50)

/obj/item/clothing/shoes/magboots/security/advanced
	name = "SWAT magboots"
	desc = "High speed, no drag combat-edition magboots issued by Nanotrasen Black Ops for extravehicular missions."
	armor = list(MELEE = 40, BULLET = 30, LASER = 25, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 30, FIRE = 90, ACID = 50, ELECTRIC = 100)
	icon_state = "cmagboots0"
	magboot_state = "cmagboots"
	slowdown_active = 0.5
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/magboots/security/advanced/attack_self(mob/user)
	. = ..()
	if(magpulse)
		clothing_flags &= ~NOSLIP | ~NOSLIP_ICE
	else
		clothing_flags |= NOSLIP | NOSLIP_ICE

/obj/item/clothing/shoes/magboots/security/advanced/synd
	name = "Syndicate Black Ops magboots"
	desc = "High speed, no drag combat-edition magboots issued by Syndicate Black Ops for extravehicular missions. DEFINITELY not stolen from a rival corporation."
	slowdown_active = 0.8

/obj/item/clothing/shoes/magboots/security/captain
	desc = "A relic predating magboots, these ornate greaves have retractable spikes in the soles to maintain grip."
	name = "captain's greaves"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'	
	icon_state = "capboots0"
	magboot_state = "capboots"
	magpulse_name = "anchoring spikes"
	slowdown_active = 2	

/obj/item/clothing/shoes/magboots/syndie
	slowdown_active = 1.5