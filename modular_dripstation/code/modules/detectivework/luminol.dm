/obj/item/reagent_containers/spray/luminol
	name = "luminol bottle"
	desc = "A bottle containing an odourless, colorless liquid."
	icon = 'modular_dripstation/icons/obj/forensics.dmi'
	icon_state = "luminol"
	item_state = "cleaner"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10)
	volume = 100

/obj/item/reagent_containers/spray/luminol/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/luminol, 100)

/datum/chemical_reaction/luminol
	name = "Luminol"
	results = list(/datum/reagent/luminol = 6)
	required_reagents = list(/datum/reagent/hydrogen = 2, /datum/reagent/carbon = 2, /datum/reagent/ammonia = 2)

/datum/reagent/luminol
	name = "Luminol"
	description = "A compound that interacts with blood on the molecular level."
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#f2f3f4"

/datum/reagent/luminol/touch_obj(obj/O)
	O.reveal_blood()

/datum/reagent/luminol/touch_mob(mob/living/L)
	L.reveal_blood()