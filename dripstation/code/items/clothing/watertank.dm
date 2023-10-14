/obj/item/reagent_containers/chemtank
	icon = 'dripstation/icons/obj/bayicon.dmi'
	icon_state = "waterbackpackchem"
	item_state = "waterbackpackchem"
	lefthand_file = 'dripstation/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/equipment/backpack_righthand.dmi'

/obj/item/watertank/op
	icon_state = "waterbackpackop"
	item_state = "waterbackpackop"

/obj/item/reagent_containers/spray/mister/op
	icon_state = "misterop"
	item_state = "misterop"
	lefthand_file = 'dripstation/icons/mob/inhands/equipment/mister_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/equipment/mister_righthand.dmi'

//Security tank
/obj/item/watertank/pepperspray
	name = "ANTI-TIDER-2500 suppression backpack"
	desc = "The ultimate crowd-control device; this tool allows the user to quickly and efficiently pacify groups of hostile targets."
	icon = 'dripstation/icons/obj/bayicon.dmi'
	icon_state = "pepperbackpacksec"
	item_state = "pepperbackpacksec"
	custom_price = 1000
	lefthand_file = 'dripstation/icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/equipment/backpack_righthand.dmi'

/obj/item/watertank/pepperspray/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/condensedcapsaicin, 500)

/obj/item/reagent_containers/spray/mister/pepperspray
	name = "security spray nozzle"
	desc = "A pacifying spray nozzle attached to a pepperspray tank, designed to silence perps."
	icon = 'dripstation/icons/obj/bayicon.dmi'
	icon_state = "mistersec"
	item_state = "mistersec"
	lefthand_file = 'dripstation/icons/mob/inhands/equipment/mister_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/equipment/mister_righthand.dmi'
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5, 10)
	current_range = 6

/obj/item/watertank/pepperspray/make_noz()
	return new /obj/item/reagent_containers/spray/mister/pepperspray(src)

/obj/item/reagent_containers/spray/mister/pepperspray/mode_change_message(mob/user)
	to_chat(user, span_notice("You [amount_per_transfer_from_this == 10 ? "remove" : "affix"] the nozzle. You'll now use [amount_per_transfer_from_this] units per spray."))