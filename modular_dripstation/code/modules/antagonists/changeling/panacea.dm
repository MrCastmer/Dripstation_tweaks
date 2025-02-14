/datum/action/changeling/panacea/sting_action(mob/user)
	to_chat(user, span_notice("We cleanse impurities from our form."))
	var/mob/living/simple_animal/horror/H = user.has_horror_inside()
	if(H)
		H.leave_victim()
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.vomit(0)
			to_chat(user, span_notice("A parasite exits our form."))
	..()
	var/list/bad_organs = list(
		user.getorgan(/obj/item/organ/body_egg),
		user.getorgan(/obj/item/organ/internal/shadowtumor),
		user.getorgan(/obj/item/organ/zombie_infection))

	for(var/o in bad_organs)
		var/obj/item/organ/O = o
		if(!istype(O))
			continue

		O.Remove(user)
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.vomit(0)
		O.forceMove(get_turf(user))

	user.reagents.add_reagent(/datum/reagent/medicine/mutadone, 10)
	user.reagents.add_reagent(/datum/reagent/medicine/pen_acid, 20)
	user.reagents.add_reagent(/datum/reagent/medicine/antihol, 10)
	user.reagents.add_reagent(/datum/reagent/medicine/mannitol/advanced, 25)

	if(isliving(user))
		var/mob/living/L = user
		for(var/thing in L.diseases)
			var/datum/disease/D = thing
			if(D.severity == DISEASE_SEVERITY_POSITIVE)
				continue
			D.cure()
	return TRUE