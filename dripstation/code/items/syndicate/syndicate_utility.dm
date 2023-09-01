/obj/item/storage/toolbox/syndicate/deluxe
	name = "suspicious looking toolbox"

/obj/item/storage/toolbox/syndicate/deluxe/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.silent = TRUE

/obj/item/storage/toolbox/syndicate/deluxe/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/combat(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/wirecutters(src, "red")
	new /obj/item/multitool/ai_detect/black_red(src)
	new /obj/item/clothing/gloves/combat(src)
	//YOGS start - toolspeed
	for(var/obj/item/I in contents)
		I.toolspeed = 0.5

/obj/item/multitool/ai_detect/black_red
	name = "suspicious multitool"
	desc = "Suspicious technological device used for unknown purpose. Still functional as basic multitool."
	icon = 'dripstation/icons/obj/device.dmi'
	icon_state = "redmultitool"
	item_state = "redmultitool"
	toolspeed = 0.5
	lefthand_file = 'dripstation/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/equipment/tools_righthand.dmi'

/obj/item/wrench/combat
	name = "combat wrench"
	desc = "It's like a normal wrench but edgier. Can be found on the battlefield."
	icon_state = "wrench_combat"
	item_state = "wrench_combat"
	attack_verb = list("devastated", "brutalized", "commited a war crime against", "obliterated", "humiliated")
	tool_behaviour = null
	toolspeed = 0.5

/obj/item/wrench/combat/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/transforming, \
		force_on = 6, \
		throwforce_on = 8, \
		hitsound_on = hitsound, \
		w_class_on = WEIGHT_CLASS_NORMAL, \
		clumsy_check = FALSE, \
	)
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, PROC_REF(on_transform))

/*
 * Signal proc for [COMSIG_TRANSFORMING_ON_TRANSFORM].
 *
 * Gives it wrench behaviors when active.
 */
/obj/item/wrench/combat/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER

	tool_behaviour = active ? TOOL_WRENCH : initial(tool_behaviour)
	if(user)
		balloon_alert(user, "[name] [active ? "active, woe!":"restrained"]")
	playsound(src, active ? 'sound/weapons/saberon.ogg' : 'sound/weapons/saberoff.ogg', 5, TRUE)
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/inducer/syndicate
	icon_state = "inducer-syndi"
	inhand_icon_state = "inducer-syndi"
	desc = "A tool for inductively charging internal power cells. This one has a suspicious colour scheme, and seems to be rigged to transfer charge at a much faster rate."
	powertransfer = 2000
	cell_type = /obj/item/stock_parts/cell/super

//BEST ENGENEER TOOLBOX

/obj/item/storage/toolbox/emergency/turret
	desc = "You feel a strange urge to hit this with a wrench."

/obj/item/storage/toolbox/emergency/turret/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench/combat(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/analyzer(src)
	new /obj/item/wirecutters(src)

/obj/item/storage/toolbox/emergency/turret/attackby(obj/item/attacking_item, mob/living/user, params)
	if(!istype(attacking_item, /obj/item/wrench/combat))
		return ..()

	if(!user.combat_mode)
		return

	if(!attacking_item.toolspeed)
		return

	balloon_alert(user, "constructing...")
	if(!attacking_item.use_tool(src, user, 2 SECONDS, volume = 20))
		return

	balloon_alert(user, "constructed!")
	user.visible_message(span_danger("[user] bashes [src] with [attacking_item]!"), \
		span_danger("You bash [src] with [attacking_item]!"), null, COMBAT_MESSAGE_RANGE)

	playsound(src, "sound/items/drill_use.ogg", 80, TRUE, -1)
	var/obj/machinery/porta_turret/syndicate/toolbox/turret = new(get_turf(loc))
	set_faction(turret, user)
	turret.toolbox = src
	forceMove(turret)

/obj/item/storage/toolbox/emergency/turret/proc/set_faction(obj/machinery/porta_turret/turret, mob/user)
	turret.faction = list("[REF(user)]")

/obj/item/storage/toolbox/emergency/turret/nukie/set_faction(obj/machinery/porta_turret/turret, mob/user)
	turret.faction = list(ROLE_SYNDICATE)

/obj/machinery/porta_turret/syndicate/toolbox
	icon_state = "toolbox_off"
	base_icon_state = "toolbox"

/obj/machinery/porta_turret/syndicate/toolbox/Initialize(mapload)
	. = ..()
	underlays += image(icon = icon, icon_state = "[base_icon_state]_frame")

/obj/machinery/porta_turret/syndicate/toolbox
	integrity_failure = 0
	max_integrity = 100
	shot_delay = 0.5 SECONDS
	stun_projectile = /obj/projectile/bullet/toolbox_turret
	lethal_projectile = /obj/projectile/bullet/toolbox_turret
	subsystem_type = /datum/controller/subsystem/processing/projectiles
	ignore_faction = TRUE
	/// The toolbox we store.
	var/obj/item/toolbox

/obj/machinery/porta_turret/syndicate/toolbox/examine(mob/user)
	. = ..()
	if(faction_check(faction, user.faction))
		. += span_notice("You can repair it by <b>left-clicking</b> with a combat wrench.")
		. += span_notice("You can fold it by <b>right-clicking</b> with a combat wrench.")

/obj/machinery/porta_turret/syndicate/toolbox/target(atom/movable/target)
	if(!target)
		return

	if(shootAt(target))
		setDir(get_dir(base, target))

	return TRUE

/obj/machinery/porta_turret/syndicate/toolbox/attackby(obj/item/attacking_item, mob/living/user, params)
	if(!istype(attacking_item, /obj/item/wrench/combat))
		return ..()

	if(!attacking_item.toolspeed)
		return

	if(user.combat_mode)
		balloon_alert(user, "deconstructing...")
		if(!attacking_item.use_tool(src, user, 5 SECONDS, volume = 20))
			return

		deconstruct(TRUE)
		attacking_item.play_tool_sound(src, 50)
		balloon_alert(user, "deconstructed!")

	else
		if(atom_integrity == max_integrity)
			balloon_alert(user, "already repaired!")
			return

		balloon_alert(user, "repairing...")
		while(atom_integrity != max_integrity)
			if(!attacking_item.use_tool(src, user, 2 SECONDS, volume = 20))
				return

			repair_damage(10)

		balloon_alert(user, "repaired!")

/obj/machinery/porta_turret/syndicate/toolbox/deconstruct(disassembled)
	if(disassembled)
		var/atom/movable/old_toolbox = toolbox
		toolbox = null
		old_toolbox.forceMove(drop_location())

	else
		new /obj/effect/gibspawner/robot(drop_location())

	return ..()

/obj/machinery/porta_turret/syndicate/toolbox/Destroy()
	toolbox = null
	return ..()

/obj/machinery/porta_turret/syndicate/toolbox/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == toolbox)
		toolbox = null
		qdel(src)

/obj/machinery/porta_turret/syndicate/toolbox/ui_status(mob/user)
	if(faction_check(user.faction, faction))
		return ..()

	return UI_CLOSE

/obj/projectile/bullet/toolbox_turret
	damage = 10
	speed = 0.6



/////////BELTS/////////
/obj/item/storage/belt/military/snack/Initialize()
	. = ..()
	var/sponsor = pick("DonkCo", "Waffle Co.", "Gorlax Marauders", "Tiger Cooperative")
	desc = "A set of snack-tical webbing worn by athletes of the [sponsor] VR sports division."

/obj/item/storage/belt/military/syndicate
	name = "military belt"
	desc = "A classic tactical belt worn by GEC engineers and Gorlex salvagers."
	icon_state = "militarybelt"
	item_state = "militarybelt"

/obj/item/storage/belt/military/syndicate/utility
	preload = FALSE

/obj/item/storage/belt/military/syndicate/utility/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/combat(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/wirecutters(src, "red")
	new /obj/item/multitool/ai_detect/black_red(src)
	new /obj/item/inducer/syndicate(src)


///////HOLSTERS/////////
/obj/item/storage/belt/holster/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 3
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/ammo_box/c38, //There isn't a speedloader parent type, so I just put these three here by hand.
		/obj/item/ammo_box/a357, //I didn't want to just use /obj/item/ammo_box, because then this could hold huge boxes of ammo.
		/obj/item/ammo_box/a762,
		/obj/item/gun/energy/e_gun/mini
		))

/obj/item/storage/belt/holster/energy
	name = "energy shoulder holsters"
	desc = "A rather plain pair of shoulder holsters with a bit of insulated padding inside. Designed to hold energy weaponry."

/obj/item/storage/belt/holster/energy/ComponentInitialize()
	. = ..()
	STR.max_items = 2
	STR.set_holdable(list(
		/obj/item/gun/energy/e_gun/mini,
		/obj/item/gun/energy/disabler,
		/obj/item/gun/energy/dueling,
		/obj/item/food/grown/banana,
		/obj/item/gun/energy/laser/thermal,
		/obj/item/gun/energy/recharge/ebow
	))

/obj/item/storage/belt/holster/syndicate/nukie
	name = "operative holster"
	desc = "A deep shoulder holster capable of holding any form of normal sized firearm and its ammo."
	icon_state = "syndicate_holster"
	item_state = "syndicate_holster"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/belt/holster/syndicate/nukie/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(
		/obj/item/gun, // Guns.
		/obj/item/ammo_box/magazine, // ALL magazines.
		/obj/item/ammo_box/c38, //There isn't a speedloader parent type, so I just put these three here by hand.
		/obj/item/ammo_box/a357, //I didn't want to just use /obj/item/ammo_box, because then this could hold huge boxes of ammo.
		/obj/item/ammo_box/a762,
		/obj/item/ammo_casing, // For shotgun shells, rockets, launcher grenades, and a few other things.
		/obj/item/grenade, // All regular grenades, the big grenade launcher fires these.
		/obj/item/food/grown/banana
	))

///obj/item/storage/belt/holster/syndicate/sling
//	name = "tactical sling"
//	desc = "Tactical sling capable of holding almost any form of firearm."
//	icon_state = "tactical_sling"
//	item_state = "tactical_sling"
//	w_class = WEIGHT_CLASS_HUGE

///obj/item/storage/belt/holster/syndicate/sling/ComponentInitialize()
//	. = ..()
//	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
//	STR.max_items = 1
//	STR.max_w_class = WEIGHT_CLASS_HUGE
//	STR.set_holdable(list(
//		/obj/item/gun, // ALL guns.
//	))