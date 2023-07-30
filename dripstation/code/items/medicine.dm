/obj/item/reagent_containers/autoinjector/medipen/mutadone
	name = "mutadone medipen"
	desc = "A rapid and safe way to treat genetic damage for personnel without advanced medical knowledge. Contains a powerful reagent to remove genetic mutations."
	icon_state = "medipen"
	item_state = "medipen"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	amount_per_transfer_from_this = 20
	volume = 20
	ignore_flags = 1 //so you can medipen through hardsuits
	reagent_flags = DRAWABLE
	flags_1 = null
	list_reagents = list(/datum/reagent/medicine/mutadone = 20)
	custom_price = 180
