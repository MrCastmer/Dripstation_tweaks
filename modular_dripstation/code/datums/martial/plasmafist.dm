/datum/martial_art/plasma_fist
	display_combos = TRUE

/datum/martial_art/plasma_fist/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak,TORNADO_COMBO))
		reset_streak()
		Tornado(A,D)
		return 1
	if(findtext(streak,THROWBACK_COMBO))
		reset_streak()
		Throwback(A,D)
		return 1
	if(findtext(streak,PLASMA_COMBO))
		reset_streak()
		Plasma(A,D)
		return 1
	return 0