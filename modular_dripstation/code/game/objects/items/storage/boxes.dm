//ammo boxes for 12mm
/obj/item/storage/box/beanbag
	icon_state = "beanbag_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/storage/box/slug
	name = "box of slug shotgun shots"
	desc = "A box full of slug lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "slug_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/slug/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/slug/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun(src)

/obj/item/storage/box/incendiary
	name = "box of incendiary slug shotgun shots"
	desc = "A box full of incendiary lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "incendiary_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/incendiary/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/incendiary/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/incendiary(src)

/obj/item/storage/box/laserbuckshot
	name = "box of laserbuckshot slug shotgun shots"
	desc = "A box full of laserbuckshot lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "laserbuckshot_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/laserbuckshot/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/laserbuckshot/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/laserbuckshot(src)

/obj/item/storage/box
	icon = 'modular_dripstation/icons/obj/storage.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_righthand.dmi'
	item_state = "box"

/obj/item/storage/box/cyber_implants
	illustration = null

/obj/item/storage/box/survival
	name = "emergency survival box"
	icon_state = "air"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/engineer
	name = "extended emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/syndie
	name = "emergency survival box"
	icon_state = "syndie_air"
	illustration = null

/obj/item/storage/box/survival_mining
	name = "mining emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/seccarts
	icon_state = "secbox"
	item_state = "secbox"

/obj/item/storage/box/security
	name = "security survival box"
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "emergencytank"	

/obj/item/storage/box/plasmaman
	name = "plasmaman survival box"
	icon_state = "plasmaman"
	illustration = null

/obj/item/storage/box/ipc
	name = "robot survival box"
	icon_state = "robot"
	illustration = null

/obj/item/storage/box/gorillacubes
	icon_state = "gorillacubebox"

/obj/item/storage/box/mixedcubes
	icon_state = "mixedcubebox"

/obj/item/storage/box/goatcubes
	icon_state = "goatcubebox"

/obj/item/storage/box/syringes
	icon_state = "syringes"
	item_state = "syringe"
	illustration = null

/obj/item/storage/box/medipens
	illustration = "epipen"

/obj/item/storage/box/medipens/utility
	illustration = "epipen"

/obj/item/storage/box/beakers/bluespace
	illustration = "blubeaker"

/obj/item/storage/box/vials/bluespace
	illustration = "vialblue"
	item_state = "beaker"

/obj/item/storage/box/injectors
	illustration = "dna"

/obj/item/storage/box/flashes
	illustration = "flash"

/obj/item/storage/box/mechabeacons
	illustration = "circuit"

/obj/item/storage/box/pinpointer_pairs
	illustration = "pda"

/obj/item/storage/box/medsprays
	illustration = "epipen"

/obj/item/storage/box/wall_flash
	illustration = "flash"

/obj/item/storage/box/teargas
	icon_state = "secbox"
	item_state = "secbox"	
	illustration = "grenade"

/obj/item/storage/box/emps
	illustration = "emp"

/obj/item/storage/box/drinkingglasses
	illustration = "drinkglass"	
	item_state = "beaker"

/obj/item/storage/box/condimentbottles
	illustration = "condiment"
	item_state = "beaker"

/obj/item/storage/box/cups
	illustration = "cup"

/obj/item/storage/box/cheese
	illustration = "condiment"

/obj/item/storage/box/firingpins
	illustration = "firingpin"

/obj/item/storage/box/firingpins/syndicate
	illustration = "firingpin"

/obj/item/storage/box/secfiringpins
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "firingpin"

/obj/item/storage/box/lasertagpins
	illustration = "firingpin"

/obj/item/storage/box/holy_grenades
	icon_state = "secbox"
	illustration = "grenade"

/obj/item/storage/box/fakesyndiesuit
	illustration = "syndiesuit"	

/obj/item/storage/box/exileimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/minertracker
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/trackimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/chemimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/silver_ids
	icon_state = "nt"
	item_state = "nt"

/obj/item/storage/box/deputy
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "depband"

/obj/item/storage/box/smart_metal_foam
	illustration = "grenade"

/obj/item/storage/box/emptysandbags
	illustration = "sandbag"

/obj/item/storage/box/rndboards
	illustration = "scicircuit"	

/obj/item/storage/box/rndboards/miner
	illustration = "circuit"

/obj/item/storage/box/official_posters
	illustration = "paper"

/obj/item/storage/box/evidence
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "evidence_icon"

/obj/item/storage/box/coffee_cart_rack
	illustration = "circuit"

/obj/item/storage/box/coffee_condi_display
	illustration = "vial"
	item_state = "beaker"

/obj/item/storage/box/jumpbootimplant
	icon_state = "cyber_implants"
	illustration = null

/obj/item/storage/box/silver_sulf
	illustration = "firepatch"	

/obj/item/storage/box/fountainpens
	illustration = "fpen"	

/obj/item/storage/box/holy_grenades
	illustration = "circuit"

/obj/item/storage/box/stockparts
	illustration = "circuit"

/obj/item/storage/box/stockparts/basic //for ruins where it's a bad idea to give access to an autolathe/protolathe, but still want to make stock parts accessible
	illustration = "circuit"

/obj/item/storage/box/stockparts/deluxe
	illustration = "circuit"	

/obj/item/storage/box/syndie_kit
	item_state = "box_of_doom"

/obj/item/storage/box/syndie_kit/imp_freedom
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_microbomb
	illustration = "implant"	

/obj/item/storage/box/syndie_kit/origami_bundle
	illustration = "paper"

/obj/item/storage/box/syndie_kit/romerol
	illustration = "syringe"

/obj/item/storage/box/syndie_kit/ez_clean
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/mimery
	illustration = "paper"

/obj/item/storage/box/syndie_kit/imp_macrobomb
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_uplink
	illustration = "implant"

/obj/item/storage/box/syndie_kit/bioterror
	illustration = "syringe"

/obj/item/storage/box/syndie_kit/imp_adrenal
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_storage
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_stealth
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_radio
	illustration = "implant"

/obj/item/storage/box/syndie_kit/cluwnification
	illustration = "clown"

/obj/item/storage/box/syndie_kit/imp_mindslave
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_greytide
	illustration = "implant"

/obj/item/storage/box/syndie_kit/xeno_organ_kit
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_mindshield
	illustration = "implant"

/obj/item/storage/box/syndie_kit/space
	illustration = "syndiesuit"

/obj/item/storage/box/flashbangs
	item_state = "flashbang"

/obj/item/storage/box/syndie_kit/emp
	illustration = "emp"

/obj/item/storage/box/syndie_kit/chemical
	illustration = "beaker"
	item_state = "beaker"

/obj/item/storage/box/syndie_kit/tuberculosisgrenade
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/bee_grenades
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/augmentation
	icon_state = "cyber_implants"
	item_state = "box"
	illustration = null

/obj/item/storage/box/syndie_kit/buster
	icon_state = "cyber_implants"
	item_state = "box"
	illustration = null

/obj/item/storage/box/syndie_kit/emp_shield
	illustration = "implant"

/obj/item/storage/box/syndicate/bundle_A
	icon_state = "syndiebox"
	item_state = "box_of_doom"
	illustration = "writing_syndie"

/obj/item/storage/box/syndicate/bundle_B
	icon_state = "syndiebox"
	item_state = "box_of_doom"
	illustration = "writing_syndie"

/obj/item/storage/box/captain
	name = "extended emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/captain/PopulateContents()
	new /obj/item/clothing/mask/breath/tactical(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/crowbar/red(src)

/obj/item/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."
	item_state = "syringe"
	illustration = "badges"

/obj/item/storage/box/holobadge/New()
	..()
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)

/obj/item/storage/box/security/biosig_nt
	name = "biosignaller implant box"
	desc = "A box claiming to contain 'Nanotrasen \"Profit Margin\" Class Employee Biosignaller' implants."
	illustration = "implant"

/obj/item/storage/box/security/biosig_nt/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/implantcase/biosig_ntcommand(src)
	new /obj/item/implanter/biosig_ntcommand(src)

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

// Syndie survival box
/obj/item/storage/box/syndie/nuke
	name = "emergency survival box"
	icon_state = "syndie_air"
	illustration = null

/obj/item/storage/box/syndie/nuke/PopulateContents()
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor(src)
	new /obj/item/reagent_containers/autoinjector/medipen/ekit/traitor(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/extinguisher/mini(src)
