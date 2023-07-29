/obj/item/clothing/gloves/fingerless/bigboss/combat
	name = "\improper tactical fingerless gloves"
	desc = "These high-quality tactical gloves are made of genuine leather and suede. They provide thermal protection even without fingers covered. Looks expensive."
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "tacticalgloves"
	item_state = "tacticalgloves"
	siemens_coefficient = 1 // Bare fingers
	cold_protection = ARMS|HANDS
	heat_protection = ARMS|HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	armor = list(MELEE = 15, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50)

/obj/item/clothing/gloves/cargo_gauntlet
	name = "\improper cargo gauntlets"
	desc = "These rubberized gauntlets have high adhesion to the metal surface that allows you to drag crates and lockers with more confidence on them not getting nabbed from you."
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hands.dmi'
	siemens_coefficient = 0.6 // Some shock protected material anyway
	icon_state = "cargogloves"
	item_state = "cargogloves"
	cold_protection = HANDS
	heat_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	undyeable = TRUE
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 50)
	var/datum/weakref/pull_component_weakref

/obj/item/clothing/gloves/cargo_gauntlet/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_EQUIPPED, PROC_REF(on_glove_equip))
	RegisterSignal(src, COMSIG_ITEM_POST_UNEQUIP, PROC_REF(on_glove_unequip))

/// Called when the glove is equipped. Adds a component to the equipper and stores a weak reference to it.
/obj/item/clothing/gloves/cargo_gauntlet/proc/on_glove_equip(datum/source, mob/equipper, slot)
	SIGNAL_HANDLER

	if(!(slot & SLOT_GLOVES))
		return

	var/datum/component/strong_pull/pull_component = pull_component_weakref?.resolve()
	if(pull_component)
		stack_trace("Gloves already have a pull component associated with \[[pull_component.parent]\] when \[[equipper]\] is trying to equip them.")
		QDEL_NULL(pull_component_weakref)

	to_chat(equipper, span_notice("You feel the gauntlets activate as soon as you fit them on, making your pulls stronger!"))

	pull_component_weakref = WEAKREF(equipper.AddComponent(/datum/component/strong_pull))

/*
 * Called when the glove is unequipped. Deletes the component if one exists.
 *
 * No component being associated on equip is a valid state, as holding the gloves in your hands also counts
 * as having them equipped, or even in pockets. They only give the component when they're worn on the hands.
 */
/obj/item/clothing/gloves/cargo_gauntlet/proc/on_glove_unequip(datum/source, force, atom/newloc, no_move, invdrop, silent)
	SIGNAL_HANDLER

	var/datum/component/strong_pull/pull_component = pull_component_weakref?.resolve()

	if(!pull_component)
		return

	to_chat(pull_component.parent, span_warning("You have lost the grip power of [src]!"))

	QDEL_NULL(pull_component_weakref)


/obj/item/clothing/gloves/color/chief_engineer
	desc = "These gloves provide excellent heat and electric insulation. They are so thin you can barely feel them."
	name = "\improper advanced insulated gloves"
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "ce_insuls"
	item_state = "ce_insuls"
	siemens_coefficient = 0
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE