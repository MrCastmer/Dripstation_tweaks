#define LIGHT_DAM_THRESHOLD 0.25
///////////////////////////////// SHADOW MORPHISM /////////////////////////////////////
// Shadow Morphism, also known as curse of darkness
/datum/disease/transformation/shadow
	name = "Shadow Morphism"
	spread_text = "Shadowlings"
	cure_text = "Sunshine. Rezadone" //Uh oh
	cures = list(/datum/reagent/medicine/rezadone)
	cure_chance = 6
	stage_prob = 2
	agent = "Pure Darkness"
	desc = "Shadow curse"
	severity = DISEASE_SEVERITY_BIOHAZARD
	visibility_flags = 0
	stage1	= list("You feel... You feel chill.")
	stage2	= list("A cruel sense of cold overcomes you.")
	stage3	= list(span_danger("You can't feel your eyes!"), span_danger("You feel strange anger at the light."))
	stage4	= list(span_danger("You can't feel your eyes. It does not bother you anymore."), span_danger("You forget how it feels like to bask in the sun."))
	stage5	= list("You feel the shadows invade your skin, leaping into the center of your chest! Now you're pure darkness!")
	new_form = /mob/living/carbon/human/species/shadow

/datum/disease/transformation/shadow/stage_act()
	..()
	var/turf/T = affected_mob.loc
	var/light_amount = T.get_lumcount()
	switch(stage)
		if(1)
			if (prob(4))
				to_chat(affected_mob, "Hmm. Must have been the wind.")
			if (light_amount > LIGHT_DAM_THRESHOLD && prob(10))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/medicine/rezadone = 3))
		if(2)
			if (prob(8))
				affected_mob.emote(pick("pale","shiver"))
			if (light_amount > LIGHT_DAM_THRESHOLD && prob(10))
				to_chat(affected_mob, span_danger("You feel a stabbing pain in your heart."))
				affected_mob.Unconscious(50)
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/medicine/rezadone = 5))
			if (light_amount < LIGHT_DAM_THRESHOLD && prob(10))
				to_chat(affected_mob, span_danger("You feel fucking frostoil in your veins."))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/consumable/frostoil = 5))
		if(3)
			if (prob(6))
				affected_mob.say(pick("Kkkiiiill mmme", "I wwwaaannntt tttoo dddiiieeee...", "Mmyyy eeyyeesss..."), forced = "shadow transformation")
				affected_mob.emote(pick("pale","shiver"))
			if(light_amount > LIGHT_DAM_THRESHOLD && prob(30))
				affected_mob.throw_alert("lightexposure", /atom/movable/screen/alert/lightexposure)
				affected_mob.adjustCloneLoss(3)
				affected_mob.adjustFireLoss(1)
				to_chat(affected_mob, span_danger("You feel your skin turns to dust!</span>"))//Message spam to say "GET THE FUCK OUT"
				affected_mob.playsound_local(get_turf(affected_mob), 'sound/weapons/sear.ogg', 150, 1, pressure_affected = FALSE)
			if(light_amount < LIGHT_DAM_THRESHOLD)
				affected_mob.clear_alert("lightexposure")
			if (light_amount < LIGHT_DAM_THRESHOLD && prob(20))
				to_chat(affected_mob, span_danger("You feel fucking frostoil in your veins."))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/consumable/frostoil = 5))
		if(4)
			if(light_amount > LIGHT_DAM_THRESHOLD)
				affected_mob.throw_alert("lightexposure", /atom/movable/screen/alert/lightexposure)
				affected_mob.adjustCloneLoss(5)
				affected_mob.adjustFireLoss(2)
				to_chat(affected_mob, span_danger("You feel your skin turns to dust!</span>"))//Message spam to say "GET THE FUCK OUT"
				affected_mob.playsound_local(get_turf(affected_mob), 'sound/weapons/sear.ogg', 150, 1, pressure_affected = FALSE)
			if(light_amount < LIGHT_DAM_THRESHOLD)
				affected_mob.adjustCloneLoss(-1)
				affected_mob.adjustFireLoss(-2)
				affected_mob.clear_alert("lightexposure")
			if(affected_mob.cloneloss >= 100)
				affected_mob.visible_message(span_danger("[affected_mob] skin turns to dust!"), "<span class'boldwarning'>Your skin turns to dust!</span>")
				affected_mob.dust()
			if(affected_mob.reagents.has_reagent(/datum/reagent/consumable/frostoil))
				affected_mob.reagents.remove_reagent(/datum/reagent/consumable/frostoil)
				to_chat(affected_mob, span_notice("You feel warmer... It feels good."))
				affected_mob.bodytemperature = 310
			if(affected_mob.reagents.has_reagent(/datum/reagent/medicine/rezadone))
				affected_mob.reagents.remove_reagent(/datum/reagent/medicine/rezadone)
				to_chat(affected_mob, span_notice("Nothing can help you at this point."))
		if(5)
			SEND_SOUND(affected_mob, sound('sound/effects/ghost.ogg'))
			do_disease_transformation(affected_mob)