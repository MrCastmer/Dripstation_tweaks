#define PIXEL_DROPPED -6

/obj/item/storage/csmarkers
	name = "crime scene markers kit"
	desc = "A box containing crime scene markers."
	icon = 'modular_dripstation/icons/obj/forensics.dmi'
	icon_state = "marker_box"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/csmarkers/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/crime_scene_marker))

/obj/item/storage/csmarkers/PopulateContents()
	for(var/i = 1 to 7)
		new /obj/item/crime_scene_marker(src, i)

/obj/item/crime_scene_marker
	name = "crime scene marker"
	desc = "Stay organized during investigation."
	icon = 'modular_dripstation/icons/obj/forensics.dmi'
	icon_state = "card"
	w_class = WEIGHT_CLASS_TINY
	layer = BASE_ABOVE_OBJ_LAYER
	randpixel = 2

/obj/item/crime_scene_marker/Initialize(loc, number)
	. = ..()
	icon_state = "[icon_state][number]"

/obj/item/crime_scene_marker/dropped()
	pixel_y = PIXEL_DROPPED
	pixel_x = PIXEL_DROPPED
	return ..()

#undef PIXEL_DROPPED
