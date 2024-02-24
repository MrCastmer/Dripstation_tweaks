
/datum/quirk/combattraining //low rank CQC
	name = "Unarmed combat trainings"
	desc = "You try to remember some basics of unarmed combat... It`s hard enough."
	icon = "chevron-up"
	value = 6
	medical_record_text = "During physical examination, patient was found to have muscles strengthened by years of training."

/datum/quirk/combattraining/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/martial_art/trained/spesslife = new
	spesslife.teach(H)

/datum/quirk/combattraining/post_add()
	to_chat(quirk_holder, span_boldannounce("Your muscles remembers some basics of unarmed combat."))

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
