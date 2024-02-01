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