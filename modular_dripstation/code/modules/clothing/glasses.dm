/obj/item/clothing/glasses/meson
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/meson/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/meson/sunglasses/ce
	name = "advanced engineering aviators"
	desc = "A meson scanner, diagnostic HUD, and reactive welding shield built into a pair of aviators."
	icon_state = "aviator_meson"

/obj/item/clothing/glasses/science
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/night
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	var/can_toggle = TRUE
	var/hud_type = null
	var/on = FALSE
	var/darkness_view_off = 0
	var/flash_protect_off = 2
	var/lighting_alpha_off = LIGHTING_PLANE_ALPHA_INVISIBLE
	var/glass_colour_type_off = null

/datum/action/item_action/toggle_nvg
	name = "Toggle NVG"

/datum/action/item_action/toggle_nvg/IsAvailable(mob/living/carbon/human/user, feedback = FALSE)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src)
		to_chat(src, span_warning("You need to put on your NVG before doing that!"))
		return FALSE
	return ..()

/obj/item/clothing/glasses/night/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(can_toggle && !on)
		return
	if(can_toggle && on)
		on = FALSE
		thermal_overload()

/obj/item/clothing/glasses/night/update_overlays()
	..()
	if(!on)
		icon_state = "night-off"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/glasses/night/Initialize(mapload)
	..()
	if(can_toggle)
		on = FALSE
		actions_types = list(/datum/action/item_action/toggle_nvg)
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		update_appearance(UPDATE_ICON)

/obj/item/clothing/glasses/night/equipped(mob/living/carbon/human/user, slot)
	..()
	if(slot == ITEM_SLOT_EYES && on)
		darkness_view = initial(darkness_view)
		flash_protect = initial(flash_protect)
		lighting_alpha = initial(lighting_alpha)
		glass_colour_type = initial(glass_colour_type)
		if(hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)

/obj/item/clothing/glasses/night/dropped(mob/living/carbon/human/user)
	..()
	if(istype(user) && user.glasses == src && on)
		on = FALSE
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		if(hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.hide_from(user)

/obj/item/clothing/glasses/night/attack_self(mob/user, slot)
	if(!can_toggle)
		return
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src || slot == ITEM_SLOT_EYES)
		return
	on = !on
	if(on)
		darkness_view = initial(darkness_view)
		flash_protect = initial(flash_protect)
		lighting_alpha = initial(lighting_alpha)
		glass_colour_type = initial(glass_colour_type)
		if(hud_type && slot == ITEM_SLOT_EYES && on)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)
	else
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		if(hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.hide_from(user)

/obj/item/clothing/glasses/night/security
	icon_state = "tact-securityhudnight"
	hud_type = DATA_HUD_SECURITY_ADVANCED

/obj/item/clothing/glasses/night/health
	icon_state = "tact-healthhudnight"
	hud_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/clothing/glasses/night/diagnostic
	icon_state = "tact-diagnostichudnight"
	hud_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/clothing/glasses/material
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/material/mining/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/sunglasses/reagent
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudbeer"

/obj/item/clothing/glasses/thermal
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "tact-thermal_nvg"
	var/can_toggle = TRUE
	var/on = FALSE
	var/darkness_view_off = 0
	var/flash_protect_off = 2
	var/lighting_alpha_off = LIGHTING_PLANE_ALPHA_INVISIBLE
	var/glass_colour_type_off = null
	var/vision_flags_off = null

/obj/item/clothing/glasses/thermal/update_overlays()
	..()
	if(!on)
		icon_state = "night-off"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/glasses/thermal/emp_act(severity)
	if(can_toggle && !on)
		return
	. = ..()

/obj/item/clothing/glasses/thermal/Initialize(mapload)
	..()
	if(can_toggle)
		on = FALSE
		actions_types = list(/datum/action/item_action/toggle_nvg)
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off
		update_appearance(UPDATE_ICON)

/obj/item/clothing/glasses/thermal/equipped(mob/living/carbon/human/user, slot)
	..()
	if(can_toggle && slot == ITEM_SLOT_EYES && on)
		darkness_view = initial(darkness_view)
		flash_protect = initial(flash_protect)
		lighting_alpha = initial(lighting_alpha)
		glass_colour_type = initial(glass_colour_type)
		vision_flags = initial(vision_flags)

/obj/item/clothing/glasses/thermal/dropped(mob/living/carbon/human/user)
	..()
	if(can_toggle && istype(user) && user.glasses == src && on)
		on = FALSE
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off

/obj/item/clothing/glasses/thermal/attack_self(mob/user, slot)
	if(!can_toggle)
		return
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wearer = user
	if (wearer.glasses != src || slot == ITEM_SLOT_EYES)
		return
	on = !on
	if(on)
		darkness_view = initial(darkness_view)
		flash_protect = initial(flash_protect)
		lighting_alpha = initial(lighting_alpha)
		glass_colour_type = initial(glass_colour_type)
		vision_flags = initial(vision_flags)
	else
		darkness_view = darkness_view_off
		flash_protect = flash_protect_off
		lighting_alpha = lighting_alpha_off
		glass_colour_type = glass_colour_type_off
		vision_flags = vision_flags_off

/obj/item/clothing/glasses/thermal/xray
	name = "syndicate xray goggles"
	desc = "A pair of xray goggles manufactured by the Syndicate."
	icon_state = "tact-xray_nvg"

/obj/item/clothing/glasses/thermal/syndi
	icon_state = "thermal"
	can_toggle = FALSE

/obj/item/clothing/glasses/thermal/monocle
	can_toggle = FALSE

/obj/item/clothing/glasses/thermal/eyepatch
	icon_state = "thermalpatch_combat"
	can_toggle = FALSE

/////HUDs///////
/obj/item/clothing/glasses/hud/health
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/hud/health/sunglasses/cmo
	name = "medical advanced HUDaviators"
	desc = "Aviators with a medical HUD. This one is augmented with a reagent scanner."
	icon_state = "aviator_med"

/obj/item/clothing/glasses/hud/diagnostic
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/rd
	name = "diagnostic advanced HUDaviators"
	desc = "Aviators with a diagnostic HUD. This one is augmented with a reagent scanner."
	icon_state = "aviator_rd"
	clothing_flags = SCAN_REAGENTS

/obj/item/clothing/glasses/hud/security
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/hos
	name = "security advanced HUDaviators"
	desc = "Aviators with a security HUD. This one is augmented with a medical scanner."
	icon_state = "aviator_sechos"

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	icon = 'icons/obj/clothing/glasses.dmi'
	mob_overlay_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/toggle/thermal
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'