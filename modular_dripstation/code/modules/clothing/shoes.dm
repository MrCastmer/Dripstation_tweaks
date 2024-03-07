/obj/item/clothing/shoes/combat
	icon_state = "combat"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/combat/noble
	name = "noble boots"
	desc = "The boots are economically designed to balance function and comfort, so that you can step on peasants without having to worry about blisters. The leather also resists unwanted blood stains."
	icon_state = "noble"

/obj/item/clothing/shoes/xeno_wraps/jackboots/combat
	name = "combat footwraps"
	desc = "Tactical footwraps that make your feet feel snug and secure, while still being breathable and light."
	icon_state = "footwraps_c"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	strip_delay = 2.5 SECONDS // Half time to take off
	equip_delay_other = 2.5 SECONDS // Half time
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 25, BIO = 30, RAD = 0, FIRE = 35, ACID = 20, ELECTRIC = 0)

/obj/item/clothing/shoes/jackboots
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/bhop
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/workboots
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'

/obj/item/clothing/shoes/workboots/mining
	custom_premium_price = 80
	icon = 'icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'icons/mob/clothing/feet/feet.dmi'

/obj/item/clothing/shoes/workboots/cargo
	name = "cargo boots"
	desc = "Steel-toed Nanotrasen-issue Cargo lace-up work boots for operating in hazardous environments. Electrically insulated and very good at keeping toes uncrushed."
	icon_state = "cargoboots"
	clothing_flags = NOSLIP_ICE
	resistance_flags = FIRE_PROOF
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	custom_premium_price = 80

/obj/item/clothing/shoes/workboots/cargo/aerostatic
	name = "aerostatic boots"
	desc = "Steel-toed Nanotrasen-issue Cargo lace-up work boots for operating in hazardous environments. This ones perform more fashion, being pre-polished!"
	icon_state = "aerostatic"