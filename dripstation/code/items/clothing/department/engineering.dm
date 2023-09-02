// ###### CHIEF ENGINEER ######

/obj/item/clothing/under/yogs/ceturtleneck/skirt
	name = "chief engineer turtleneck"
	icon = 'dripstation/icons/obj/clothing/uniform/engineering/chief_engi.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/engineering/chief_engi.dmi'
	icon_state = "ce_turtleneck_skirt"
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_engineer/overalls
	name = "chief engineer's overalls"
	desc = "Good at protecting you from all kinds of sharp and radioactive fragments that may come on your way."	
	icon = 'dripstation/icons/obj/clothing/uniform/engineering/chief_engi.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/engineering/chief_engi.dmi'
	icon_state = "chiefengineer_alt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chief_engineer/overalls/skirt
	name = "chief engineer's overalls skirt"
	icon_state = "chiefengineer_skirt"
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	can_adjust = FALSE

/obj/item/clothing/neck/cloak/ce/alt
	name = "chief engineer's green cloak"
	icon_state = "cecloak_green"

/obj/item/clothing/head/beret/ce
	name = "chief engineer's white beret"
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/beret/ce/alt
	name = "chief engineer's beret"
	desc = "A fancy beret designed exactly to the Chief Engineer's tastes, minus the LEDs."
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	icon_state = "ceberet"

/obj/item/clothing/gloves/chief_engineer
	name = "advanced insulated gloves"
	desc = "These gloves provide excellent heat and electric insulation. They are so thin you can barely feel them."
	icon_state = "ce_insuls"
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/gloves.dmi'	
	siemens_coefficient = 0
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list(MELEE = 5, BULLET = 5, LASER = 15, ENERGY = 45, BOMB = 5, BIO = 5, FIRE = 80, ACID = 15)

/obj/item/clothing/glasses/meson/sunglasses
	icon_state = "sunmeson"
	item_state = "aviator_eng"
	icon = 'dripstation/icons/obj/clothing/eyes.dmi'		
	mob_overlay_icon = 'dripstation/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/clothing/glasses_righthand.dmi'		

// ###### ATMOS ######
/obj/item/clothing/under/rank/atmospheric_technician/overalls
	name = "atmospheric technician's overalls"
	desc = "Good at protecting you from all kinds of hot and burning fragments that may come on your way."	
	icon = 'dripstation/icons/obj/clothing/uniform/engineering/atmos.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/engineering/atmos.dmi'
	icon_state = "atmos"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/atmospheric_technician/overalls/skirt
	name = "atmospheric technician's overalls skirt"
	icon_state = "atmos_skirt"
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	can_adjust = FALSE	

/obj/item/clothing/mask/gas/atmos
	name = "atmospheric gas mask"
	desc = "Improved gas mask utilized by atmospheric technicians. It's flameproof!"
	icon_state = "gas_atmos"
	icon = 'dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/masks.dmi'		
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 30, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF

// ###### ENGI ######
/obj/item/clothing/accessory/armband/engine
	name = "engineering armband"

/obj/item/clothing/suit/hazardvest
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	item_state = "hazard"	
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'

/obj/item/clothing/suit/hazardvest/white
	name = "white hazard vest"
	desc = "A high-visibility vest used in work zones. This one bears the symbol of a disaster relief team!"
	icon_state = "hazard_w"
	item_state = "hazard_w"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 30, FIRE = 40, ACID = 10)

/obj/item/clothing/suit/hazardvest/green
	name = "green hazard vest"
	desc = "A high-visibility vest used by emergency responders."
	icon_state = "hazard_g"
	item_state = "hazard_g"

/obj/item/clothing/suit/hazardvest/blue
	name = "blue hazard vest"
	desc = "A high-visibility vest used in work zones. This one is blue!"
	icon_state = "hazard_b"
	item_state = "hazard_b"

// ###### HAZARD TECH ######

/obj/item/clothing/under/rank/engineer/hazard
	name = "hazard technician's jumpsuit"

/obj/item/clothing/under/rank/engineer/hazard/overalls
	name = "hazard technician's overalls"
	desc = "Good at protecting you from all kinds of sharp and radioactive fragments that may come on your way."	
	icon_state = "engine"
	icon = 'dripstation/icons/obj/clothing/uniform/engineering/haz_tech.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/engineering/haz_tech.dmi'

/obj/item/clothing/under/rank/engineer/hazard/overalls/skirt
	name = "hazard technician's overalls skirt"
	icon_state = "engie_skirt"
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE	

/obj/item/clothing/shoes/workboots/black
	name = "black work boots"
	icon_state = "workbootsblack"
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'	

/obj/item/clothing/head/hooded/winterhood/engineering/haztech
	desc = "A black and orange winter coat hood."
	icon_state = "hood_hazard"
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/suit/hooded/wintercoat/engineering/haztech
	name = "hazard winter coat"
	desc = "A black and orange winter coat. The zipper pull-tab is made to look like a miniature radioactive sign."
	icon_state = "coathazard"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'	
	hoodtype = /obj/item/clothing/head/hooded/winterhood/engineering/haztech

/obj/item/clothing/head/beret/haz
	name = "hazard beret"
	desc = "An orange beret, to signify who is responsible for putting the plasma fires out."
	icon_state = "berethaz"
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'		
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 10, FIRE = 10, ACID = 10, WOUND = 0)
