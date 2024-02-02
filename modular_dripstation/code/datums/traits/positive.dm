/datum/quirk/combattraining //low rank CQC
	name = "Unarmed combat trainings"
	desc = "You try to remember some basics of unarmed combat... It`s hard enough."
	icon = "utensils"
	value = 6
	medical_record_text = "During physical examination, patient was found to have muscles strengthened by years of training."

/datum/quirk/combattraining/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/martial_art/trained/spesslife = new
	spesslife.teach(H)

/datum/quirk/combattraining/post_add()
	to_chat(quirk_holder, span_boldannounce("Your muscles remembers some basics of unarmed combat."))