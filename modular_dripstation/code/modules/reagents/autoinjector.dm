/obj/item/dnainjector
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "dnainjector"

/obj/item/reagent_containers/autoinjector/combat
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_ntcombat"

/obj/item/reagent_containers/autoinjector/combat/nanites
	icon_state = "hypo_nanites"

/obj/item/reagent_containers/autoinjector/combat/healermech
	icon_state = "hypo_nanites"

/obj/item/reagent_containers/autoinjector/medipen/resurrector
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_nanites"

/obj/item/reagent_containers/autoinjector/magillitis
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_vahlen"

/obj/item/reagent_containers/autoinjector/mixi
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_redpill"

/obj/item/reagent_containers/autoinjector/derm
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_redpill"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large
	icon = 'modular_dripstation/icons/obj/syringe.dmi'

/obj/item/reagent_containers/autoinjector/medipen/stimpack/large/redpill
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	icon_state = "hypo_redpill"

/obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor
	desc = "A superior stimulants autoinjector for use in combat situations. Has healing effect, can coagulate bleeding and rapidly reverse severe bloodloss."
	volume = 40
	amount_per_transfer_from_this = 40
	icon = 'modular_dripstation/icons/obj/syringe.dmi'
	list_reagents = list(/datum/reagent/medicine/stimulants = 5, /datum/reagent/medicine/morphine = 5, /datum/reagent/medicine/salbutamol = 5, /datum/reagent/medicine/tricordrazine = 5, /datum/reagent/medicine/omnizine = 10, /datum/reagent/medicine/coagulant = 2.5, /datum/reagent/iron = 3.5, /datum/reagent/medicine/salglu_solution = 4)