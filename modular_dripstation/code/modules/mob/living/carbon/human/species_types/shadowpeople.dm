#define HEART_RESPAWN_THRESHHOLD 40
#define HEART_SPECIAL_SHADOWIFY 2
#define LIGHT_HEAL_THRESHOLD 2
#define LIGHT_DAMAGE_TAKEN 6
#define LIGHT_DAM_THRESHOLD 0.25

/datum/species/shadow
	burnmod = 1.1
	brutemod = 0.9
	limbs_id = "new_shadow"
	species_traits = list(NOBLOOD, NO_UNDERWEAR, AGENDER, NOEYESPRITES)
	punchdamagelow = 2			//shadow claws
	punchdamagehigh = 11		//shadow claws
	punchstunthreshold = 10		//lesser shadow claws 20% chance to stun, robast shadows
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	inherent_traits = list(TRAIT_NOPULSE,TRAIT_RADIMMUNE,TRAIT_VIRUSIMMUNE,TRAIT_NOBREATH,TRAIT_GENELESS,TRAIT_NOHUNGER)
	screamsound = 'sound/hallucinations/far_noise.ogg'
	deathsound = 'sound/voice/hiss5.ogg'
	mutanteyes = /obj/item/organ/eyes/shadow

/datum/species/shadow/spec_life(mob/living/carbon/human/H)
	var/turf/T = H.loc
	if(istype(T))
		var/light_amount = T.get_lumcount()

		if(light_amount > SHADOW_SPECIES_LIGHT_THRESHOLD) //if there's enough light, start dying
			H.take_overall_damage(1,1, 0, BODYPART_ORGANIC)
			H.take_overall_damage(0,1, 0, BODYPART_ORGANIC)
			H.adjustCloneLoss(1)
			H.throw_alert("lightexposure", /atom/movable/screen/alert/lightexposure)
			if(H.stat != DEAD)
				to_chat(H, span_userdanger("The light burns you!")) //Message spam to say "GET THE FUCK OUT"
				H.playsound_local(get_turf(H), 'sound/weapons/sear.ogg', 150, 1, pressure_affected = FALSE)
		else if (light_amount < SHADOW_SPECIES_LIGHT_THRESHOLD) //heal in the dark
			H.heal_overall_damage(1,1, 0, BODYPART_ORGANIC)
			H.adjustCloneLoss(-1)
			H.clear_alert("lightexposure")

/datum/species/shadow/nightmare/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.draw_yogs_parts(TRUE)
	. = ..()

/datum/species/shadow/ling/on_species_loss(mob/living/carbon/human/C)
	C.draw_yogs_parts(FALSE)


//nightmare
/datum/species/shadow/nightmare
	name = "Nightmare"
	limbs_id = "l_shadowling"
	inherent_traits = list(TRAIT_NOPULSE,TRAIT_RESISTCOLD,TRAIT_NOBREATH,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_NOGUNS,TRAIT_RADIMMUNE,TRAIT_VIRUSIMMUNE,TRAIT_PIERCEIMMUNE,TRAIT_NODISMEMBER,TRAIT_NOHUNGER)

/datum/species/shadow/nightmare/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.draw_yogs_parts(TRUE)
	. = ..()
	to_chat(C, "[info_text]")

	C.fully_replace_character_name("[C.real_name]","[pick(GLOB.nightmare_names)]") // Yogs -- fixes nightmares not having special spooky names. this proc takes the old name first, and *THEN* the new name!

/datum/species/shadow/ling/on_species_loss(mob/living/carbon/human/C)
	C.draw_yogs_parts(FALSE)


//heart
/obj/item/organ/heart/nightmare/attack(mob/M, mob/living/carbon/user, obj/target)
	if(M != user)
		return ..()
	user.visible_message(span_warning("[user] raises [src] to [user.p_their()] mouth and tears into it with [user.p_their()] teeth!"), \
						 span_danger("[src] feels unnaturally cold in your hands. You raise [src] your mouth and devour it!"))
	playsound(user, 'sound/magic/demon_consume.ogg', 50, 1)
	Insert(user)

/obj/item/organ/heart/nightmare/Insert(mob/living/carbon/M, special = 0)
	..()
	if(special != HEART_SPECIAL_SHADOWIFY)
		M.visible_message(span_warning("Blood erupts from [M]'s arm as it reforms into a weapon!"), \
						 span_userdanger("Icy blood pumps through your veins as your arm reforms itself!"))
		blade = new/obj/item/light_eater
		M.put_in_hands(blade)
	START_PROCESSING(SSobj, src)

/obj/item/organ/heart/nightmare/process()
	if(QDELETED(owner) || owner.stat != DEAD)
		respawn_progress = 0
		return
	var/turf/T = get_turf(owner)
	if(istype(T))
		var/light_amount = T.get_lumcount()
		if(light_amount < SHADOW_SPECIES_LIGHT_THRESHOLD)
			respawn_progress++
			playsound(owner,'sound/effects/singlebeat.ogg',40,1)
	if(respawn_progress >= HEART_RESPAWN_THRESHHOLD)
		owner.revive(full_heal = TRUE)
		if(!(owner.dna.species.id == "shadow" || owner.dna.species.id == "nightmare" || owner.dna.species.id == "shadowling" || owner.dna.species.id == "l_shadowling"))
			var/mob/living/carbon/old_owner = owner
			Remove(owner, HEART_SPECIAL_SHADOWIFY)
			old_owner.set_species(/datum/species/shadow)
			Insert(old_owner, HEART_SPECIAL_SHADOWIFY)
			to_chat(owner, span_userdanger("You feel the shadows invade your skin, leaping into the center of your chest! You're alive!"))
			SEND_SOUND(owner, sound('sound/effects/ghost.ogg'))
		owner.visible_message(span_warning("[owner] staggers to [owner.p_their()] feet!"))
		playsound(owner, 'sound/hallucinations/far_noise.ogg', 50, 1)
		respawn_progress = 0

//Weapon
/obj/item/light_eater
	desc = "A grotesque blade made out of bone and pure night that cleaves through people as a hot knife through butter."
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	lefthand_file = 'modular_dripstation/icons/mob/inhands/antag/lighteater_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/antag/lighteater_righthand.dmi'

/obj/item/light_eater/Initialize(mapload,silent)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)
	AddComponent(/datum/component/butchering, 80, 70)

/obj/item/light_eater/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(isopenturf(AM)) //So you can actually melee with it
		return
	if(isliving(AM))
		var/mob/living/L = AM
		if(isethereal(AM))
			AM.emp_act(EMP_LIGHT)
		else if(iscyborg(AM))
			var/mob/living/silicon/robot/borg = AM
			if(borg.lamp_enabled)
				borg.smash_headlamp()
		else if(ishuman(AM))
			for(var/obj/item/O in AM.get_all_contents())
				if(O.light_range && O.light_power)
					disintegrate(O)
		if(L.pulling && L.pulling.light_range && isitem(L.pulling))
			disintegrate(L.pulling)
	else if(isitem(AM))
		var/obj/item/I = AM
		if(I.light_range && I.light_power)
			disintegrate(I)

	if(istype(AM, /obj/structure/table))
		var/obj/structure/table/T = AM
		T.deconstruct(FALSE)

	else if(istype(AM, /obj/machinery/computer))
		var/obj/machinery/computer/C = AM
		C.attack_alien(user) //muh copypasta

	else if(istype(AM, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/A = AM

		if((!A.requiresID() || A.allowed(user)) && A.hasPower()) //This is to prevent stupid shit like hitting a door with an arm blade, the door opening because you have acces and still getting a "the airlocks motors resist our efforts to force it" message, power requirement is so this doesn't stop unpowered doors from being pried open if you have access
			return

		if(A.locked)
			to_chat(user, span_warning("The airlock's bolts prevent it from being forced!"))
			return
		if(A.welded)
			to_chat(user, span_warning("The airlock is welded shut, it won't budge!"))
			return

		if(A.hasPower())
			user.visible_message(span_warning("[user] jams [src] into the airlock and starts prying it open!"), span_warning("We start forcing the airlock open."), //yogs modified description
			span_italics("You hear a metal screeching sound."))
			playsound(A, 'sound/machines/airlock_alien_prying.ogg', 100, 1)
			if(!do_after(user, 6 SECONDS, A))
				return
		//user.say("Heeeeeeeeeerrre's Johnny!")
		user.visible_message(span_warning("[user] forces the airlock to open with [user.p_their()] [src]!"), span_warning("We force the airlock to open."), //yogs modified description
		span_italics("You hear a metal screeching sound."))
		A.open(2)



//actual shadowlings
/datum/species/shadow/ling
	species_traits = list(NOBLOOD,NO_UNDERWEAR,NO_DNA_COPY,NOTRANSSTING,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOPULSE, TRAIT_NOGUNS, TRAIT_COLDBLOODED, TRAIT_STABLELIVER, TRAIT_STABLEHEART, TRAIT_SLEEPIMMUNE, TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE, TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE, TRAIT_PIERCEIMMUNE)
	no_equip = list(ITEM_SLOT_MASK, ITEM_SLOT_EYES, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_ID, ITEM_SLOT_SUITSTORE)
	punchdamagelow = 11			//shadow claws
	punchdamagehigh = 20		//shadow claws
	punchstunthreshold = 18		//shadow claws 30% chance to stun

/datum/species/shadow/ling/spec_life(mob/living/carbon/human/H)
	H.nutrition = NUTRITION_LEVEL_WELL_FED //i aint never get hongry
	if(isturf(H.loc))
		var/turf/T = H.loc
		var/light_amount = T.get_lumcount()
		if(light_amount > LIGHT_DAM_THRESHOLD) //Can survive in very small light levels. Also doesn't take damage while incorporeal, for shadow walk purposes
			H.adjustCloneLoss(LIGHT_DAMAGE_TAKEN) 
			H.throw_alert("lightexposure", /atom/movable/screen/alert/lightexposure)
			if(H.stat != DEAD)
				to_chat(H, span_userdanger("The light burns you!")) //Message spam to say "GET THE FUCK OUT"
				H.playsound_local(get_turf(H), 'sound/weapons/sear.ogg', 150, 1, pressure_affected = FALSE)
		else if (light_amount < LIGHT_HEAL_THRESHOLD  && !istype(H.loc, /obj/effect/dummy/phased_mob/shadowling)) //Can't heal while jaunting
			H.heal_overall_damage(5,5)
			H.adjustToxLoss(-5)
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, -25) //Shad O. Ling gibbers, "CAN U BE MY THRALL?!!"
			H.adjustCloneLoss(-5)
			H.SetKnockdown(0)
			H.SetStun(0)
			H.SetParalyzed(0)
			H.AdjustUnconscious(-20)
			H.clear_alert("lightexposure")
	var/charge_time = 400 - ((SSticker.mode.thralls && SSticker.mode.thralls.len) || 0)*10
	if(world.time >= charge_time+last_charge)
		shadow_charges = min(shadow_charges + 1, 3)
		last_charge = world.time

//shadowleathermen
/datum/species/shadow/ling/lesser
	species_traits = list(NOBLOOD,NO_UNDERWEAR,NO_DNA_COPY,NOTRANSSTING)
	inherent_traits = list(TRAIT_NOPULSE, TRAIT_NOBREATH, TRAIT_SLEEPIMMUNE, TRAIT_STABLELIVER, TRAIT_STABLEHEART, TRAIT_RADIMMUNE, TRAIT_PIERCEIMMUNE, TRAIT_RESISTLOWPRESSURE, TRAIT_RESISTCOLD)
	no_equip = list(ITEM_SLOT_MASK, ITEM_SLOT_GLOVES, ITEM_SLOT_EYES, ITEM_SLOT_FEET)
	mutanteyes = /obj/item/organ/eyes/night_vision/alien/sling/l_shadowling

/datum/species/shadow/ling/lesser/spec_life(mob/living/carbon/human/H)
	H.nutrition = NUTRITION_LEVEL_WELL_FED //i aint never get hongry
	if(isturf(H.loc))
		var/turf/T = H.loc
		var/light_amount = T.get_lumcount()
		if(light_amount > LIGHT_DAM_THRESHOLD && !H.incorporeal_move)
			H.adjustCloneLoss(LIGHT_DAMAGE_TAKEN/2) 
			H.throw_alert("lightexposure", /atom/movable/screen/alert/lightexposure)
			if(H.stat != DEAD)
				to_chat(H, span_userdanger("The light burns you!")) //Message spam to say "GET THE FUCK OUT"
				H.playsound_local(get_turf(H), 'sound/weapons/sear.ogg', 150, 1, pressure_affected = FALSE)
		else if (light_amount < LIGHT_HEAL_THRESHOLD)
			H.heal_overall_damage(4,4)
			H.adjustToxLoss(-4)
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, -25)
			H.adjustCloneLoss(-3)
			H.clear_alert("lightexposure")

#undef HEART_SPECIAL_SHADOWIFY
#undef HEART_RESPAWN_THRESHHOLD
#undef LIGHT_HEAL_THRESHOLD
#undef LIGHT_DAMAGE_TAKEN
#undef LIGHT_DAM_THRESHOLD