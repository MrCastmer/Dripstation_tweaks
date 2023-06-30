//Snowflake spot for putting sling organ related stuff
/obj/item/organ/eyes/shadow
	name = "shadow eye"
	flash_protect = -1
	eye_color = "00FF00"
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	sight_flags = SEE_BLACKNESS
	see_in_dark = 8

/obj/item/organ/eyes/night_vision/shadowling
	name = "shadowling eyes"
	desc = "The eyes of a spooky shadowling! Even without their shadowy owner, looking at these eyes gives you a sense of dread."
	icon_state = "burning_eyes"
	eye_color = "BC2828"
	see_in_dark = 9
	sight_flags = SEE_MOBS
	flash_protect = -1

/obj/item/organ/eyes/night_vision/shadowling/l_shadowling
	eye_color = "6432B7"
	desc = "The eyes of a spooky shadowling! This pair exudes submission." //and breedable. Fuck, god save my soul.

/obj/item/organ/eyes/night_vision/shadowling/nightmare
	name = "burning red eyes"
	flash_protect = 0

/obj/item/organ/internal/shadowtumor
	name = "black tumor"
	desc = "A tiny black mass with red tendrils trailing from it. It seems to shrivel in the light."
	icon_state = "blacktumor"
	w_class = 1
	zone = "head"
	slot = "brain_tumor"
	var/organ_health = 3

/obj/item/organ/internal/shadowtumor/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/organ/internal/shadowtumor/Destroy()
	STOP_PROCESSING(SSobj, src)
	..()

/obj/item/organ/internal/shadowtumor/process()
	if(isturf(loc))
		var/turf/T = loc
		var/light_count = T.get_lumcount()
		if(light_count > LIGHT_DAM_THRESHOLD && organ_health > 0) //Die in the light
			organ_health--
		else if(light_count < LIGHT_HEAL_THRESHOLD && organ_health < 3) //Heal in the dark
			organ_health++
		if(organ_health <= 0)
			visible_message(span_warning("[src] collapses in on itself!"))
			qdel(src)
	else
		organ_health = min(organ_health+0.5, 3)

/obj/item/organ/internal/shadowtumor/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	M.add_thrall()

/obj/item/organ/internal/shadowtumor/on_find(mob/living/finder)
	. = ..()
	finder.visible_message(span_danger("[finder] opens up [owner]'s skull, revealing a pulsating black mass, with red tendrils attaching it to [owner.p_their()] brain."))

/obj/item/organ/internal/shadowtumor/Remove(mob/living/carbon/M, special)
	if(M.dna.species.id == "l_shadowling") //Empowered thralls cannot be deconverted
		to_chat(M, span_shadowling("<b><i>NOT LIKE THIS!</i></b>"))
		M.visible_message(span_danger("[M] suddenly slams upward and knocks down everyone!"))
		M.resting = FALSE //Remove all stuns
		M.SetStun(0, 0)
		M.SetKnockdown(0)
		M.SetUnconscious(0)
		for(var/mob/living/user in range(2, src))
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.Knockdown(6)
				C.adjustBruteLoss(20)
			else if(issilicon(user))
				var/mob/living/silicon/S = user
				S.Knockdown(8)
				S.adjustBruteLoss(20)
				playsound(S, 'sound/effects/bang.ogg', 50, 1)
		return FALSE
	var/obj/item/organ/eyes/eyes = M.getorganslot(ORGAN_SLOT_EYES)
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
	eyes.sight_flags = initial(eyes.sight_flags)
	M.update_sight()
	M.remove_thrall()
	M.visible_message(span_warning("A strange black mass falls from [M]'s head!"))
	return ..()
