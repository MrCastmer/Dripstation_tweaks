///Table on wheels
/obj/structure/table/rolling
	name = "Rolling table"
	desc = "An NT brand \"Rolly poly\" rolling table. It can and will move."
	anchored = FALSE
	canSmoothWith = null
	icon = 'dripstation/icons/obj/rollingtable.dmi'
	icon_state = "rollingtable"
	var/list/attached_items = list()

/obj/structure/table/rolling/Moved()
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 100, 1)

/obj/structure/table/proc/AfterPutItemOnTable(obj/item/I, mob/living/user)
	return

/obj/structure/table/rolling/AfterPutItemOnTable(obj/item/I, mob/living/user)
	. = ..()
	attached_items += I
	RegisterSignal(I, COMSIG_MOVABLE_MOVED, PROC_REF(RemoveItemFromTable)) //Listen for the pickup event, unregister on pick-up so we aren't moved

/obj/structure/table/rolling/proc/RemoveItemFromTable(datum/source, newloc, dir)
	SIGNAL_HANDLER

	if(newloc != loc) //Did we not move with the table? because that shit's ok
		return FALSE
	attached_items -= source
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)

/obj/structure/table/rolling/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	if(!loc)
		return
	for(var/mob/living/living_mob in old_loc.contents)//Kidnap everyone on top
		living_mob.forceMove(loc)
	for(var/atom/movable/attached_movable as anything in attached_items)
		if(!attached_movable.Move(loc))
			RemoveItemFromTable(attached_movable, attached_movable.loc)


/obj/item/rolling_table_dock
	name = "rolling table dock"
	desc = "A collapsed roller table that can be ejected for service on the go. Must be collected or replaced after use."
	icon = 'dripstation/icons/obj/rollingtable.dmi'
	icon_state = "rollingtable"
	var/obj/structure/table/rolling/loaded = null

/obj/item/rolling_table_dock/Initialize(mapload)
	. = ..()
	loaded = new(src)

/obj/structure/table/rolling/attackby(obj/item/wtable, mob/user, params)
	if(!istype(wtable, /obj/item/rolling_table_dock))
		return ..()
	var/obj/item/rolling_table_dock/rable = wtable
	var/turf/target_table = get_turf(src)
	if(rable.loaded)
		to_chat(user, span_warning("You already have a roller table docked!"))
		return
	if(locate(/mob/living) in target_table)
		to_chat(user, span_warning("You can't collect the table with that much on top!"))
		return
	else
		rable.loaded = src
		forceMove(rable)
		user.visible_message(span_notice("[user] collects [src]."), balloon_alert(user, "you collect the [src]."))
	return TRUE

/obj/item/rolling_table_dock/afterattack(obj/target, mob/user , proximity)
	. = ..()
	var/turf/target_turf = get_turf(target)
	if(!proximity || is_blocked_turf(target_turf) || locate(/mob/living) in target_turf)
		return
	if(isopenturf(target))
		deploy_rolling_table(user, target)

/obj/item/rolling_table_dock/proc/deploy_rolling_table(mob/user, atom/location)
	var/obj/structure/table/rolling/rable = new /obj/structure/table/rolling(location)
	rable.add_fingerprint(user)
	qdel(src)

/obj/item/rolling_table_dock/examine(mob/user)
	. = ..()
	. += "The dock is [loaded ? "loaded" : "empty"]."

/obj/item/rolling_table_dock/deploy_rolling_table(mob/user, atom/location)
	if(loaded)
		loaded.forceMove(location)
		user.visible_message(span_notice("[user] deploys [loaded]."), balloon_alert(user, "you deploy the [loaded]."))
		loaded = null
	else
		balloon_alert(user, "the dock is Empty!")