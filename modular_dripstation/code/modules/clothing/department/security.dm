// ###### HOS ######
/obj/item/clothing/under/rank/head_of_security
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/hos.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/hos.dmi'

/obj/item/clothing/under/rank/head_of_security/skirt
	can_adjust = TRUE

/obj/item/clothing/under/rank/head_of_security/corporate
	name = "head of security's corporate uniform"
	desc = "Standart issue fancy corporate uniform issued to the Head of Security."
	icon_state = "hos_corporate"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_security/corporate/skirt
	name = "head of security's corporate dress"
	desc = "Standart issue fancy corporate dress issued to the Head of Security."
	icon_state = "hos_corporatef"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/mask/gas/sechailer/swat/hos
	name = "\improper HOS SWAT mask"
	icon_state = "hosmask"	
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'	

/obj/item/clothing/head/HoS
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'

/obj/item/clothing/head/HoS/beret
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/HoS/dictator
	icon_state = "policechiefcap"	
	item_state = "policechiefcap"	
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	name = "dictator head of security cap"
	desc = "Kill your own, to keep enemy in fear."

/obj/item/clothing/suit/armor/hos/trenchcoat
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/suit/armor/hos/trenchcoat/winter
	name = "head of Security's winter trenchcoat"
	icon_state = "coathos_alt"
	item_state = "coathos_alt"	
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT	
	armor = list(MELEE = 35, BULLET = 25, LASER = 40, ENERGY = 20, BOMB = 35, BIO = 0, RAD = 0, FIRE = 0, ACID = 55)

// ###### WARDEN ######

/obj/item/clothing/under/rank/warden
	name = "warden's jumpsuit"
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/warden.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/warden.dmi'

/obj/item/clothing/under/rank/warden/skirt
	name = "warden's jumpskirt"
	can_adjust = TRUE

/obj/item/clothing/under/rank/warden/corporate
	name = "warden's corporate uniform"
	desc = "Standart issue fancy corporate uniform issued to the Warden."
	icon_state = "warden_corporate"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/warden/classic
	name = "warden's classic uniform"
	desc = "Old issue fancy security uniform, this one has silver lining."
	icon_state = "warden-collar"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/warden/corporate/skirt
	name = "head of security's corporate dress"
	desc = "Standart issue fancy corporate dress issued to the Head of Security."
	icon_state = "warden_corporatef"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/mask/gas/sechailer/swat/warden
	name = "\improper Warden SWAT mask"
	icon_state = "wardenmask"	
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'	

/obj/item/clothing/under/rank/warden/navyblue
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/suit/armor/wardenjacket
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/warden
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/warden/alt
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'

/obj/item/clothing/suit/armor/vest/warden/winter
	name = "warden's winter coat"
	desc = "High fashion is required even if the armory is a literal freezer."
	icon_state = "coatwarden"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	mutantrace_variation = NO_MUTANTRACE_VARIATION	
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 15, BIO = 0, RAD = 0, FIRE = 50, ACID = 75, WOUND = 20)

/obj/item/clothing/suit/armor/vest/warden/short
	name = "Warden's short jacket"
	desc = "A short, armored jacket, perfect for desk duty."
	icon_state = "wardensjacket"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/head/warden
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	armor = list(MELEE = 35, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)	

/obj/item/clothing/head/beret/sec/navywarden
	armor = list(MELEE = 35, BULLET = 30, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 10, RAD = 0, FIRE = 50, ACID = 50, WOUND = 5)

/obj/item/clothing/head/warden/drill
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'

// ###### OFFICER ######

/obj/item/clothing/under/rank/security
	icon = 'modular_dripstation/icons/obj/clothing/uniform/security/security.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/security/security.dmi'

/obj/item/clothing/under/rank/security/alt
	name = "black security uniform"
	desc = "A jumpsuit made of strong material, providing robust protection."
	icon_state = "bsecurity"

/obj/item/clothing/under/rank/security/redshirt
	name = "white classic security uniform"
	desc = "A jumpsuit made of strong material, providing robust protection."
	icon_state = "redshirt"

/obj/item/clothing/under/rank/security/corporate
	name = "corporate security uniform"
	desc = "Standart issue fancy corporate uniform issued to offcers."
	icon_state = "sec_corporate"

/obj/item/clothing/under/rank/security/classic
	name = "classic security uniform"
	desc = "Old issue fancy security uniform, this one has silver lining."
	icon_state = "clsecurity"

/obj/item/clothing/under/rank/security/navyblue
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'

/obj/item/clothing/under/rank/security/navyblue/russian
	icon_state = "officertanclothes"
	icon = 'icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/uniform/uniform.dmi'
	
/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	desc = "It's a baseball hat in corporate colours."
	icon_state = "corpsoft"
	soft_type = "corp"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'		

/obj/item/clothing/head/officer
	name = "officer's cap"
	desc = "A red cap with an old-fashioned badge on the front for establishing that you are, in fact, the law."
	icon_state = "customshelm"
	item_state = "customshelm"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	
	armor = list(MELEE = 30, BULLET = 25, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50)
	strip_delay = 60
	dynamic_hair_suffix = ""

/obj/item/clothing/head/beret/sec
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	
	armor = list(MELEE = 30, BULLET = 25, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 20, ACID = 50)


/obj/item/clothing/suit/armor/officerjacket
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	

/obj/item/clothing/shoes/jackboots/jacksandal
	name = "jacksandals"
	desc = "Nanotrasen-issue Security combat sandals for combat scenarios. They're jacksandals, however that works."
	icon_state = "jacksandal"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'	
	pocket_storage_component_path = null

// ###### VENDORS ######
/obj/machinery/vending/security
	req_access = list(ACCESS_BRIG)
	products = list(/obj/item/clothing/head/helmet/plated = 6,
					/obj/item/clothing/suit/armor/plated = 6,
					/obj/item/restraints/handcuffs = 8,
					/obj/item/clothing/neck/anti_magic_collar = 3,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/restraints/legcuffs/bola/energy = 7)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,
					  /obj/item/storage/fancy/donut_box = 2)
	premium = list(/obj/item/storage/belt/security/webbing = 5,
					/obj/item/clothing/gloves/tackler/security = 3,
					/obj/item/clothing/glasses/hud/security/sunglasses/aviators = 1,
				   /obj/item/coin/antagtoken = 1,
				   /obj/item/clothing/head/helmet/warhelmet = 5,
				   /obj/item/clothing/suit/armor/vest/rycliesarmour = 5,
				   /obj/item/clothing/head/helmet/blueshirt = 5,
				   /obj/item/clothing/suit/armor/vest/blueshirt = 5)


/obj/machinery/vending/wardrobe/sec_wardrobe
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/storage/backpack/security = 3,
					/obj/item/storage/backpack/satchel/sec = 3,
					/obj/item/storage/backpack/duffelbag/sec = 3,
					/obj/item/clothing/under/rank/security = 3,
					/obj/item/clothing/under/rank/security/alt = 3,
					/obj/item/clothing/under/rank/security/skirt = 3,
					/obj/item/clothing/under/rank/security/grey = 3,
					/obj/item/clothing/under/rank/security/redshirt = 3,
					/obj/item/clothing/under/rank/security/classic = 3,
					/obj/item/clothing/under/rank/security/corporate = 3,
					/obj/item/clothing/under/rank/security/navyblue = 3,
					/obj/item/clothing/under/rank/security/navyblue/russian = 3,
					/obj/item/clothing/suit/hooded/wintercoat/security = 3,					
					/obj/item/clothing/suit/armor/vest/secmiljacket = 2,
					/obj/item/clothing/suit/toggle/bomber/secbomber/soft = 2,
					/obj/item/clothing/suit/poncho/sec = 2,				
					/obj/item/clothing/shoes/jackboots = 3,
					/obj/item/clothing/shoes/jackboots/jacksandal = 3,
					/obj/item/clothing/shoes/xeno_wraps/jackboots = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/head/officer = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/head/soft/sec/corp = 3,
					/obj/item/clothing/mask/bandana/red = 3,
					/obj/item/badge/security/cadet = 3)
	premium = list(/obj/item/clothing/under/rank/security/navyblue = 3,
					/obj/item/clothing/suit/armor/officerjacket = 3,
					/obj/item/clothing/head/beret/sec/navyofficer = 3)

