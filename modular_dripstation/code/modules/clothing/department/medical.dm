// ###### CMO ######
/obj/item/clothing/under/rank/chief_medical_officer
	icon_state = "cmo"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/cmo.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/cmo.dmi'
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/skirt
	icon_state = "cmo_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_medical_officer/alt
	icon_state = "cmo_alt"
	can_adjust = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/skirt/alt
	icon_state = "cmo_alt_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chief_medical_officer/turtleneck
	icon_state = "cmoturtle"
	can_adjust = TRUE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/chief_medical_officer/turtleneck/alt
	icon_state = "cmoturtle_blue"
	can_adjust = TRUE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/head/beret/cmo
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	icon_state = "beretcmowhite"

/obj/item/clothing/suit/hooded/wintercoat/medical/cmo/alt
	icon_state = "coatcmo_alt"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/head/hooded/winterhood/medical/cmo/alt
	icon_state = "winterhood_cmo_alt"
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'

// ###### PARAMED ######

// ###### Genecist ######
/obj/item/clothing/under/rank/geneticist
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/genetics.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/genetics.dmi'

/obj/item/clothing/under/rank/geneticist/skirt
	can_adjust = TRUE

// ###### Virology ######
/obj/item/clothing/under/rank/virologist
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/virology.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/virology.dmi'

/obj/item/clothing/under/rank/virologist/skirt
	can_adjust = TRUE


// ###### Chemistry ######
/obj/item/clothing/under/rank/chemist
	icon_state = "chemistry"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/chemistry.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/chemistry.dmi'

/obj/item/clothing/under/rank/chemist/skirt
	icon_state = "chemistry_skirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/chemist/pharma
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a pharmacist rank stripe on it."
	name = "pharmacist's jumpsuit"
	icon_state = "pharma"

/obj/item/clothing/under/rank/chemist/utility
	desc = "It's made of a special fiber that gives special protection against biohazards."
	name = "chemical protection undersuit"
	icon_state = "chem_protect"

/obj/machinery/vending/wardrobe/chem_wardrobe
	products = list(/obj/item/clothing/under/rank/chemist = 2,
					/obj/item/clothing/under/rank/chemist/skirt = 2,
					/obj/item/clothing/under/rank/chemist/pharma = 1,
					/obj/item/clothing/under/rank/chemist/utility = 1,
					/obj/item/clothing/shoes/sneakers/white = 2,
					/obj/item/clothing/suit/toggle/labcoat/chemist = 2,
					/obj/item/clothing/suit/hooded/wintercoat/medical/chemistry = 2,
					/obj/item/clothing/head/beret/chem = 2,
					/obj/item/storage/backpack/chemistry = 2,
					/obj/item/storage/backpack/satchel/chem = 2,
					/obj/item/storage/bag/chemistry = 4)

// ###### MD ######
/obj/item/clothing/under/rank/nursesuit

/obj/item/clothing/under/rank/medical
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/medical.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/medical.dmi'

/obj/item/clothing/under/rank/medical/blue
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/medical.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/medical.dmi'

/obj/item/clothing/under/rank/medical/green
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/medical.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/medical.dmi'

/obj/item/clothing/under/rank/medical/purple
	icon = 'modular_dripstation/icons/obj/clothing/uniform/medical/medical.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/medical/medical.dmi'

/obj/item/clothing/under/rank/medical/black
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in black."
	icon_state = "scrubsblack"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/scrcmo
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in CMO colors."
	icon_state = "scrubscmo"
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/skirt
	can_adjust = TRUE