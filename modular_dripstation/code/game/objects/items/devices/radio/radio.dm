/obj/item/radio
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/security
	icon = 'modular_dripstation/icons/obj/radio.dmi'

/obj/item/radio/headset/headset_cargo
	name = "supply radio headset"
	desc = "A headset used by QM`s slaves."

/obj/item/radio/headset/qm
	name = "quartermaster`s radio headset"
	desc = "The headset of the guy who will one day be second on command."
	icon_state = "qm_headset"
	keyslot = new /obj/item/encryptionkey/heads/qm

/obj/item/radio/headset/qm/alt
	name = "quartermaster`s bowman headset"
	desc = "Do you see the crates? Load into crates. When you finish, you will receive crates. If you lose crates, you will get crates. If you finish the crates, you'll get nothing. You cum in the shuttle, you get ten credits. If you break ten credits, you'll get nothing. Do you see the shuttle? Load into shuttle."
	icon_state = "qm_headset"

/obj/item/radio/headset/qm/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))