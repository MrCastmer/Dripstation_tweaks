/obj/item/gun/ballistic/rifle/boltaction/brand_new
	desc = "A brand new Mosin Nagant issued by Nanotrasen for their interns. You would rather not to damage it."
	icon_state = "mosinprime"
	item_state = "mosinprime"
	sawn_desc = "A sawn-off Brand New Nagant... Doing this was a sin, I hope you're happy. \
		You are now probably one of the few people in the universe to ever hold a \"Brand New Obrez\". \
		Even thinking about that name combination makes you ill."
	icon = 'dripstation/icons/obj/weapons/48x32.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/rifle/boltaction/brand_new/sawoff(mob/user)
	. = ..()
	if(.)
		name = "\improper Brand New Obrez" // wear it loud and proud

/obj/item/gun/ballistic/rifle/boltaction/qmrifle
	name = "\improper 'Forbidden' precision rifle"
	desc = "Modernized boltaction rifle, the frame feels robust as cargotech liver. \
	This thing was probably built with a conversion kit from a shady NTnet site. \
	<br><br>\
	<i>BRAND NEW: Cannot be sawn off.</i>"
	icon = 'dripstation/icons/obj/weapons/48x32.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon_state = "mosintactical"
	item_state = "mosintactical"
	can_be_sawn_off = FALSE



//////intermediate bullets//////
///New SSAAP 5.56
/obj/item/ammo_box/magazine/m556/ssaap
	name = "toploader magazine (SSA AP 5.56mm)"
	desc = "A 30-round toploading magazine filled with armor-piercing 5.56 rounds, designed for TGov military. \
			These rounds sacrifice some stopping power for bypassing special protective equipment."
	icon_state = "5.56mA-30"
	ammo_type = /obj/item/ammo_casing/a556/ap
	sprite_designation = "A"

/obj/item/ammo_box/magazine/r556/ssaap
	name = "rifle magazine (SSA AP 5.56mm)"
	desc = "An alternative 30-round magazine for the NT ARG 'Boarder' Rifle. Filled with TGov SSA AP 5.56 rounds. \
			These rounds sacrifice some stopping power for bypassing special protective equipment."
	icon_state = "arg556A"
	ammo_type = /obj/item/ammo_casing/a556/ap
	sprite_designation = "A"

/obj/item/ammo_casing/a556/ssaap
	name = "5.56mm TGov SSA AP bullet casing"
	desc = "A 5.56x45mm TGov SSA AP cartridge with a two-part armor-piercing projectile, the bullet consists of a sabot and a tungsten carbide penetrator body, in a brass case."
	icon_state = "556ap-casing"
	projectile_type = /obj/item/projectile/bullet/a556/ap

/obj/item/projectile/bullet/a556/ssaap
	name = "5.56mm TGov SSA AP bullet"
	damage = 29
	armour_penetration = 60
	penetrating = TRUE //Goes through a single mob before ending on the next target
	penetrations = 1
	wound_bonus = -45

///AP 5.56

/obj/item/ammo_box/magazine/m556/ap
	name = "toploader magazine (Armor-Piercing M995 5.56mm)"
	desc = "A 30-round toploading magazine filled with M995 5.56 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."

/obj/item/ammo_box/magazine/r556/ap
	name = "rifle magazine (Armor-Piercing M995 5.56mm)"
	desc = "An alternative 30-round magazine for the NT ARG 'Boarder' Rifle. Filled with M995 5.56 rounds. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."

/obj/item/ammo_casing/a556/ap
	name = "5.56mm M995 bullet casing"
	desc = "A 5.56x45mm M995 cartridge with a 3.4 gram armor-piercing bullet with a tungsten carbide penetrator over an aluminum base with a copper jacket, in a brass case. "

/obj/item/projectile/bullet/a556/ap
	damage = 32
	name = "5.56mm M995 bullet"
	armour_penetration = 40
	wound_bonus = -45

///Standart 5.56
/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	desc = "A 30-round toploading magazine filled with 5.56 rounds, designed for assault rifles." //Da fack they should be designed for submachine gun?

/obj/item/projectile/bullet/a556
	armour_penetration = 10

///Incendiary 5.56
/obj/item/projectile/bullet/incendiary/a556
	armour_penetration = 20