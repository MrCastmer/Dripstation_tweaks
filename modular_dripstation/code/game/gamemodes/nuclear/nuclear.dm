/datum/outfit/syndicate
	id = /obj/item/card/id/syndicate/nuke
	backpack_contents = list(/obj/item/storage/box/syndie/nuke=1,\
		/obj/item/kitchen/knife/combat/survival)

/datum/outfit/syndicate/leader
	gloves = /obj/item/clothing/gloves/combat

/datum/outfit/syndicate/leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

/datum/outfit/syndicate/full
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	belt = /obj/item/storage/belt/military/webbing/syndicate/gorlex
	back = /obj/item/storage/backpack/syndie
	backpack_contents = list(/obj/item/storage/box/syndie/nuke=1,\
		/obj/item/tank/jetpack/oxygen/harness=1,\
		/obj/item/gun/ballistic/automatic/pistol=1,\
		/obj/item/kitchen/knife/combat/survival)

/datum/antagonist/nukeop/lone/equip_op()
	if(!ishuman(owner.current))
		return
	var/mob/living/carbon/human/H = owner.current

	H.set_species(/datum/species/human) //Plasamen burn up otherwise, and lizards are vulnerable to asimov AIs

	H.equipOutfit(nukeop_outfit)
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/HE = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(istype(HE, /obj/item/clothing/head/helmet/space/hardsuit/syndi))
		HE.spaceready(H)
	return TRUE

/datum/outfit/nuclear_operative
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/preview

/datum/outfit/nuclear_operative_elite
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/preview

/datum/outfit/syndicate/no_crystals
	var/faction = "The Syndicate"

/datum/outfit/syndicate/no_crystals/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	to_chat(H, span_notice("<B>You're an agent of [faction], sent to accompany the nuclear squad on their mission. \
		Support your allies, and remember: Down with Nanotrasen.</B>"))
	. = ..()

/datum/outfit/syndicate/no_crystals/gorlex
	name = "Syndicate Operative - Gorlex Reinforcement"
	suit = /obj/item/clothing/suit/armor/vest/alt
	head = /obj/item/clothing/head/helmet/swat
	neck = /obj/item/clothing/neck/scarf/red
	glasses = /obj/item/clothing/glasses/cold
	faction = "the Gorlex Marauders"

/datum/outfit/syndicate/no_crystals/cybersun
	name = "Syndicate Operative - Cybersun Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/jacket/leather/overcoat
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/sunglasses
	mask = /obj/item/clothing/mask/cigarette/cigar
	faction = "Cybersun Industries"

/datum/outfit/syndicate/no_crystals/donk
	name = "Syndicate Operative - Donk Reinforcement"
	suit = /obj/item/clothing/suit/hazardvest
	head = /obj/item/clothing/head/hardhat/weldhat/orange
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/meson
	faction = "the Donk Corporation"

/datum/outfit/syndicate/no_crystals/waffle
	name = "Syndicate Operative - Waffle Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet/blueshirt
	glasses = /obj/item/clothing/glasses/welding
	faction = "the Waffle Corporation"