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

// Syndie kit
/obj/item/storage/box/donkdrip
	illustration = null	

/obj/item/storage/box/donkdrip/PopulateContents()
	new /obj/item/clothing/under/syndicate/donk(src)
	new /obj/item/clothing/suit/hazardvest/donk(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)

/obj/item/storage/box/donkdrip/combat

/obj/item/storage/box/donkdrip/combat/PopulateContents()
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/under/syndicate/donk/combat(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)

/obj/item/storage/box/donkdrip/maid

/obj/item/storage/box/donkdrip/maid/PopulateContents()
	new /obj/item/clothing/head/maidheadband/syndicate(src)
	new /obj/item/clothing/under/syndicate/donk/maid(src)
	new /obj/item/clothing/gloves/combat/maid(src)
	new /obj/item/clothing/shoes/combat(src)