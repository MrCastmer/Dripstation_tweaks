/obj/machinery/vending/wardrobe/honk_wardrobe
	name = "\improper HonkDrobe"
	desc = "Contains an entire HONK arsenal, for your precious prank needs."
	icon_state = "clowndrobe"
	icon_vend = "clowndrobe-vend"
	icon_deny = "clowndrobe-deny"
	product_slogans = "HonkCo level of fun!; Be a colorful piñata!; Honk'em all!"	
	product_ads = "Who cares if it's fun!; Prepare them a prank they aren't expecting!;All slippery and colorful."
	req_access = list(ACCESS_CLOWN)
	light_color = LIGHT_COLOR_ORANGE
	products = list(/obj/item/storage/backpack/clown = 1,
					/obj/item/storage/backpack/satchel/clown = 1,
					/obj/item/storage/backpack/duffelbag/clown = 1,
					/obj/item/clothing/under/rank/clown = 1,
					/obj/item/clothing/mask/gas/clown_hat = 1,
					/obj/item/clothing/shoes/clown_shoes = 2,
					/obj/item/clothing/under/rank/clown/sexy = 1,
					/obj/item/clothing/mask/gas/sexyclown = 1,
					/obj/item/clothing/under/rank/blueclown = 1,
					/obj/item/clothing/under/rank/greenclown = 1,
					/obj/item/clothing/under/rank/yellowclown = 1,
					/obj/item/clothing/under/rank/orangeclown = 1,
					/obj/item/clothing/under/rank/purpleclown = 1,
					/obj/item/storage/backpack/clownface = 1,
					/obj/item/clothing/mask/yogs/gigglesmask = 1,
					/obj/item/clothing/shoes/clown_shoes/clowncrocs = 1,					
					/obj/item/clothing/mask/yogs/scaryclown = 1,
					/obj/item/clothing/under/yogs/scaryclown = 1,
					/obj/item/clothing/shoes/clown_shoes/scaryclown = 1,										
					/obj/item/clothing/suit/hooded/bee_costume = 1,
					/obj/item/clothing/shoes/clown_shoes/beeshoes = 1,
					/obj/item/clothing/head/jester = 1,					
					/obj/item/clothing/under/jester = 1,
					/obj/item/clothing/shoes/clown_shoes/jester = 1)
	// contraband = list(/obj/item/clothing/shoes/drip = 1,
	// 				/obj/item/clothing/shoes/russian = 1)
	premium = list(/obj/item/clothing/under/rank/rainbowclown = 1,
					/obj/item/clothing/gloves/color/white = 2,
					/obj/item/clothing/gloves/color/rainbow = 1,
					/obj/item/clothing/suit/chaplainsuit/clownpriest = 1,
					/obj/item/clothing/head/clownmitre = 1)  
	refill_canister = /obj/item/vending_refill/wardrobe/clown
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/wardrobe/clown
	machine_name = "HonkDrobe"	

/obj/machinery/vending/wardrobe/honk_wardrobe/Initialize()
	. = ..()
	vend_reply = "Thank you for HONKING!"

/obj/machinery/vending/wardrobe/mime_wardrobe
	name = "\improper MimeDrobe"
	desc = "Add some colors into their life!"
	icon_state = "mimedrobe"
	icon_vend = "mimedrobe-vend"
	icon_deny = "mimedrobe-deny"	
	product_ads = "By a black and white comedy star!; Good joke doesn't need words."
	req_access = list(ACCESS_MIME)	
	products = list	(/obj/item/storage/backpack/mime = 1,
					/obj/item/storage/backpack/satchel/mime = 1,
					/obj/item/storage/backpack/duffelbag/mime = 1,
					/obj/item/clothing/under/rank/mime = 1,
					/obj/item/clothing/mask/gas/mime = 1,
					/obj/item/clothing/under/rank/mime/skirt = 1,
					/obj/item/clothing/under/sexymime = 1,
					/obj/item/clothing/mask/gas/sexymime = 1,
					/obj/item/clothing/suit/suspenders = 2,
					/obj/item/clothing/under/stripeddress = 1,
					/obj/item/clothing/under/yogs/pinstripe = 1,
					/obj/item/clothing/head/beret = 2,
					/obj/item/clothing/head/beret/vintage = 2,
					/obj/item/clothing/head/beret/archaic = 2,
					/obj/item/clothing/head/soft/mime = 2,
					/obj/item/clothing/head/soft/black = 2,
					/obj/item/clothing/head/beanie = 2,
					/obj/item/clothing/head/beanie/striped = 2,
					/obj/item/clothing/shoes/sneakers/mime = 2,
					/obj/item/clothing/shoes/sneakers/white = 2,
					/obj/item/clothing/neck/scarf/zebra = 1,
					/obj/item/clothing/neck/scarf/black  = 1,
					/obj/item/clothing/neck/scarf = 1,
					/obj/item/clothing/gloves/color/black = 1,
					/obj/item/clothing/gloves/color/white = 1,
					/obj/item/clothing/shoes/laceup = 2,
					/obj/item/clothing/shoes/laceup/grey = 2)
	// contraband = list(/obj/item/clothing/shoes/drip = 1,
	// 				/obj/item/clothing/shoes/russian = 1)
	// premium = list(/obj/item/clothing/suit/chaplainsuit/clownpriest = 1,
	// 			   /obj/item/clothing/under/rank/rainbowclown = 1,
	// 			   /obj/item/clothing/head/clownmitre = 1)
	refill_canister = /obj/item/vending_refill/wardrobe/mime
	payment_department = ACCOUNT_SRV	

/obj/machinery/vending/wardrobe/mime_wardrobe/Initialize()
	. = ..()
	vend_reply = "..."

/obj/item/vending_refill/wardrobe/mime
	machine_name = "MimeDrobe"	

/obj/machinery/vending/wardrobe/haztech_wardrobe
	name = "\improper HazardDrobe"
	desc = "Has all the needed things to protects you from the elements."
	icon_state = "hazdrobe"
	icon_vend = "hazdrobe-vend"
	icon_deny = "hazdrobe-deny"
	product_ads = "Fire and acid proof!"
	vend_reply = "There is no time to buy, go save someone!"
	req_access = list(ACCESS_HAZARD_TECH)
	products = list(
		// /obj/item/storage/backpack/duffelbag/engineering/emtech = 2,
		// /obj/item/storage/backpack/satchel/eng/emtech = 2,
		// /obj/item/storage/backpack/industrial/emtech = 2,
		// /obj/item/clothing/suit/hooded/wintercoat/engineering/emtech = 2,
		// /obj/item/clothing/under/rank/engineering/engineer/hazard = 2,
		// /obj/item/clothing/under/rank/engineering/engineer/skyrat/hazard_chem = 2,
		// /obj/item/clothing/under/rank/engineering/engineer/skyrat/utility = 2,
		// /obj/item/clothing/suit/hazardvest = 2,
		// /obj/item/clothing/head/beretclassic/emtech = 2,
		// /obj/item/clothing/shoes/workboots = 2,
		// /obj/item/clothing/shoes/workboots/dark = 2,
		// /obj/item/radio/headset/headset_eng = 2,
		/obj/item/clothing/head/hardhat/orange = 2,
	)
	premium = list(/obj/item/clothing/head/hardhat/weldhat/orange = 1, /obj/item/clothing/glasses/meson/engine = 2)
	refill_canister = /obj/item/vending_refill/wardrobe/haztech_wardrobe
	payment_department = ACCOUNT_ENG

/obj/item/vending_refill/wardrobe/haztech_wardrobe
	machine_name = "HazardDrobe"

/obj/machinery/vending/wardrobe/para_wardrobe
	name = "\improper ParaDrobe"
	desc = "A vending machine rumoured to be capable of dispensing clothing for paramedics."
	icon_state = "paradrobe"
	icon_vend = "paradrobe-vend"
	icon_deny = "paradrobe-deny"
	req_access = list(ACCESS_PARAMEDIC)
	product_ads = "Drag bodies... With style!!"
	products = list(/obj/item/clothing/accessory/pocketprotector = 2,
					/obj/item/storage/backpack/duffelbag/emt = 2,
					/obj/item/storage/backpack/medic = 2,
					/obj/item/storage/backpack/satchel/med = 4,
					/obj/item/clothing/suit/toggle/labcoat/emt = 2,
					/obj/item/clothing/head/soft/emt = 2,
					// /obj/item/clothing/suit/hooded/wintercoat/medical/paramedic = 4,
					// /obj/item/clothing/under/rank/medical/paramedic = 4,
					// /obj/item/clothing/under/rank/medical/paramedic/skirt = 4,
					// /obj/item/clothing/under/rank/medical/paramedic/blue =4,
					// /obj/item/clothing/under/rank/engineering/engineer/skyrat/hazard_chem/emt = 2,
					// /obj/item/clothing/under/rank/medical/doctor/skyrat/utility = 4,
					// /obj/item/clothing/suit/jacket/paravest = 4,
					// /obj/item/clothing/suit/toggle/labcoat/paramedic = 4,
					// /obj/item/clothing/suit/toggle/labcoat/highvis = 4,
					// /obj/item/clothing/suit/toggle/labcoat/paramedic/highvis = 4,
					// /obj/item/clothing/suit/toggle/labcoat/paramedic/highvis/paramedic = 4,
					/obj/item/clothing/shoes/sneakers/white = 2,
					/obj/item/clothing/shoes/sneakers/black = 2,
					/obj/item/clothing/shoes/xeno_wraps/medical = 2,
					// /obj/item/clothing/head/beret/medical/paramedic = 4,
					// /obj/item/clothing/head/soft/paramedic = 4,
					// /obj/item/clothing/head/soft/paramedic/blue = 4,
					/obj/item/radio/headset/headset_med = 3)
	refill_canister = /obj/item/vending_refill/wardrobe/para_wardrobe
	payment_department = ACCOUNT_MED

/obj/machinery/vending/wardrobe/para_wardrobe/Initialize()
	. = ..()
	vend_reply = "There is no time to buy, go save someone!"

/obj/item/vending_refill/wardrobe/para_wardrobe
	machine_name = "ParaDrobe"	

/obj/machinery/vending/wardrobe/det_wardrobe
	name = "\improper DetDrobe"
	desc = "A machine for all your detective needs, as long as you need clothes."
	icon_state = "detdrobe"
	icon_vend = "detdrobe-vend"
	icon_deny = "detdrobe_deny"
	product_ads = "Apply your brilliant deductive methods in style!"
	vend_reply = "Thank you for using the DetDrobe!"
	light_mask = "detdrobe-light-mask"
	req_access = list(ACCESS_FORENSICS_LOCKERS)
	products = list(/obj/item/clothing/under/rank/det = 1,
					/obj/item/clothing/under/rank/det/skirt = 1,
					/obj/item/clothing/under/yogs/bluedetective = 1,
					/obj/item/clothing/under/yogs/blackdetective = 1,
					/obj/item/clothing/under/yogs/golddetective = 1,
					/obj/item/clothing/under/yogs/greydetective = 1,
					/obj/item/clothing/under/rank/det/grey = 1,
					/obj/item/clothing/under/rank/det/grey/skirt = 1,
					/obj/item/clothing/under/yogs/forensictech = 1,
					/obj/item/clothing/suit/det_suit/grey = 1,
					/obj/item/clothing/suit/det_suit = 1,
					/obj/item/clothing/suit/det_suit/tan = 1,
					/obj/item/clothing/suit/det_suit/noir = 1,
					/obj/item/clothing/suit/yogs/golddetective = 1,
					/obj/item/clothing/suit/yogs/detectivecoat = 1,
					/obj/item/clothing/head/fedora/det_hat = 2,
					/obj/item/clothing/head/fedora/det_hat/grey = 2,					
					/obj/item/clothing/accessory/waistcoat = 2,
					/obj/item/clothing/shoes/laceup = 2,
					/obj/item/clothing/shoes/laceup/brown = 2,
					/obj/item/clothing/shoes/laceup/grey  = 2,
					/obj/item/clothing/shoes/sneakers/brown = 2,
					/obj/item/clothing/gloves/color/black = 2,
					/obj/item/clothing/gloves/color/latex = 2,
					// /obj/item/clothing/suit/det_suit/dark = 1,					
					// /obj/item/clothing/under/rank/security/detective = 2,
					// /obj/item/clothing/under/rank/security/detective/skirt = 2,
					// /obj/item/clothing/under/rank/security/detective/noir = 2,
					// /obj/item/clothing/under/rank/security/detective/noir/skirt = 2,					
					// /obj/item/clothing/under/rank/security/detective/disco = 1,
					// /obj/item/clothing/suit/det_suit/disco = 1,
					// /obj/item/clothing/shoes/discoshoes = 1,
					// /obj/item/clothing/neck/tie/disco = 1,
					// /obj/item/clothing/under/rank/security/detective/kim = 1,
					// /obj/item/clothing/suit/det_suit/kim = 1,
					// /obj/item/clothing/shoes/kim = 1,
					// /obj/item/clothing/gloves/kim = 1,
					// /obj/item/clothing/glasses/regular/kim = 1,
					/obj/item/reagent_containers/food/drinks/flask/det = 2)
	premium = list(/obj/item/clothing/head/flatcap = 1)
	refill_canister = /obj/item/vending_refill/wardrobe/det_wardrobe
	extra_price = PAYCHECK_COMMAND * 1.75
	payment_department = ACCOUNT_SEC

/obj/item/vending_refill/wardrobe/det_wardrobe
	machine_name = "DetDrobe"
