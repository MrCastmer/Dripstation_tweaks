// ###### RD ######
/obj/item/clothing/suit/toggle/labcoat/science/rd
	name = "research directors labcoat"
	desc = "A Nanotrasen special fancy labcoat for Research Directors."
	icon_state = "labcoat_rd"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/suit/toggle/labcoat/science/rd/brown
	name = "research directors brown labcoat"
	desc = "Gives the old man vibes, but thats the point."
	icon_state = "labcoat_rd_brown"

/obj/item/clothing/suit/toggle/labcoat/science/rd/purple
	name = "research directors purple labcoat"
	desc = "More purple than the standard model."
	icon_state = "labcoat_rd_purple"	

/obj/item/clothing/under/rank/research_director/alt
	icon = 'dripstation/icons/obj/clothing/uniform/research/research_director.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/research/research_director.dmi'
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	can_adjust = FALSE

/obj/item/clothing/head/beret/rd
	desc = "A brown beret with a science insignia emblazoned on it. It has that authentic burning plasma smell, with a hint of tritium."	
	icon_state = "beretrdalt"
	icon = 'dripstation/icons/obj/clothing/hats.dmi'	
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/beret/rd/white
	name = "research director white beret"
	desc = "A white beret with a golden science insignia emblazoned on it. It has that authentic burning plasma smell, with a hint of tritium."
	icon_state = "beretrd"

/obj/item/clothing/glasses/sunglasses/reagent/sci
	name = "science glasses"
	desc = "A pair of tacky purple sunglasses that allow the wearer to recognize various chemical compounds with only a glance."
	icon_state = "sunhudsci"	
	icon = 'dripstation/icons/obj/clothing/eyes.dmi'		
	mob_overlay_icon = 'dripstation/icons/mob/clothing/eyes.dmi'
	glass_colour_type = /datum/client_colour/glass_colour/purple

/obj/item/clothing/glasses/welding/superior
	name = "superior welding goggles"
	desc = "Welding goggles made from more expensive materials, strangely smells like potatoes."
	icon_state = "welding-upgraded"
	item_state = "welding-upgraded"
	lefthand_file = 'dripstation/icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/clothing/glasses_righthand.dmi'		
	icon = 'dripstation/icons/obj/clothing/eyes.dmi'		
	mob_overlay_icon = 'dripstation/icons/mob/clothing/eyes.dmi'	
	custom_materials = null // Don't want that to go in the autolathe
	tint = 0
	visor_vars_to_toggle = VISOR_FLASHPROTECT
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/science/night
	icon = 'dripstation/icons/obj/clothing/eyes.dmi'		
	mob_overlay_icon = 'dripstation/icons/mob/clothing/eyes.dmi'
	glass_colour_type = /datum/client_colour/glass_colour/green

// ###### SCIENTIST ######

/obj/item/clothing/shoes/sandal/white
	name = "white sandals"
	desc = "Medical sandals that nerds wear."
	icon_state = "medsandal"
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'		
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'	

/obj/item/clothing/head/beret/sci
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/accessory/armband/science
	name = "science armband"
	desc = "An armband, worn by the crew to display which department they're assigned to. This one is purple."

/obj/item/clothing/head/cone
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/suit/toggle/labcoat/mad
	icon_state = "labcoat_green"

// ###### ROBOTICIST ######

/obj/item/clothing/head/beret/sci/robotics
	name = "roboticist's beret"
	desc = "A roboticist's beret. It strongly smells of oil."
	icon_state = "beretrobo"

/obj/item/clothing/suit/toggle/labcoat/science/robo
	name = "roboticist's labcoat"
	desc = "A black suit that protects against minor chemical spills. Has a red stripe on the shoulder."
	icon_state = "labcoat_roboblack"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/suit/hooded/wintercoat/science/robotics
	name = "robotics winter coat"
	desc = "A black winter coat with a badass flaming robotic skull for the zipper tab. This one has bright red designs and a few useless buttons."
	icon_state = "coatrobotics"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'	
	allowed = list(/obj/item/analyzer, /obj/item/jawsoflife, /obj/item/screwdriver, /obj/item/wirecutters, /obj/item/weldingtool, /obj/item/wrench, /obj/item/crowbar, /obj/item/handdrill,  /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/beaker, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/box/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/science/robotics

/obj/item/clothing/head/hooded/winterhood/science/robotics
	name = "science winter hood"
	desc = "A black winter coat hood. You can pull it down over your eyes and pretend that you're an outdated, late 1980s interpretation of a futuristic mechanized police force. They'll fix you. They fix everything."
	icon_state = "winterhood_robotics"
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/welding/flame
	name = "flame welding helmet"
	desc = "A painted welding helmet, this one looks like it's burning."
	icon_state = "flamewelding"	
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/welding/flame/blue
	name = "blue flame welding helmet"
	desc = "A painted welding helmet, this one looks like it's ... cold burning?"
	icon_state = "blueflamewelding"	

/obj/item/clothing/head/welding/flame/symbols
	name = "oriental welding helmet"
	desc = "A painted welding helmet, has some oriental symbols on it."
	icon_state = "yuki_matsuda"	



