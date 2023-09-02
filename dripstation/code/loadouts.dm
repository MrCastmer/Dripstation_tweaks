
// ###### HOS ######
/datum/outfit/job/hos
	name = "Head of Security"
	jobtype = /datum/job/hos

	id_type = /obj/item/card/id/head
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/command/hos

	belt = /obj/item/gun/energy/e_gun
	ears = /obj/item/radio/headset/heads/hos/alt
	uniform = /obj/item/clothing/under/rank/head_of_security
	uniform_skirt = /obj/item/clothing/under/rank/head_of_security/skirt
	shoes = /obj/item/clothing/shoes/jackboots
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/jackboots
	suit = /obj/item/clothing/suit/armor/hos/trenchcoat
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/HoS/beret
	glasses = null
	suit_store = null	

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)

	pda_slot = SLOT_L_STORE

// ###### WARDEN ######
/datum/outfit/job/warden
	name = "Warden"
	jobtype = /datum/job/warden

	pda_type = /obj/item/modular_computer/tablet/pda/preset/warden

	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/warden
	uniform_skirt = /obj/item/clothing/under/rank/warden/skirt
	shoes = /obj/item/clothing/shoes/jackboots
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/jackboots
	suit = /obj/item/clothing/suit/armor/vest/warden/alt
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/warden
	glasses = null
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = /obj/item/gun/ballistic/shotgun/automatic/combat/compact

// ###### HOP ######
/datum/outfit/job/hop
	shoes = /obj/item/clothing/shoes/laceup

// ###### CAPTAIN ######
/datum/outfit/job/captain
	name = "Captain"
	jobtype = /datum/job/captain

	id_type = /obj/item/card/id/gold
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/command/cap

	glasses = /obj/item/clothing/glasses/hud/personnel
	ears = /obj/item/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/color/black
	uniform =  /obj/item/clothing/under/rank/captain
	uniform_skirt = /obj/item/clothing/under/rank/captain/skirt
	suit = /obj/item/clothing/suit/armor/vest/capcarapace
	shoes = /obj/item/clothing/shoes/laceup/brown
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/station_charter=1, /obj/item/gun/energy/e_gun=1) //yogs - adds egun/removes civ budget

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain

	implants = list(/obj/item/implant/mindshield)
	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

// ###### RESEARCH DIRECTOR ######
/datum/outfit/job/rd
	name = "Research Director"
	jobtype = /datum/job/rd

	id_type = /obj/item/card/id/head
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/command/rd

	ears = /obj/item/radio/headset/heads/rd
	glasses = null	
	uniform = /obj/item/clothing/under/rank/research_director
	uniform_skirt = /obj/item/clothing/under/rank/research_director/skirt
	shoes = /obj/item/clothing/shoes/laceup
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/laser_pointer
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/analyzer/ranged=1) //yogs - removes sci budget

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	duffelbag = /obj/item/storage/backpack/duffelbag/science

	chameleon_extras = /obj/item/stamp/rd

// ###### MIME ######
/datum/outfit/job/mime
	id_type = /obj/item/card/id/mime

	backpack_contents = list(
	/obj/item/book/mimery=1,
	/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing=1)

// ###### CHIEF ENGI ######
/datum/outfit/job/ce
	id_type = /obj/item/card/id/head

	belt = null
	shoes = /obj/item/clothing/shoes/workboots
	glasses = null

// ###### ROBOTICIST ######
/datum/outfit/job/roboticist
	suit = /obj/item/clothing/suit/toggle/labcoat/science/robo

// ###### CHIEF MEDICAL ######
/datum/outfit/job/cmo
	id_type = /obj/item/card/id/head

	belt = null
	glasses = null
	shoes = /obj/item/clothing/shoes/sneakers/white
	gloves = null
