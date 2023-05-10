/obj/item/clothing/under/syndicate/donk
	name = "Donk! Co. employee uniform"
	desc = "The standard employee uniform of Donk Co. Smells like minimum wage."
	mob_overlay_icon = 'dripstation/icons/mob/clothing/syndicate.dmi'
	icon = 'dripstation/icons/obj/clothing/syndicate.dmi'
	icon_state = "donk_cargo"
	item_state = "donk_cargo"
	alt_covers_chest = TRUE
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/donk/qm
	name = "Donk! Co. manager uniform"
	desc = "The standard uniform of Donk Co. managers. Direct all complaints here."
	icon_state = "donk_qm"
	item_state = "donk_qm"

/obj/item/clothing/under/syndicate/donk/combat
	name = "Donk! Co. security service uniform"
	desc = "Donk! Co. combat uniform. Urban camouflage, tear resistant, operation ready. May be a bit of suspicious find on NanoTrasen facilities."
	icon_state = "donk_combat"
	item_state = "donk_combat"

/obj/item/clothing/under/syndicate/donk/maid
	name = "tactical maid outfit"
	desc = "A 'tactical' turtleneck fashioned to the likeness of a maid outfit. Why the Syndicate has these, you'll never know."
	icon_state = "syndimaid"
	item_state = "syndimaid"

/obj/item/clothing/under/syndicate/donk/maid/Initialize()
	. = ..()
	var/obj/item/clothing/accessory/maidapron/syndicate/A = new (src)
	attach_accessory(A)

/obj/item/clothing/suit/hazardvest/donk
	name = "Donk! Co. employee vest"
	desc = "A vest used to easily identify employees. It has a name tag attached. It reads: 'Hello! My name is...' It's not filled in."
	mob_overlay_icon = 'dripstation/icons/mob/clothing/utility.dmi'
	icon = 'dripstation/icons/obj/clothing/utility.dmi'
	icon_state = "donk_cargo_vest"
	item_state = "donk_cargo_vest"

/obj/item/clothing/suit/hazardvest/donk/qm
	name = "Donk! Co. manager vest"
	desc = "A vest used to easily identify managers. It has a name tag attached. It reads: 'Hello! My name is... THE BOSS'"
	icon_state = "donk_qm_vest"
	item_state = "donk_qm_vest"

/obj/item/clothing/gloves/combat/maid
	name = "combat maid sleeves"
	desc = "These 'tactical' gloves and sleeves are fireproof and electrically insulated. Warm to boot."
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hands.dmi'
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	icon_state = "syndimaid_arms"
	item_state = "syndimaid_arms"

/obj/item/clothing/accessory/maidapron/syndicate
	name = "tactical maid apron"
	desc = "Practical? No. Tactical? Also no. Cute? Most definitely yes."
	mob_overlay_icon = 'dripstation/icons/mob/clothing/accessories.dmi'
	icon = 'dripstation/icons/obj/clothing/accessories.dmi'
	icon_state = "maidapronsynd"
	item_state = "maidapronsynd"

/obj/item/clothing/head/maidheadband/syndicate
	name = "tactical maid headband"
	desc = "Tacticute."
	icon_state = "syndieheadband"
	item_state = "syndieheadband"

