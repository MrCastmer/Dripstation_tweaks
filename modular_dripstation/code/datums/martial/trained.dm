///restrain combo string
#define LOW_RESTRAIN_COMBO "GG"

/datum/martial_art/trained
	name = "Trained"
	id = MARTIALART_TRAINED
	//help_verb = /mob/living/carbon/human/proc/CQC_help
	block_chance = 50 //Don't get into melee with someone trained for melee and prepared for your attacks
	nonlethal = TRUE //all attacks deal solely stamina damage or knock out before dealing lethal amounts of damage
	var/datum/action/leg_sweep/legsweep = new/datum/action/leg_sweep()

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
		log_combat(A, D, "restrained (CQC)")
		D.visible_message(span_warning("[A] locks [D] into a restraining position!"), \
							span_userdanger("[A] locks you into a restraining position!"))
		D.Stun(1 SECONDS)
		if(!(A.pulling == D))
			D.grabbedby(A, 1)
		if(A.grab_state < GRAB_AGGRESSIVE)
			A.grab_state = GRAB_AGGRESSIVE
		restraining = TRUE
	return TRUE

///CQC grab, stuns for 1.5 seconds on use
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
/datum/martial_art/trained/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker) //I am going to fucking gut whoever did the old counter system also whoever made martial arts
	if(!can_use(user))
		return
	user.do_attack_animation(attacker, ATTACK_EFFECT_DISARM)
	attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and throws them to the ground!"), \
						span_userdanger("[user] grabs your arm as you attack and throws you to the ground!"))
	playsound(get_turf(attacker), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
	var/obj/item/I = attacker.get_active_held_item()
	if(I && attacker.temporarilyRemoveItemFromInventory(I))
		var/hand = user.get_inactive_hand_index()
		if(!user.put_in_hand(I, hand))
			I.forceMove(get_turf(attacker))
	attacker.Knockdown(60)
	user.adjustStaminaLoss(10)	//Can't block forever. Really, if this becomes a problem you're already screwed.

/datum/action/leg_sweep
	name = "Leg Sweep - Trips the victim, knocking them down for a brief moment."
	button_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"

/datum/action/leg_sweep/Trigger()
	if(owner.incapacitated())
		to_chat(owner, span_warning("You can't use [name] while you're incapacitated."))
		return
	var/mob/living/carbon/human/H = owner
	if (H.mind.martial_art.streak == "leg_sweep")
		owner.visible_message(span_danger("[owner] assumes a neutral stance."), "<b><i>Your next attack is cleared.</i></b>")
		H.mind.martial_art.streak = ""
	else
		owner.visible_message(span_danger("[owner] assumes the Leg Sweep stance!"), "<b><i>Your next attack will be a Leg Sweep.</i></b>")
		H.mind.martial_art.streak = "leg_sweep"