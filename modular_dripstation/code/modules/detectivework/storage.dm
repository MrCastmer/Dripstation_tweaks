/obj/item/storage/box/swabs
	name = "box of swab kits"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'modular_dripstation/icons/obj/forensics.dmi'
	icon_state = "swabs"

/obj/item/storage/box/swabs/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/forensics/swab(src)

/obj/item/storage/box/fingerprints
	name = "box of fingerprint cards"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'modular_dripstation/icons/obj/forensics.dmi'
	icon_state = "detective"

/obj/item/storage/box/fingerprints/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/sample/print(src)