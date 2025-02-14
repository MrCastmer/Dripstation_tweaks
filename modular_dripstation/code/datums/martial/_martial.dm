/datum/martial_art
	var/datum/weakref/holder //owner of the martial art
	var/display_combos = FALSE //shows combo meter if true

/datum/martial_art/proc/reset_streak(mob/living/carbon/human/new_target)
	current_target = new_target
	streak = ""
	var/mob/living/holder_living = holder.resolve()
	holder_living?.hud_used?.combo_display.update_icon_state(streak)