// ###### hazard vests ######
/obj/item/clothing/suit/hazardvest
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	//lefthand_file = 'modular_dripstation/icons/mob/inhands/suits_lefthand.dmi'
	//righthand_file = 'modular_dripstation/icons/mob/inhands/suits_righthand.dmi'

/obj/item/clothing/suit/hazardvest/white
	name = "white hazard vest"
	desc = "A high-visibility vest used in work zones. This one bears the symbol of a disaster relief team!"
	icon_state = "hazard_w"	
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 30, FIRE = 40, ACID = 10)

/obj/item/clothing/suit/hazardvest/green
	name = "green hazard vest"
	desc = "A high-visibility vest used by emergency responders."
	icon_state = "hazard_g"

/obj/item/clothing/suit/hazardvest/blue
	name = "blue hazard vest"
	desc = "A high-visibility vest used in work zones. This one is blue!"
	icon_state = "hazard_b"

// ###### Engineer ######
/obj/item/clothing/under/rank/engineer
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engeneering/engineer.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engeneering/engineer.dmi'

/obj/item/clothing/under/rank/engineer/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/engineer/gorka
	icon_state = "engine_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// ###### Atmostech ######
/obj/item/clothing/under/rank/atmospheric_technician
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engeneering/atmos.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engeneering/atmos.dmi'

/obj/item/clothing/under/rank/atmospheric_technician/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/atmospheric_technician/gorka
	icon_state = "atmos_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// ######  Signaltech ######
/obj/item/clothing/under/yogs/rank/network_admin
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engeneering/signaltech.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engeneering/signaltech.dmi'

/obj/item/clothing/under/rank/network_admin/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/network_admin/gorka
	icon_state = "signaltech_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// ###### Chief Engineer ######
/obj/item/clothing/under/rank/chief_engineer
	icon = 'modular_dripstation/icons/obj/clothing/uniform/engeneering/chief.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/engeneering/chief.dmi'

/obj/item/clothing/under/rank/chief_engineer/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_engineer/alt
	icon_state = "chiefengineer_alt"

/obj/item/clothing/under/rank/chief_engineer/gorka
	icon_state = "chiefengineer_gorka"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION