/datum/reagent/shadowling_blindness_smoke
	taste_description = "pure darkness"

/datum/reagent/shadowling_blindness_smoke/on_mob_life(mob/living/M)
	if(!is_shadow_or_thrall(M))
		to_chat(M, span_warning("<b>You breathe in the black smoke, and your eyes burn horribly!</b>"))
		M.blind_eyes(5)
		if(prob(25))
			M.visible_message("<b>[M]</b> claws at their eyes!")
			M.Stun(3, 0)
			. = 1
	else
		to_chat(M, span_notice("<b>You breathe in the black smoke, and you feel revitalized!</b>"))
		M.adjustOxyLoss(-2, 0)
		M.adjustToxLoss(-2, 0)
		M.adjustBruteLoss(-1, 0)
		M.adjustFireLoss(-1, 0)
		. = 1
	return ..() || .

/datum/reagent/shadowfrost
	taste_description = "pure darkness"