/datum/martial_art/wrestling
	display_combos = TRUE

/datum/martial_art/wrestling/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	switch(streak)
		if("drop")
			reset_streak()
			drop(A,D)
			return 1
		if("strike")
			reset_streak()
			strike(A,D)
			return 1
		if("kick")
			reset_streak()
			kick(A,D)
			return 1
		if("throw")
			reset_streak()
			throw_wrassle(A,D)
			return 1
		if("slam")
			reset_streak()
			slam(A,D)
			return 1
	return 0
