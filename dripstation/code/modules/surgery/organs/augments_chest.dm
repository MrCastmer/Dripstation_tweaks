/obj/item/organ/cyberimp/chest/spinalspeed
	var/militarygrade = FALSE
	var/excoef = 1 //max exhaustion before negative effects kicks

/obj/item/organ/cyberimp/chest/spinalspeed/on_life()
	if(!syndicate_implant)//the toy doesn't have a drawback
		return

	if(on)
		if(owner.stat == UNCONSCIOUS || owner.stat == DEAD)
			toggle(silent = TRUE)
		time_on += 1
		switch(time_on)
			if(excoef*20 to excoef*50)
				if(COOLDOWN_FINISHED(src, alertcooldown))
					to_chat(owner, span_alert("You feel your spine tingle."))
					COOLDOWN_START(src, alertcooldown, 10 SECONDS)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjustFireLoss(1)
			if(excoef*50 to excoef*70)
				if(COOLDOWN_FINISHED(src, alertcooldown))
					to_chat(owner, span_alert("You feel your spine hurts sharply. Your nose started bleeding."))
					var/turf/T = get_turf(owner)
					add_splatter_floor(T)
					COOLDOWN_START(src, alertcooldown, 10 SECONDS)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjustFireLoss(1)
				owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
			if(excoef*70 to excoef*100)
				if(COOLDOWN_FINISHED(src, alertcooldown) || !hasexerted)
					to_chat(owner, span_userdanger("Your spine and brain feel like they're burning!"))
					COOLDOWN_START(src, alertcooldown, 5 SECONDS)
				hasexerted = TRUE
				owner.set_drugginess(10)
				owner.adjust_hallucinations(20 SECONDS)
				owner.adjustFireLoss(3)
				owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
			if(excoef*100 to INFINITY)//no infinite abuse
				to_chat(owner, span_userdanger("You feel a slight sense of shame as your brain and spine rip themselves apart from overexertion."))
				owner.gib()
	else
		if(militarygrade)
			time_on -= 4
		else
			time_on -= 2

	time_on = max(time_on, 0)
	if(hasexerted && time_on == 0)
		to_chat(owner, "Your brains feels normal again.")
		hasexerted = FALSE

/obj/item/organ/cyberimp/chest/spinalspeed/emp_act(severity)
	. = ..()
	if(!syndicate_implant || militarygrade)//the toy and military implant has a different emp act
		owner.adjust_dizzy(10 SECONDS / severity)
		to_chat(owner, span_warning("Your spinal implant makes you feel queasy!"))
		return

	switch(severity)//i don't want emps to just be damage again, that's boring
		if(EMP_HEAVY)
			owner.set_drugginess(40)
			owner.adjust_hallucinations(500 SECONDS)
			owner.blur_eyes(20)
			owner.adjust_dizzy(10 SECONDS)
			time_on += 10
			owner.adjustFireLoss(10)
			to_chat(owner, span_warning("Your spinal implant malfunctions and you feel it scramble your brain!"))
		if(EMP_LIGHT)
			owner.set_drugginess(20)
			owner.adjust_hallucinations(200 SECONDS)
			owner.blur_eyes(10)
			owner.adjust_dizzy(5 SECONDS)
			time_on += 5
			owner.adjustFireLoss(5)
			to_chat(owner, span_danger("Your spinal implant malfunctions and you suddenly feel... wrong."))

/obj/item/organ/cyberimp/chest/spinalspeed/militarygrade
	name = "\improper Cybersun "Apogee" Sandevistan"
	desc = "Military grade implant that enable you to perform muscle movements faster. \
	Latest emp shielding improvements and nervous stabilisation system provides the best cyberware performance possible. \
	For the true runner on the edge."
	militarygrade = TRUE
	excoef = 2
	icon = "dripstation/icons/obj/augment.dmi"
	icon_state = "military_spinal"
