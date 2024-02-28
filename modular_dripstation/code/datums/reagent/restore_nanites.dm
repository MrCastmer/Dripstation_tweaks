/datum/reagent/medicine/coagulant/blood_restoring_nanites
	name = "Blood Regeneration Nanite Serum"
	description = "A serum of nanites capable of coagulant wounds and restore blood volume to safe levels."
	taste_description = "a bunch of tiny robots"
	can_synth = FALSE
	clot_rate = 0.5
	passive_bleed_modifier = 0.5
	overdose_threshold = null

/datum/reagent/medicine/coagulant/blood_restoring_nanites/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_SAFE(M))
		M.blood_volume += 2


/datum/reagent/medicine/bone_restoring_nanites
	name = "Bone Restoration Nanite Serum"
	description = "A serum of nanites capable of coagulant wounds and restore blood volume to safe levels."
	taste_description = "a bunch of tiny robots"
	can_synth = FALSE
	overdose_threshold = null

/datum/reagent/medicine/bone_restoring_nanites/on_mob_life(mob/living/carbon/C)
	for(var/X in C.bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.get_wound_type(/datum/wound/blunt) && prob(20))
			var/datum/wound/blunt/W = BP.get_wound_type(/datum/wound/blunt)
			C.emote("scream")
			playsound(C, 'sound/surgery/bone3.ogg', 35)
			if(W.severity >= WOUND_SEVERITY_SEVERE)
				var/painkiller_bonus = 0
				if(C.get_drunk_amount() > 10)
					painkiller_bonus += 10
				if(C.reagents?.has_reagent(/datum/reagent/medicine/morphine))
					painkiller_bonus += 20
				if((C.stat && C.stat == UNCONSCIOUS))
					painkiller_bonus += 20
				if(C.reagents?.has_reagent(/datum/reagent/determination))
					painkiller_bonus += 10

				if(prob(35 + (20 * (W.severity - 1)) - painkiller_bonus)) // 35%/55% chance to cause shock with severe and critical wounds, modded by painkillers
					C.visible_message(span_danger("[C] passing out from the pain!"), span_notice("You black out from the pain while nanites restore your bone!"))
					C.AdjustUnconscious(12 SECONDS)
			W.remove_wound()

/datum/reagent/medicine/cellular_restoring_nanites
	name = "Сellular Regenerator Nanite Serum"
	description = "A serum of nanites capable of regenerate limbs, remove scars and treat wounds."
	taste_description = "a bunch of tiny robots"
	can_synth = FALSE
	overdose_threshold = null

/datum/reagent/medicine/cellular_restoring_nanites/on_mob_life(mob/living/carbon/M)
	M.adjustCloneLoss(-2)
	M.heal_bodypart_damage(2,2)
	M.set_eye_blur(0)
	M.set_blindness(0)
	for(var/organ in M.internal_organs)
		var/obj/item/organ/O = organ
		if(O.status == ORGAN_ROBOTIC)
			continue
		O.setOrganDamage(O.damage - (0.1 * O.maxHealth))
	for(var/i in M.all_scars)
		var/datum/scar/iter_scar = i
		if(!iter_scar.fake)
			qdel(iter_scar)
	if(prob(10))
		var/list/missing = M.get_missing_limbs()
		if(missing.len)
			playsound(M, 'sound/magic/demon_consume.ogg', 50, 1)
			M.visible_message("<span class='warning'>[M]'s missing limbs \
				reform, making a loud, grotesque sound!</span>",
				"<span class='userdanger'>Your limbs regrow, making a \
				loud, crunchy sound and giving you great pain!</span>",
				"<span class='italics'>You hear organic matter ripping \
				and tearing!</span>")
			M.emote("scream")
			M.adjust_dizzy(3 SECONDS)
			M.adjust_jitter(3 SECONDS)
			M.adjust_stutter(3 SECONDS)
			M.regenerate_limbs(1)
	if(prob(10))
		for(var/i in M.all_wounds)
			var/datum/wound/iter_wound = i
			M.adjust_dizzy(3 SECONDS)
			M.adjust_jitter(3 SECONDS)
			M.adjust_stutter(3 SECONDS)
			M.emote("scream")
			iter_wound.remove_wound()
	return TRUE