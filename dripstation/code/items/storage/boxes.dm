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