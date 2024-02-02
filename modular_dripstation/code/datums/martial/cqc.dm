///CQC counter: attacker's weapon is placed in the defender's offhand and they are knocked down
/datum/martial_art/cqc/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	SIGNAL_HANDLER
	if(!can_use(user))
		return
	var/obj/item/I = attacker.get_active_held_item()
	if(I && istype(I, /obj/item/melee/touch_attack))
		attacker.visible_message(span_warning("[user] twists [attacker]'s arm, sending their [I] back towards them!"), \
						span_userdanger("[user] grabs your arm as you attack and send your [I] back towards you!"))
		to_chat(user, span_danger("Making sure to avoid [attacker]'s [I], you twist their arm to send it right back at them!"))
		var/obj/item/melee/touch_attack/touch_weapon = I
		var/datum/action/cooldown/spell/touch/touch_spell = touch_weapon.spell_which_made_us?.resolve()
		if(!touch_spell)
			return
		INVOKE_ASYNC(touch_spell, /datum/action/cooldown/spell/touch.proc/do_hand_hit, attacker, attacker, touch_weapon)
	else
		user.do_attack_animation(attacker, ATTACK_EFFECT_DISARM)
		attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and throws them to the ground!"), \
							span_userdanger("[user] grabs your arm as you attack and throws you to the ground!"))
		playsound(get_turf(attacker), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
		if(I && !HAS_TRAIT(I, TRAIT_NODROP) && !CHECK_BITFIELD(I.item_flags, ABSTRACT))
			if(attacker.temporarilyRemoveItemFromInventory(I))
				var/hand = user.get_inactive_hand_index()
				if(!user.put_in_hand(I, hand))
					I.forceMove(get_turf(attacker))
	attacker.Knockdown(60)
	user.adjustStaminaLoss(10)	//Can't block forever. Really, if this becomes a problem you're already screwed.