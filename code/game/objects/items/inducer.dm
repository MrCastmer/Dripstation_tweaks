/obj/item/inducer
	name = "inducer"
	desc = "A tool for inductively charging internal power cells."
	icon = 'icons/obj/tools.dmi'
	icon_state = "inducer-engi"
	item_state = "inducer-engi"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	force = 7
	var/powertransfer = 1000
	var/opened = FALSE
	var/cell_type = /obj/item/stock_parts/cell/high
	var/obj/item/stock_parts/cell/cell
	var/recharging = FALSE

/obj/item/inducer/Initialize(mapload)
	. = ..()
	if(!cell && cell_type)
		cell = new cell_type

/obj/item/inducer/proc/induce(obj/item/stock_parts/cell/target, coefficient)
	var/totransfer = min(cell.charge,(powertransfer * coefficient))
	var/transferred = target.give(totransfer)
	cell.use(transferred)
	cell.update_appearance(UPDATE_ICON)
	target.update_appearance(UPDATE_ICON)

/obj/item/inducer/get_cell()
	return cell

/obj/item/inducer/emp_act(severity)
	. = ..()
	if(cell && !(. & EMP_PROTECT_CONTENTS))
		cell.emp_act(severity)

/obj/item/inducer/attack_obj(obj/O, mob/living/carbon/user)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(cantbeused(user))
		return

	if(recharge(O, user))
		return

	return ..()

/obj/item/inducer/proc/cantbeused(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, span_warning("You don't have the dexterity to use [src]!"))
		return TRUE

	if(!cell)
		to_chat(user, span_warning("[src] doesn't have a power cell installed!"))
		return TRUE

	if(!cell.charge)
		to_chat(user, span_warning("[src]'s battery is dead!"))
		return TRUE
	return FALSE


/obj/item/inducer/attackby(obj/item/W, mob/user)
	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		W.play_tool_sound(src)
		if(!opened)
			to_chat(user, span_notice("You unscrew the battery compartment."))
			opened = TRUE
			update_appearance(UPDATE_ICON)
			return
		else
			to_chat(user, span_notice("You close the battery compartment."))
			opened = FALSE
			update_appearance(UPDATE_ICON)
			return
	if(istype(W, /obj/item/stock_parts/cell))
		if(opened)
			if(!cell)
				if(!user.transferItemToLoc(W, src))
					return
				to_chat(user, span_notice("You insert [W] into [src]."))
				cell = W
				update_appearance(UPDATE_ICON)
				return
			else
				to_chat(user, span_notice("[src] already has \a [cell] installed!"))
				return

	if(cantbeused(user))
		return

	if(recharge(W, user))
		return

	return ..()

/obj/item/inducer/proc/recharge(atom/movable/A, mob/user)
	if(!isturf(A) && user.loc == A)
		return FALSE
	if(recharging)
		return TRUE
	else
		recharging = TRUE
	var/obj/item/stock_parts/cell/C = A.get_cell()
	var/obj/O
	var/coefficient = 1
	if(istype(A, /obj/item/gun/energy))
		to_chat(user,"Error unable to interface with device")
		return FALSE
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		if(HAS_TRAIT(H, TRAIT_POWERHUNGRY)) //let's charge some dumb robot players
			if(user.zone_selected != BODY_ZONE_CHEST)
				to_chat(user, span_warning("You need to target [A]'s chest with [src] to recharge [H.p_them()]!"))
				recharging = FALSE
				return TRUE
			coefficient = 0.1
			var/totransfer = min(cell.charge,(powertransfer * coefficient))
			var/done_any = FALSE
			if(H.nutrition >= NUTRITION_LEVEL_FAT - 25)
				to_chat(user, span_notice("[A] is fully charged!"))
				recharging = FALSE
				return TRUE
			user.visible_message("[user] starts recharging [A] with [src].",span_notice("You start recharging [A] with [src]."))
			while(H.nutrition < NUTRITION_LEVEL_FAT - 25)
				if(do_after(user, 1 SECONDS, user) && cell.charge)
					done_any = TRUE
					cell.use(totransfer*coefficient)
					H.adjust_nutrition(powertransfer*coefficient)
					H.apply_damage(totransfer*coefficient, BURN, BODY_ZONE_CHEST, wound_bonus = CANT_WOUND)
					user.visible_message("Smoke rises off of [A]'s body!",span_notice("You smell something burning as [A] is charged by the [src]!"))
					do_sparks(1, FALSE, A)
					if(O)
						O.update_appearance(UPDATE_ICON)
				else
					break
			if(done_any) // Only show a message if we succeeded at least once
				user.visible_message("[user] recharged [A]!",span_notice("You recharged [A]!"))
			recharging = FALSE
			return TRUE
	if(istype(A, /obj))
		O = A
	if(C)
		var/done_any = FALSE
		if(C.charge >= C.maxcharge)
			to_chat(user, span_notice("[A] is fully charged!"))
			recharging = FALSE
			return TRUE
		user.visible_message("[user] starts recharging [A] with [src].",span_notice("You start recharging [A] with [src]."))
		while(C.charge < C.maxcharge)
			if(do_after(user, 1 SECONDS, user) && cell.charge)
				done_any = TRUE
				induce(C, coefficient)
				do_sparks(1, FALSE, A)
				if(O)
					O.update_appearance(UPDATE_ICON)
			else
				break
		if(done_any) // Only show a message if we succeeded at least once
			user.visible_message("[user] recharged [A]!",span_notice("You recharged [A]!"))
		recharging = FALSE
		return TRUE
	recharging = FALSE


/obj/item/inducer/attack(mob/M, mob/user)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(cantbeused(user))
		return

	if(recharge(M, user))
		return
	return ..()


/obj/item/inducer/attack_self(mob/user)
	if(opened && cell)
		user.visible_message("[user] removes [cell] from [src]!",span_notice("You remove [cell]."))
		cell.update_appearance(UPDATE_ICON)
		user.put_in_hands(cell)
		cell = null
		update_appearance(UPDATE_ICON)


/obj/item/inducer/examine(mob/living/M)
	. = ..()
	if(cell)
		. += span_notice("Its display shows: [DisplayEnergy(cell.charge)].")
	else
		. += span_notice("Its display is dark.")
	if(opened)
		. += span_notice("Its battery compartment is open.")

/obj/item/inducer/update_overlays()
	. = ..()
	if(opened)
		if(!cell)
			. += "inducer-nobat"
		else
			. += "inducer-bat"

/obj/item/inducer/sci
	icon_state = "inducer-sci"
	item_state = "inducer-sci"
	desc = "A tool for inductively charging internal power cells. This one has a science color scheme, and is less potent than its engineering counterpart."
	cell_type = null
	powertransfer = 500
	opened = TRUE

/obj/item/inducer/sci/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_ICON)
