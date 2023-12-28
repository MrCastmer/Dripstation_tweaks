//ammo boxes for 12mm
/obj/item/storage/box/beanbag
	icon_state = "beanbag_box"
	icon = 'dripstation/icons/obj/ammo.dmi'

/obj/item/storage/box/slug
	name = "box of slug shotgun shots"
	desc = "A box full of slug lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "slug_box"
	icon = 'dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/slug/ComponentInitialize()
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
	icon = 'dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/incendiary/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/incendiary/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/incendiary(src)



/obj/item/ammo_casing/shotgun/buckshot/syndie
	name = "12/70 RIP-S shell (Syndicate Radically Invasive Projectile)"
	desc = "An 12-gauge heavy tungsten buckshot shell without manufacturer's marking."


/obj/item/projectile/bullet/pellet/shotgun_buckshot/syndie
	name = "12/70 RIP-S"
	bare_wound_bonus = 10 //shotgunning assistants, PAINfully

/obj/item/ammo_box/magazine/m12g
	name = "shotgun magazine (12g RIP-S)"
	desc = "A drum magazine designed for the Bulldog shotgun. \
			RIP-S is more effective choice for anti-personnel use. \
			RIP and death to the Nanotrasen!"



/obj/item/ammo_casing/shotgun/syndie
	name = "12g AP-СSS (Armor Piercing Ceramic Shotgun Slug)"
	desc = "A high penetrative 12-gauge сeramic slug without manufacturer's marking."

/obj/item/projectile/bullet/shotgun/slug/syndie
	name = "12g AP-СSS"
	damage = 50 //damage reduced
	armour_penetration = 20 // Armor Piercing
	wound_bonus = -10 // better bleeding chance

/obj/item/ammo_box/magazine/m12g/slug
	name = "shotgun magazine (12g сeramic slugs)"
	desc = "A drum magazine designed for the Bulldog shotgun. \
			Ceramic AP slugs are the best armor issue choice. \
			Armor Piercing death to the Nanotrasen scum!"