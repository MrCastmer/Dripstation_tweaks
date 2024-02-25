/obj/item/storage/box/captain/PopulateContents()
	new /obj/item/clothing/mask/breath/tactical(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/crowbar/red(src)

/obj/item/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."

/obj/item/storage/box/holobadge/New()
	..()
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)