// ###### Botany ######
/obj/item/clothing/under/rank/hydroponics
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/botany.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/botany.dmi'
	icon_state = "botany_jean"
	item_state = "g_suit"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/hydroponics/skirt
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/botany.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/botany.dmi'
	icon_state = "hydroponics_skirt"
	item_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/hydroponics/turtleneck
	name = "botanist's turtleneck"
	desc = "It's a tactical turtleneck designed to protect against minor plant-related hazards."
	icon_state = "hydroponics_turtle"

/obj/item/clothing/under/rank/hydroponics/turtleneckalt
	name = "botanist's turtleneck"
	desc = "It's a tactical turtleneck designed to protect against minor plant-related hazards. With additional pouches!"
	icon_state = "hydroponics_turtlealt"

/obj/item/clothing/under/rank/hydroponics/turtleneckalt/skirt
	name = "botanist's skirtleneck"
	desc = "It's a tactical skirtleneck designed to protect against minor plant-related hazards. With additional pouches!"
	icon_state = "hydroponics_turtlealt_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/machinery/vending/wardrobe/hydro_wardrobe
	products = list(/obj/item/storage/backpack/botany = 2,
					/obj/item/storage/backpack/satchel/hyd = 2,
					/obj/item/clothing/suit/hooded/wintercoat/hydro = 2,
					/obj/item/clothing/suit/apron = 2,
					/obj/item/clothing/suit/apron/overalls = 3,
					/obj/item/clothing/under/yogs/botanyuniform = 3,
					/obj/item/clothing/under/rank/hydroponics = 3,
					/obj/item/clothing/under/rank/hydroponics/skirt = 3,
					/obj/item/clothing/mask/bandana = 3,
					/obj/item/clothing/accessory/armband/hydro = 3)
	premium = list(/obj/item/clothing/under/rank/hydroponics/turtleneck = 1,
					/obj/item/clothing/under/rank/hydroponics/turtleneckalt = 1,
					/obj/item/clothing/under/rank/hydroponics/turtleneckalt/skirt = 1)

// ###### Janitor ######
/obj/item/clothing/under/rank/janitor
	icon_state = "janitor"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/janitor.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/janitor.dmi'

/obj/item/clothing/under/rank/janitor/skirt
	icon_state = "janitor_skirt"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/service/janitor.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/service/janitor.dmi'