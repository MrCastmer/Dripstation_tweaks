//STM-9
/obj/item/gun/ballistic/automatic/stm9
	name = "\improper Souze TM-9 Gen.3"
	desc = "STM 9х19mm sport pistol-carbine supplied by some unknown union to TSF. Speed, accuracy and comfort recoil."
	icon_state = "stm9"
	item_state = "lwt650"
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	fire_delay = 0		//800 shots per minute, hello there
	burst_size = 1
	spread = 3				//need simple scope
	recoil = 0.5
	pin = /obj/item/firing_pin
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	can_suppress = TRUE
	can_unsuppress = TRUE
	actions_types = list()
	vary_fire_sound = FALSE
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	load_sound = "sound/weapons/rifleload.ogg"
	load_empty_sound = "sound/weapons/rifleload.ogg"
	rack_sound = "sound/weapons/riflerack.ogg"
	eject_sound = "sound/weapons/rifleunload.ogg"
	eject_empty_sound = "sound/weapons/rifleunload.ogg"


/obj/item/gun/ballistic/automatic/pistol/glock17
	name = "\improper Glock-17"
	desc = "A weapon from bygone times, this has been made to look like an old, blocky firearm from the 21st century. Chambered in 9x19mm."
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "glock"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	can_suppress = FALSE
	fire_sound = 'dripstation/sound/weapons/pistol/shot_alt.ogg'
	fire_delay = 1

/obj/item/gun/ballistic/automatic/pistol/fn45
	name = "\improper FNX-45 Tactical"
	desc = "Tactical modern Terra Gov service pistol. Better, faster, stronger than other service pistols. \
	Do not as iconic as M1911, but reliable and modern. Chambered in .45 caliber. Has a threaded barrel for suppressors."
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "fnx"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/fn45
	starting_mag_type = /obj/item/ammo_box/magazine/fn45
	spread = 3
	can_suppress = TRUE
	can_unsuppress = TRUE
	fire_sound = "sound/weapons/pistolshotsmall.ogg"
	feedback_types = list(
		"fire" = 3
	)

//ammo boxes for 9mm
/obj/item/ammo_box/c9mm/fire
	name = "ammo box (9mm Incendiary)"
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/c9mm/ap
	name = "ammo box (9mm Armor-Piercing)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/no_direct/c38
	name = "ammo box (.38 special)"
	icon_state = "38box"
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 20

/obj/item/ammo_box/no_direct/c38/rubber
	name = "ammo box (.38 rubber)"
	ammo_type = /obj/item/ammo_casing/c38/rubber

//APS, Glock, STM-9 Mag
/obj/item/ammo_box/magazine/pistolm9mm/ap
	name = "pistol magazine (9mm Armor-Piercing)"
	icon_state = "9x19pA"
	desc= "A 15-round 9mm magazine designed for the Stechkin APS Pistol. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/fire
	name = "pistol magazine (9mm Incendiary)"
	icon_state = "9x19pI"
	desc = "A 15-round 9mm magazine designed for the A Stechkin APS Pistol. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/pistolm9mm/pmag
	name = "Glock PMAG magazine (9mm)"
	desc = "A 21-round magazine for TSF side arm that contains 9mm rounds."
	icon = 'dripstation/icons/obj/ammo.dmi'
	icon_state = "pmag9x19"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 21

/obj/item/ammo_box/magazine/pistolm9mm/pmag/ap
	name = "Glock PMAG magazine (9mm Armor-Piercing)"
	icon_state = "pmag9x19A"
	desc= "A 21-round magazine for TSF side arm. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/pmag/fire
	name = "Glock PMAG magazine (9mm Incendiary)"
	icon_state = "pmag9x19I"
	desc = "A 21-round magazine for TSF side arm. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/pistolm9mm/drum
	name = "Glock Drum magazine (9mm)"
	desc = "A 50-round magazine for TSF side arm that contains 9mm rounds."
	icon = 'dripstation/icons/obj/ammo.dmi'
	icon_state = "stm9mag"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 50

/obj/item/ammo_box/magazine/pistolm9mm/drum/ap
	name = "Glock Drum magazine (9mm Armor-Piercing)"
	icon_state = "stm9magA"
	desc= "A 50-round magazine for TSF side arm. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/drum/fire
	name = "Glock Drum magazine (9mm Incendiary)"
	icon_state = "stm9magI"
	desc = "A 50-round magazine for TSF side arm. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/fn45
	name = "FNX-45 magazine (.45 ACP)"
	desc = "An 15-round .45 ACP magazine designed for the FNX-45 pistol."
	icon_state = "fn45"
	icon = 'dripstation/icons/obj/ammo.dmi'
	max_ammo = 15
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/fn45/ap
	name = "FNX-45 magazine (Armor-Piercing .45 ACP)"
	icon_state = "fn45A"
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_box/magazine/fn45/hp
	name = "FNX-45 magazine (Hollow-Point .45 ACP)"
	icon_state = "fn45H"
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_box/magazine/fn45/v
	name = "FNX-45 magazine (Venom .45 ACP)"
	icon_state = "fn45V"
	ammo_type = /obj/item/ammo_casing/c45/venom




//ammo override for pistol calibers
/obj/item/projectile/bullet/c10mm/ap
	armour_penetration = 30

/obj/item/projectile/bullet/c10mm/ap
	armour_penetration = 30