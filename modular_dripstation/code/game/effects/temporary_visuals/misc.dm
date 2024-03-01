/obj/effect/temp_visual/annoyed
	name = "annoyed"
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	icon_state = "annoyed"
	duration = 25

/obj/effect/temp_visual/annoyed/Initialize(mapload)
	. = ..()
	pixel_x = rand(-4,0)
	pixel_y = rand(8,12)
	animate(src, pixel_y = pixel_y + 16, alpha = 0, time = duration)

/obj/effect/frosty_breath
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	icon_state = "frosty_breath"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = ABOVE_MOB_LAYER
	anchored = TRUE

/obj/effect/frosty_breath/Initialize(mapload, mob/living/carbon/C)
	. = ..()
	dir = C.dir
	if(C.buckled)
		pixel_y = (C.buckled.buckle_offset + 10)
	if(dir == NORTH)
		layer = BELOW_MOB_LAYER
	flick("breath_[C.lying_prev]", src)
	QDEL_IN(src, 2 SECONDS)