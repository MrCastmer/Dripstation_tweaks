/datum/quirk/psychopathic
	name = "Psychopathic"
	desc = "You often hear to yourself: Hey, secy, how many animals have you killed as a child?"
	icon = "meh"
	value = 5
	mob_trait = TRAIT_PSYCHOPATHIC
	mood_quirk = TRUE
	gain_text = span_danger("You don`t mind if they all die.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "The patient has a psychopathic personality disorder. It is normal for him to react socially distantly to certain events."

/datum/quirk/psychopathic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.6

/datum/quirk/psychopathic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier += 0.6

/datum/quirk/apathetic
	mob_trait = TRAIT_APATHETIC

/datum/quirk/no_appendix
	name = "Appendicitis Survivor"
	desc = "You had a run in with appendicitis in the past and no longer have an appendix."
	icon = "notes-medical"
	value = 1
	gain_text = span_notice("You no longer have an appendix.")
	lose_text = span_danger("Your appendix has magically.. regrown?")
	medical_record_text = "Patient had appendicitis in the past and has had their appendix surgically removed."
	/// The mob's original appendix
	var/obj/item/organ/appendix/old_appendix

/datum/quirk/no_appendix/post_add()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	old_appendix = carbon_quirk_holder.getorganslot(ORGAN_SLOT_APPENDIX)

	if(isnull(old_appendix))
		return

	old_appendix.Remove(carbon_quirk_holder, special = TRUE)
	old_appendix.moveToNullspace()

	STOP_PROCESSING(SSobj, old_appendix)

/datum/quirk/no_appendix/remove()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	if(isnull(old_appendix))
		return

	var/obj/item/organ/appendix/current_appendix = carbon_quirk_holder.getorganslot(ORGAN_SLOT_APPENDIX)

	// if we have not gained an appendix already, put the old one back
	if(isnull(current_appendix))
		old_appendix.Insert(carbon_quirk_holder, special = TRUE)
	else
		qdel(old_appendix)

	old_appendix = null

/datum/quirk/surgeon
	name = "Professional Surgeon"
	desc = "You have spend a lot more time than others to get used to the modern surgery. Your skill allows you to avoid critical failurs, but you still causes some mess when performing operations on alive and contious patients."
	icon = "notes-medical"
	value = 5
	mob_trait = TRAIT_MEDIC
	gain_text = span_danger("You getting ready to show your absolute medical skill.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "The patient has a skill to perform sugeries without failurs."