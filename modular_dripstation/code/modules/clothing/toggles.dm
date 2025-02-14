/obj/item/clothing/suit/hooded/explorer
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/head/hooded/explorer
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	//dynamic_hair_suffix = ""

/obj/item/clothing/suit/hooded/explorer/winter
	icon_state = "explorer_winter"
	item_state = "explorer_winter"

/obj/item/clothing/head/hooded/explorer/winter
	icon_state = "explorer_winter"
	item_state = "explorer_winter"
	//dynamic_hair_suffix = ""

/obj/item/clothing/suit/hooded/miningmedic
	name = "recovery suit"
	desc = "A lightly armoured suit for search and rescue in harsh environments."
	icon_state = "recovery"
	item_state = "recovery"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|LEGS|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES
	flags_prot = HIDEJUMPSUIT
	hoodtype = /obj/item/clothing/head/hooded/miningmedic
	armor = list(MELEE = 40, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 50, WOUND = 10)

	resistance_flags = FIRE_PROOF
	mutantrace_variation = DIGITIGRADE_VARIATION
	allowed = list(/obj/item/analyzer,/obj/item/multitool/tricorder,/obj/item/stack/medical,/obj/item/dnainjector,/obj/item/reagent_containers/dropper,/obj/item/reagent_containers/syringe,/obj/item/reagent_containers/autoinjector,/obj/item/healthanalyzer,/obj/item/reagent_containers/glass/bottle,/obj/item/reagent_containers/glass/beaker,/obj/item/reagent_containers/pill,/obj/item/storage/pill_bottle,/obj/item/paper,/obj/item/melee/classic_baton/telescopic,/obj/item/soap,/obj/item/sensor_device,/obj/item/tank/internals, /obj/item/hypospray, /obj/item/flashlight, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/pickaxe, /obj/item/organ/regenerative_core/legion, /obj/item/kitchen/knife/combat)
/*
/obj/item/clothing/suit/hooded/miningmedic/Initialize(mapload) //can't be reinforced like regular explorer suits, but can also carry medical stuff in addition to mining stuff
	. = ..()
	allowed |= GLOB.labcoat_allowed
	allowed |= GLOB.mining_allowed
*/

/obj/item/clothing/head/hooded/miningmedic
	name = "recovery hood"
	desc = "A lightly armoured hood for search and rescue in harsh environments."
	icon_state = "recovery"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEEARS // hoods don't hide your face, silly
	flags_prot = HIDEHAIR
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	armor = list(MELEE = 40, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 50, WOUND = 10)
	resistance_flags = FIRE_PROOF
	var/adjusted = NORMAL_STYLE

//don't want this to be a subtype of the explorer suit or it'll inherit the armor plating
/obj/item/clothing/head/hooded/miningmedic/verb/hood_adjust()
	set name = "Adjust Hood Style"
	set category = null
	set src in usr
	switch(adjusted)
		if(NORMAL_STYLE)
			adjusted = ALT_STYLE
			to_chat(usr, span_notice("You adjust the hood to wear it more casually."))
			flags_inv &= ~HIDEHAIR
		if(ALT_STYLE)
			adjusted = NORMAL_STYLE
			to_chat(usr, span_notice("You adjust the hood back to normal."))
			flags_inv |= HIDEHAIR
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		H.update_hair()
		H.update_body()

/obj/item/clothing/suit/toggle/labcoat
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/labcoat

/datum/component/storage/concrete/pockets/labcoat
	quickdraw = FALSE
	max_items = 2
	silent = TRUE

/datum/component/storage/concrete/pockets/labcoat/Initialize()
	. = ..()
	set_holdable(list(	/obj/item/analyzer,
						/obj/item/multitool,
						/obj/item/screwdriver,
						/obj/item/card,
						/obj/item/storage/wallet, 
						/obj/item/toy/cards/deck, 
						/obj/item/stack/medical,
						/obj/item/dnainjector,
						/obj/item/reagent_containers/dropper,
						/obj/item/reagent_containers/syringe,
						/obj/item/reagent_containers/autoinjector,
						/obj/item/healthanalyzer,
						/obj/item/flashlight/pen,
						/obj/item/holotool,
						/obj/item/modular_computer/tablet/phone,
						/obj/item/reagent_containers/glass/bottle,
						/obj/item/reagent_containers/glass/beaker,
						/obj/item/reagent_containers/pill,
						/obj/item/storage/pill_bottle,
						/obj/item/paper,
						/obj/item/melee/classic_baton/telescopic,
						/obj/item/laser_pointer, 
						/obj/item/assembly/flash/handheld, 
						/obj/item/assembly/flash/hypnotic, 
						/obj/item/soap,
						/obj/item/sensor_device,
						/obj/item/tank/internals/emergency_oxygen,
						/obj/item/tank/internals/plasmaman,
						/obj/item/tank/internals/ipc_coolant,
						/obj/item/hypospray))

/obj/item/clothing/suit/toggle/labcoat/emt/paramedic
	icon_state = "labcoat_paramedic"

/obj/item/clothing/suit/toggle/labcoat/emt/explorer
	icon_state = "labcoat_mm"

/obj/item/clothing/suit/toggle/labcoat/cmo
	desc = "Standart labcpat with blue markings."

/obj/item/clothing/suit/toggle/labcoat/cmo/alt
	name = "chief medical officer's labcoat"
	desc = "Bluer than the standard model."
	icon_state = "labcoat_cmo_alt"

/obj/item/clothing/suit/toggle/labcoat/cmo/long
	name = "chief medical officer's labcoat"
	desc = "Long standard model in chief medical colors."
	icon_state = "labcoat_long_cmo"

/obj/item/clothing/suit/toggle/browntrenchcoat
	name = "brown trench coat"
	desc = "It makes you stand out. Just the opposite of why it's typically worn. Nice try trying to blend in while wearing it."
	icon_state = "brtrenchcoat"
	item_state = "brtrenchcoat"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/toggle/blacktrenchcoat
	name = "black trench coat"
	desc = "That shade of black just makes you look a bit more evil. Good for those mafia types."
	icon_state = "bltrenchcoat"
	item_state = "bltrenchcoat"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'		
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/toggle/bomber
	name = "bomber jacket"
	desc = "Aviators not included."
	icon_state = "bomber"
	item_state = "bomber"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/suits_righthand.dmi'	
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/toggle/bomber/secbomber
	name = "security bomber jacket"
	desc = "A stylish and worn-in armoured black bomber jacket emblazoned with the NT Security crest on the left breast. Looks rugged."
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "bombersec"
	allowed = list(/obj/item/gun/energy, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	heat_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	armor = list(MELEE = 35, BULLET = 35, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/suit/toggle/bomber/engibomber
	name = "engineering bomber jacket"
	desc = "A stylish and warm jacket adorned with the colors of the humble Station Engineer."
	icon_state = "bomberengi"
	item_state = "bomberengi"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 10, FIRE = 20, ACID = 40, WOUND = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/t_scanner, /obj/item/radio, /obj/item/extinguisher/mini)

/obj/item/clothing/suit/toggle/bomber/engibomber/atmosbomber
	name = "atmospherics bomber jacket"
	desc = "A stylish and warm jacket adorned with the colors of the magical Atmospherics Technician."
	icon_state = "bomberatmos"
	item_state = "bomberatmos"

/obj/item/clothing/suit/toggle/bomber/cargobomber
	name = "cargo bomber jacket"
	desc = "A stylish jacket to keep you warm in the warehouse."
	icon_state = "bombercargo"
	item_state = "bombercargo"
	allowed = list(/obj/item/clipboard, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)

/obj/item/clothing/suit/jacket/miningbomber
	name = "mining bomber jacket"
	desc = "A slightly armoured and stylish jacket for shaft miners."
	icon_state = "bombermining"
	item_state = "bombermining"
	allowed = list(/obj/item/pickaxe, /obj/item/t_scanner/adv_mining_scanner, /obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/gun/energy/kinetic_accelerator, /obj/item/shovel, /obj/item/storage/bag/ore)
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 10, ACID = 0, WOUND = 0)

/obj/item/clothing/suit/toggle/bomber/secbomber/soft
	name = "security soft bomber jacket"
	desc = "A cozy jacket in security's colors."
	icon_state = "sec_dep_jacket"
	item_state = "sec_dep_jacket"
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 15)

/obj/item/clothing/suit/toggle/bomber/cargobomber/soft
	name = "cargo soft bomber jacket"
	desc = "A cozy jacket in cargo colors."
	icon_state = "supply_dep_jacket"
	item_state = "supply_dep_jacket"	

/obj/item/clothing/suit/toggle/bomber/engibomber/soft
	name = "engineering soft bomber jacket"
	desc = "A cozy jacket in engineering colors."
	icon_state = "engi_dep_jacket"
	item_state = "engi_dep_jacket"

/obj/item/clothing/suit/toggle/bomber/scibomber
	name = "science soft bomber jacket"
	desc = "A cozy jacket in science colors."
	icon_state = "sci_dep_jacket"
	item_state = "sci_dep_jacket"
	allowed = list(/obj/item/analyzer, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/toggle/bomber/medbomber
	name = "medical soft bomber jacket"
	desc = "A cozy jacket in medical colors."
	icon_state = "med_dep_jacket"
	item_state = "med_dep_jacket"
	allowed = list(/obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector, /obj/item/healthanalyzer, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/soap, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/tank/internals/ipc_coolant, /obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)


/obj/item/clothing/suit/toggle/emt_vest
	name = "emt vest"
	desc = "A hazard vest used in the recovery of bodies."
	icon_state = "paramedic-vest"
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/labcoat
	allowed = list(/obj/item/flashlight, 
					/obj/item/radio,
					/obj/item/analyzer,
					/obj/item/stack/medical,
					/obj/item/dnainjector,
					/obj/item/reagent_containers/dropper,
					/obj/item/reagent_containers/syringe,
					/obj/item/reagent_containers/autoinjector,
					/obj/item/healthanalyzer,
					/obj/item/reagent_containers/glass/bottle,
					/obj/item/reagent_containers/glass/beaker,
					/obj/item/reagent_containers/pill,
					/obj/item/storage/pill_bottle,
					/obj/item/paper,
					/obj/item/melee/classic_baton/telescopic,
					/obj/item/laser_pointer, 
					/obj/item/assembly/flash/handheld, 
					/obj/item/assembly/flash/hypnotic, 
					/obj/item/soap,
					/obj/item/sensor_device,
					/obj/item/tank/internals/emergency_oxygen,
					/obj/item/tank/internals/plasmaman,
					/obj/item/tank/internals/ipc_coolant,
					/obj/item/hypospray)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,	ENERGY = 0, BOMB = 0, BIO = 35, RAD = 0, FIRE = 35, ACID = 35)

/obj/item/clothing/suit/toggle/emt_vest/jacket
	name = "emt jacket"
	desc = "A hazard jacket used in the recovery of bodies."
	icon_state = "emt_jacket"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT

/obj/item/clothing/suit/toggle/emt_vest/jacket/paramedic
	name = "paramedic jacket"
	icon_state = "paramedic_jacket"

/obj/item/clothing/suit/toggle/emt_vest/jacket/highvis
	name = "em tech jacket"
	desc = "A high vision jacket used in the recovery of bodies."
	icon_state = "highvis"

/obj/item/clothing/head/hooded/winterhood
	dynamic_hair_suffix = ""
