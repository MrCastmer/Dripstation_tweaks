///restrain combo string
#define LOW_RESTRAIN_COMBO "GG"

/datum/martial_art/trained
	name = "Trained Combat"
	id = MARTIALART_TRAINED
	help_verb = /mob/living/carbon/human/proc/trained_help
	block_chance = 60 //Don't get into melee with someone trained for melee and prepared for your attacks
	nonlethal = TRUE //all attacks deal solely stamina damage or knock out before dealing lethal amounts of damage

/datum/martial_art/trained/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	if(findtext(streak,LOW_RESTRAIN_COMBO))
		streak = ""
		LowRestrain(A,D)
		return TRUE
	return FALSE

/datum/martial_art/trained/proc/LowRestrain(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(restraining)
		return
	if(!can_use(A))
		return FALSE
	if(!D.stat)
		log_combat(A, D, "restrained (Trained Combat)")
		D.visible_message(span_warning("[A] locks [D] into a restraining position!"), \
							span_userdanger("[A] locks you into a restraining position!"))
		D.Stun(2 SECONDS)
		if(!(A.pulling == D))
			D.grabbedby(A, 1)
		if(A.grab_state < GRAB_AGGRESSIVE)
			A.grab_state = GRAB_AGGRESSIVE
		restraining = TRUE
	return TRUE

/datum/martial_art/trained/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	var/picked_hit_type = pick("punched effectively", "kicked effectively", "tacticooled")
	var/effective_damage = A.get_punchdamagehigh()
	D.apply_damage(effective_damage, STAMINA)
	playsound(get_turf(D), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
	D.visible_message(span_danger("[A] [picked_hit_type] [D]!"), \
					  span_userdanger("[A] [picked_hit_type] you!"))
	log_combat(A, D, "[picked_hit_type] (Trained Combat)")
	if(!(A.mobility_flags & MOBILITY_STAND) && (D.mobility_flags & MOBILITY_STAND))
		D.visible_message("<span class='warning'>[A] leg sweeps [D]!", \
							span_userdanger("[A] leg sweeps you!"))
		playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
		D.Knockdown(30)
		A.set_resting(FALSE)
		A.SetKnockdown(0)
		log_combat(A, D, "leg sweeped (Trained Combat)")
	return TRUE

///CQC grab, no stun
/datum/martial_art/trained/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A.a_intent == INTENT_GRAB && A!=D && (can_use(A) && can_use(D))) // A!=D prevents grabbing yourself
		add_to_streak("G",D)
		if(check_streak(A,D)) //if a combo is made no grab upgrade is done
			return TRUE
		if(D.grabbedby(A))
			D.drop_all_held_items()
		if(A.grab_state < 1)
			restraining = FALSE
		return TRUE
	else
		return FALSE

///CQC-like counter: attacker's weapon is placed in the defender's offhand and they are knocked down
/datum/martial_art/trained/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	if(!can_use(user))
		return
	user.adjustStaminaLoss(35)	//Can't block forever. Not so effective as real CQC, can do it only a few times before screw up
	user.do_attack_animation(attacker, ATTACK_EFFECT_DISARM)
	var/obj/item/I = attacker.get_active_held_item()
	if(I && istype(I, /obj/item/melee/touch_attack))
		attacker.visible_message(span_warning("[user] twists [attacker]'s arm, sending their [I] back towards them!"), \
						span_userdanger("[user] grabs your arm as you attack and send your [I] back towards you!"))
		to_chat(user, span_danger("Making sure to avoid [attacker]'s [I], you twist their arm to send it right back at them!"))
		var/obj/item/melee/touch_attack/touch_weapon = I
		var/datum/action/cooldown/spell/touch/touch_spell = touch_weapon.spell_which_made_us?.resolve()
		if(!touch_spell)
			return
		INVOKE_ASYNC(touch_spell, /datum/action/cooldown/spell/touch.proc/do_hand_hit, touch_weapon, attacker, attacker)
		return COMPONENT_NO_AFTERATTACK
	else
		attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and throws them to the ground!"), \
							span_userdanger("[user] grabs your arm as you attack and throws you to the ground!"))
		playsound(get_turf(attacker), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
		if(I && !HAS_TRAIT(I, TRAIT_NODROP) && !CHECK_BITFIELD(I.item_flags, ABSTRACT))
			if(attacker.temporarilyRemoveItemFromInventory(I))
				var/hand = user.get_inactive_hand_index()
				if(!user.put_in_hand(I, hand))
					I.forceMove(get_turf(attacker))
		attacker.Knockdown(60)


/mob/living/carbon/human/proc/trained_help()
	set name = "Remember The Basics"
	set desc = "You try to remember some of the basics of your combat trainings."
	set category = "No Martial Art"
	to_chat(usr, "<b><i>You try to remember some of the basics of your combat trainings.</i></b>")

	to_chat(usr, span_notice("<b>All of your unarmed attacks deal stamina damage instead of your normal physical damage type</b>"))

	to_chat(usr, span_notice("<b>Grab Intent</b> Allow you to quickly increase the strength of your grabs"))
	to_chat(usr, span_notice("<b>Harm Intent</b> Will deal a competitive amount of stamina damage, and hitting a standing opponent while you are prone will both knock them down and stand you up"))

	to_chat(usr, "[span_notice("Restrain")]: Grab Grab. Locks opponents into a restraining position, making your grab harder to break out of.")

	to_chat(usr, "<b><i>In addition, by having your throw mode on when being attacked, you enter an active defense mode where you have a chance to counter attacks done to you. Beware, counter-attacks are tiring and you won't be able to defend yourself forever!</i></b>")