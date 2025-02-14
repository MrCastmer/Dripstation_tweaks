/obj/item/computer_hardware/card_slot
	name = "identification card authentication module"	// \improper breaks the find_hardware_by_name proc
	desc = "A module allowing this computer to read or write data on ID cards. Necessary for some programs to run properly."
	power_usage = 10 //W
	icon_state = "card_mini"
	w_class = WEIGHT_CLASS_TINY
	device_type = MC_CARD

	var/obj/item/card/id/stored_card

///What happens when the ID card is removed (or deleted) from the module, through try_eject() or not.
/obj/item/computer_hardware/card_slot/Exited(atom/A, atom/newloc)
	if(A == stored_card)
		stored_card = null
		if(holder)
			if(holder.active_program)
				holder.active_program.event_idremoved(0)
			for(var/p in holder.idle_threads)
				var/datum/computer_file/program/computer_program = p
				computer_program.event_idremoved(1)

			holder.update_slot_icon()

			if(ishuman(holder.loc))
				var/mob/living/carbon/human/human_wearer = holder.loc
				if(human_wearer.wear_id == holder)
					human_wearer.sec_hud_set_ID()
	return ..()

/obj/item/computer_hardware/card_slot/Destroy()
	if(stored_card) //If you didn't expect this behavior for some dumb reason, do something different instead of directly destroying the slot
		QDEL_NULL(stored_card)
	return ..()

/obj/item/computer_hardware/card_slot/GetAccess()
	var/list/total_access
	if(stored_card)
		total_access = stored_card.GetAccess()
	var/obj/item/computer_hardware/card_slot/card_slot2 = holder?.all_components[MC_CARD2] //Best of both worlds
	if(card_slot2?.stored_card)
		total_access |= card_slot2.stored_card.GetAccess()
	return total_access

/obj/item/computer_hardware/card_slot/GetID()
	if(stored_card)
		return stored_card
	return ..()

/obj/item/computer_hardware/card_slot/RemoveID()
	if(stored_card)
		. = stored_card
		if(!try_eject())
			holder.update_label()
			return null
		holder.update_label()
		return

/obj/item/computer_hardware/card_slot/try_insert(obj/item/I, mob/living/user = null)
	if(!holder)
		return FALSE

	if(!istype(I, /obj/item/card/id))
		return FALSE

	if(stored_card)
		return FALSE
	if(user)
		if(!user.transferItemToLoc(I, src))
			return FALSE
	else
		I.forceMove(src)

	stored_card = I
	holder.update_label()
	to_chat(user, "<span class='notice'>You insert \the [I] into \the [expansion_hw ? "secondary":"primary"] [src].</span>")
	playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, 0)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.sec_hud_set_ID()
	return TRUE


/obj/item/computer_hardware/card_slot/try_eject(mob/living/user = null, forced = FALSE)
	if(!stored_card)
		to_chat(user, span_warning("There are no cards in \the [src]."))
		return FALSE

	if(user && user.CanReach(src))
		user.put_in_hands(stored_card)
	else
		stored_card.forceMove(drop_location())

	to_chat(user, "<span class='notice'>You remove the card from \the [src].</span>")
	playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, FALSE)
	return TRUE

/obj/item/computer_hardware/card_slot/attackby(obj/item/I, mob/living/user)
	if(..())
		return
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(stored_card)
			to_chat(user, "<span class='notice'>You press down on the manual eject button with \the [I].</span>")
			try_eject(user)
			return
		swap_slot()
		to_chat(user, "<span class='notice'>You adjust the connecter to fit into [expansion_hw ? "an expansion bay" : "the primary ID bay"].</span>")

/**
  *Swaps the card_slot hardware between using the dedicated card slot bay on a computer, and using an expansion bay.
*/
/obj/item/computer_hardware/card_slot/proc/swap_slot()
	expansion_hw = !expansion_hw
	if(expansion_hw)
		device_type = MC_CARD2
	else
		device_type = MC_CARD

/obj/item/computer_hardware/card_slot/examine(mob/user)
	. = ..()
	. += "The connector is set to fit into [expansion_hw ? "an expansion bay" : "a computer's primary ID bay"], but can be adjusted with a screwdriver."
	if(stored_card)
		. += "There appears to be something loaded in the card slots."

/obj/item/computer_hardware/card_slot/secondary
	name = "auxillary identification card authentication module"	// \improper breaks the find_hardware_by_name proc
	desc = "A secondary identification card authentication module, allowing this computer to write data on ID cards. Necessary for some programs to run properly."
	device_type = MC_CARD2
	expansion_hw = TRUE
