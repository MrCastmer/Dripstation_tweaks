/datum/supply_pack
	var/order_limit = -1 // The number of times one can order a cargo crate, before it becomes restricted. -1 for infinite
	var/times_ordered = 0 // Number of times a crate has been ordered in a shift
	var/order_limit_in_one_order = -1 // The number of times one can order a cargo crate, before it becomes restricted. -1 for infinite
	var/times_ordered_in_one_order = 0 // Number of times a crate has been ordered in one package

//specialops edit
/datum/supply_pack/emergency/specialops
	desc = "(*!&@#TOO CHEAP FOR THAT NULL_ENTRY, HUH OPERATIVE? WELL, THIS LITTLE ORDER CAN STILL HELP YOU OUT IN A PINCH. CONTAINS A BOX OF FIVE EMP GRENADES, THREE SMOKEBOMBS, AN INCENDIARY GRENADE, A \"SLEEPY PEN\" FULL OF NICE TOXINS AND YOUR NEW GEAR!#@*$"
	cost = 6000
	order_limit = 2
	contains = list(/obj/item/storage/box/emps,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/pen/blue/sleepy,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/clothing/glasses/night,
					/obj/item/storage/belt/holster/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/under/syndicate/combat,
					/obj/item/clothing/shoes/combat)
	crate_name = "crate"
	crate_type = /obj/structure/closet/crate

//telepad for black market
/datum/supply_pack/costumes_toys/blackmarket_telepad
	name = "Black Market LTSRBT"
	desc = "Need a faster and better way of transporting your illegal goods from and to the \
		station? Fear not, the Long-To-Short-Range-Bluespace-Transceiver (LTSRBT for short) \
		is here to help. Contains a LTSRBT circuit, two bluespace crystals, and one ansible."
	cost = 26000
	contraband = TRUE
	contains = list(/obj/item/circuitboard/machine/ltsrbt,
					/obj/item/stack/ore/bluespace_crystal/artificial = 2,
					/obj/item/stock_parts/subspace/ansible)
	crate_name = "crate"

//nullcrate check
/datum/supply_pack/emergency/nullcrate
	name = "NULL_ENTRY"
	desc = "(#@&^$THIS IS YOUR LOVELY PACKAGE THAT CONTAINS SOME RANDOM SYNDICATE STUFF. GIVE EM HELL, OPERATIVE@&!*()"
	hidden = TRUE
	order_limit_in_one_order = 2
	order_limit = 10
	cost = 12000
	crate_name = "crate"
	crate_type = /obj/structure/closet/crate
	contains = list()

/datum/supply_pack/emergency/nullcrate/fill(obj/structure/closet/crate/C)
	switch (rand(0,3))
		if(0)
			new /obj/item/gun/ballistic/automatic/pistol(C)
			new /obj/item/ammo_box/magazine/m10mm(C)
			new /obj/item/ammo_box/magazine/m10mm(C)
		if(1)
			new /obj/item/gun/ballistic/rifle/boltaction(C)
			new /obj/item/ammo_box/a762(C)
		if(2)
			new /obj/item/gun/ballistic/automatic/toy/pistol/riot(C)
			new /obj/item/ammo_box/magazine/toy/pistol/riot(C)
			new /obj/item/ammo_box/foambox/riot(C)
		if(3)
			new /obj/item/pen/red/edagger(C)
			new /obj/item/grenade/plastic/c4(C)
	for(var/i in 1 to 2)
		//Gear
		var/item = pick(/obj/item/clothing/shoes/magboots/syndie,
					/obj/item/clothing/gloves/fingerless/bigboss,
					/obj/item/storage/backpack/duffelbag/syndie,
					/obj/item/storage/belt/chameleon/syndicate,
					/obj/item/clothing/under/chameleon,
					/obj/item/clothing/suit/chameleon,
					/obj/item/flashlight/emp,
					/obj/item/syndicateReverseCard,
					/obj/item/camera_bug,
					/obj/item/storage/toolbox/syndicate)
		new item(C)
		//Misk
		item = pick(/obj/item/storage/box/syndie_kit/cutouts,
					/obj/item/disk/nuclear/fake,
					/obj/item/toy/plush/carpplushie/dehy_carp,
					/obj/item/storage/pill_bottle/gummies/omnizine,
					/obj/item/storage/pill_bottle/gummies/sleepy,
					/obj/item/storage/fancy/cigarettes/cigpack_syndicate,
					/obj/item/stack/tape/guerrilla,
					/obj/item/soap/syndie,
					/obj/item/flashlight/lantern/syndicate,
					/obj/item/storage/box/syndie_kit/bugs,
					/obj/item/computer_hardware/hard_drive/portable/syndicate/ntnet_dos,
					/obj/item/storage/box/syndie_kit/throwing_weapons,
					/obj/item/multitool/ai_detect,
					/obj/item/stamp/syndiround,
					/obj/item/suppressor)
		new item(C)

/datum/supply_pack/costumes_toys/randomised/syndicate
	name = "Tactical Crate"
	desc = "(*!&@#UH THIS IS ANOTHER OPTION. YOU WANNA HAVE SOME DRIP? WELL, ITS YOURS, BUT FOR THE FAIR PRICE, OPERATIVE.#@*$"
	hidden = TRUE
	cost = 2000
	num_contained = 1
	contains = list(/obj/item/storage/box/donkdrip,
					/obj/item/storage/box/donkdrip/combat,
					/obj/item/storage/box/donkdrip/maid)
	crate_name = "crate"

/datum/supply_pack/costumes_toys/wardrobes/security
	name = "Law and Order Wardrobe Supply Crate"
	desc = "This crate contains refills for the SecDrobe, DetDrobe and LawDrobe."
	cost = 2000
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe,
					/obj/item/vending_refill/wardrobe/law_wardrobe,
					/obj/item/vending_refill/wardrobe/det_wardrobe)

/datum/supply_pack/security/tackler
	name = "Gripper Gloves Crate"
	desc = "Contains three pairs of gripper gloves. Requires Security access to open."
	cost = 1000
	contains = list(/obj/item/clothing/gloves/tackler,
					/obj/item/clothing/gloves/tackler,
					/obj/item/clothing/gloves/tackler)
	crate_name = "gripper crate"

/datum/supply_pack/security/armory/swat
	desc = "Contains two fullbody sets of tough, fireproof, pressurized suits designed in a joint effort by Terragov and Nanotrasen. Each set contains a suit, helmet, mask, combat belt, and NT brand tackler gloves. Requires Armory access to open."
	contains = list(/obj/item/clothing/head/helmet/swat/nanotrasen,
					/obj/item/clothing/head/helmet/swat/nanotrasen,
					/obj/item/clothing/suit/space/swat,
					/obj/item/clothing/suit/space/swat,
					/obj/item/clothing/mask/gas/sechailer/swat,
					/obj/item/clothing/mask/gas/sechailer/swat,
					/obj/item/storage/belt/military/assault,
					/obj/item/storage/belt/military/assault,
					/obj/item/clothing/gloves/tackler/nt,
					/obj/item/clothing/gloves/tackler/nt)

/datum/supply_pack/security/securityclothes
	contains = list(/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/under/rank/security/warden/navyblue,
					/obj/item/clothing/suit/armor/wardenjacket,
					/obj/item/clothing/head/beret/sec/navywarden)

/datum/supply_pack/security/armory/laserarmor
	name = "Reflective Armor Crate"
	desc = "Contains two vests and two helmets of highly reflective material. Each armor piece diffuses a laser's energy by over half, as well as offering a good chance to reflect the laser entirely. Requires Armory access to open."
	cost = 3000
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/head/helmet/laserproof/raised,
					/obj/item/clothing/head/helmet/laserproof/raised)

/datum/supply_pack/clearance/heavymining
	name = "Old Mining Hardsuit Crate"
	desc = "Contains one old specialised piece of equipment."
	cost = 3000
	order_limit = 1
	contains = list(/obj/item/clothing/suit/space/hardsuit/heavymining)

/datum/supply_pack/security/armory/mindshield
	desc = "Prevent against radical thoughts with three Mindshield implants. Requires Armory access to open."

/datum/supply_pack/security/armory/amnestic
	name = "Amnestic Implants Crate"
	desc = "Revert radical thoughts with three Amnestic implants. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/storage/lockbox/amnestic)
	crate_name = "amnestic implant crate"

/datum/supply_pack/security/armory/hos
	name = "Head of Security Armor Crate"
	desc = "Contains set of HoS heavy armor."
	cost = 5000
	order_limit = 1
	special = TRUE
	crate_type = /obj/structure/closet/crate/secure/weapon
	contains = list(/obj/item/clothing/head/helmet/HoS,
					/obj/item/clothing/suit/armor/riot/hos)
	crate_name = "hos supply crate"

/datum/supply_pack/weaponry/ballistic
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains three Militech-designed Combat Shotguns, and three Shotgun Bandoliers. Requires Armory access to open."

/datum/supply_pack/weaponry/ballistic_single
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains one Militech-designed Combat Shotgun, and one Shotgun Bandolier. Requires Armory access to open."