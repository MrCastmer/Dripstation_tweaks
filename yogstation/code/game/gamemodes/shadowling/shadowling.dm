#define LIGHT_HEAL_THRESHOLD 2
#define LIGHT_DAMAGE_TAKEN 6
#define LIGHT_DAM_THRESHOLD 0.25

/*
SHADOWLING: A gamemode based on previously-run events
Aliens called shadowlings are on the station.
These shadowlings can 'enthrall' crew members and enslave them.
They also burn in the light but heal rapidly whilst in the dark.
The game will end under two conditions:
	1. The shadowlings die
	2. The emergency shuttle docks at CentCom
Shadowling strengths:
	- The dark
	- Hard vacuum (They are not affected by it, but are affected by starlight!)
	- Their thralls who are not harmed by the light
	- Stealth
Shadowling weaknesses:
	- The light
	- Fire
	- Enemy numbers
	- Burn-based weapons and items (flashbangs, lasers, etc.)
Shadowlings start off disguised as normal crew members, and they only have two abilities: Hatch and Enthrall.
They can still enthrall and perhaps complete their objectives in this form.
Hatch will, after a short time, cast off the human disguise and assume the shadowling's true identity.
They will then assume the normal shadowling form and gain their abilities.
The shadowling will seem OP, and that's because it kinda is. Being restricted to the dark while being alone most of the time is extremely difficult and as such the shadowling needs powerful abilities.
Made by Xhuis
*/
/*
	GAMEMODE
*/
/datum/game_mode
	var/list/datum/mind/shadows = list()
	var/list/datum/mind/thralls = list()
	var/required_thralls = 15 //How many thralls are needed (this is changed in pre_setup, so it scales based on pop)
	var/shadowling_ascended = FALSE //If at least one shadowling has ascended
	var/thrall_ratio = 1
	var/warning_threshold = 10
	var/victory_warning_announced = FALSE


/datum/game_mode/proc/replace_jobbaned_player(mob/living/M, role_type, pref)
	var/list/mob/dead/observer/candidates = pollCandidatesForMob("Do you want to play as a [role_type]?", "[role_type]", null, pref, 50, M)
	var/mob/dead/observer/theghost = null
	if(candidates.len)
		theghost = pick(candidates)
		to_chat(M, "Your mob has been taken over by a ghost! Appeal your job ban if you want to avoid this in the future!")
		message_admins("[key_name_admin(theghost)] has taken control of ([key_name_admin(M)]) to replace a jobbaned player.")
		M.ghostize(0)
		M.key = theghost.key

/datum/game_mode/shadowling
	name = "shadowling"
	config_tag = "shadowling"
	antag_flag = ROLE_SHADOWLING
	required_players = 20
	required_enemies = 1
	recommended_enemies = 2
	enemy_minimum_age = 14
	false_report_weight = 5
	restricted_jobs = list("AI", "Cyborg")
	protected_jobs = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Engineer", "Chief Medical Officer", "Brig Physician")
	title_icon = "ss13"

/datum/game_mode/shadowling/announce()
	to_chat(world, "<b>The current game mode is - Shadowling!</b>")
	to_chat(world, "<b>There are alien [span_shadowling("shadowlings")] on the station. Crew: Kill the shadowlings before they can enthrall the crew. Shadowlings: Enthrall the crew while remaining in hiding.</b>")

/datum/game_mode/shadowling/pre_setup()
	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs
	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"
	var/shadowlings = min(5, (round(num_players()/10) - 1)) //20pop = 1, 30 = 2, 40 = 3, 50 = 4, 60 = 5, max = 5
	while(shadowlings)
		var/datum/mind/shadow = pick(antag_candidates)
		shadows += shadow
		antag_candidates -= shadow
		shadow.special_role = "Shadowling"
		shadow.restricted_roles = restricted_jobs
		shadowlings--
	var/thrall_scaling = round(num_players() / 3)
	required_thralls = clamp(thrall_scaling, 15, 30)
	thrall_ratio = required_thralls / 15

	warning_threshold = round(0.66 * required_thralls) //For announce

	return TRUE

/datum/game_mode/shadowling/generate_report()
	return "Sightings of strange alien creatures have been observed in your area. These aliens supposedly possess the ability to enslave unwitting personnel and leech from their power. \
	Be wary of dark areas and ensure all lights are kept well-maintained. Closely monitor all crew for suspicious behavior and perform dethralling surgery if they have obvious tells. Investigate all \
	reports of odd or suspicious sightings in maintenance."

/datum/game_mode/shadowling/post_setup()
	for(var/T in shadows)
		var/datum/mind/shadow = T
		log_game("[shadow.key] (ckey) has been selected as a Shadowling.")
		shadow.current.add_sling()
	. = ..()
	return

/datum/game_mode/shadowling/proc/check_shadow_victory()
	return shadowling_ascended

/datum/game_mode/shadowling/proc/check_shadow_death()
	for(var/SM in get_antag_minds(/datum/antagonist/shadowling))
		var/datum/mind/shadow_mind = SM
		if(istype(shadow_mind))
			var/turf/T = get_turf(shadow_mind.current)
			if((shadow_mind) && (shadow_mind.current.stat != DEAD) && T && is_station_level(T.z) && ishuman(shadow_mind.current))
				return FALSE
	return TRUE

/datum/game_mode/shadowling/check_finished()
	. = ..()
	if(check_shadow_death())
		return TRUE

/datum/game_mode/proc/auto_declare_completion_shadowling()
	var/text = ""
	if(shadows.len)
		text += "<br><span class='big'><b>The shadowlings were:</b></span>"
		for(var/S in shadows)
			var/datum/mind/shadow = S
			text += printplayer(shadow)
		text += "<br>"
		if(thralls.len)
			text += "<br><span class='big'><b>The thralls were:</b></span>"
			for(var/T in thralls)
				var/datum/mind/thrall = T
				text += printplayer(thrall)
	text += "<br>"
	to_chat(world, text)

/datum/game_mode/shadowling/set_round_result()
	..()
	if(check_shadow_victory())
		SSticker.mode_result = "win - shadowlings have ascended"
	else
		SSticker.mode_result = "loss - staff stopped the shadowlings"

/*
	MISCELLANEOUS
*/
/datum/species/shadow/ling
	//Normal shadowpeople but with enhanced effects
	name = "Shadowling"
	id = "shadowling"
	say_mod = "chitters"
	species_traits = list(NOBLOOD,NO_UNDERWEAR,NO_DNA_COPY,NOTRANSSTING,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOPULSE, TRAIT_NOGUNS, TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE, TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE, TRAIT_PIERCEIMMUNE)
	no_equip = list(SLOT_WEAR_MASK, SLOT_GLASSES, SLOT_GLOVES, SLOT_SHOES, SLOT_W_UNIFORM, SLOT_S_STORE, SLOT_WEAR_ID)
	nojumpsuit = TRUE
	mutanteyes = /obj/item/organ/eyes/night_vision/shadowling
	burnmod = 1.5 //1.5x burn damage, 2x is excessive
	heatmod = 1.5
	punchdamagelow = 11       //shadow claws
	punchdamagehigh = 20     //shadow claws
	punchstunthreshold = 18  //shadow claws 30% chance to stun
	var/mutable_appearance/eyes_overlay
	var/shadow_charges = 3
	var/last_charge = 0

/datum/species/shadow/ling/negates_gravity(mob/living/carbon/human/H)
	return TRUE

/datum/species/shadow/ling/on_species_gain(mob/living/carbon/human/C)
	C.draw_yogs_parts(TRUE)
	eyes_overlay = mutable_appearance('yogstation/icons/mob/sling.dmi', "eyes", 25)
	C.add_overlay(eyes_overlay)
	RegisterSignal(C, COMSIG_MOVABLE_MOVED, .proc/apply_darkness_speed)
	. = ..()

/datum/species/shadow/ling/on_species_loss(mob/living/carbon/human/C)
	C.draw_yogs_parts(FALSE)
	UnregisterSignal(C, COMSIG_MOVABLE_MOVED)
	C.remove_movespeed_modifier(id)
	if(eyes_overlay)
		C.cut_overlay(eyes_overlay)
		QDEL_NULL(eyes_overlay)
	. = ..()

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
			H.SetSleeping(0) // Evil shadows don`t sleep
			H.clear_alert("lightexposure")
	var/charge_time = 400 - ((SSticker.mode.thralls && SSticker.mode.thralls.len) || 0)*10
	if(world.time >= charge_time+last_charge)
		shadow_charges = min(shadow_charges + 1, 3)
		last_charge = world.time

/datum/species/shadow/ling/bullet_act(obj/item/projectile/P, mob/living/carbon/human/H)
	var/turf/T = H.loc
	if(istype(T) && shadow_charges > 0)
		var/light_amount = T.get_lumcount()
		if(light_amount < LIGHT_DAM_THRESHOLD)
			H.visible_message(span_danger("The shadows around [H] ripple as they absorb \the [P]!"))
			playsound(T, "bullet_miss", 75, 1)
			shadow_charges = min(shadow_charges - 1, 0)
			return -1
	return 0

/datum/species/shadow/ling/proc/apply_darkness_speed(mob/living/carbon/C)
	var/turf/T = get_turf(C)
	var/light_amount = T.get_lumcount()
	if(light_amount > LIGHT_DAM_THRESHOLD)
		C.remove_movespeed_modifier(id)
	else
		C.add_movespeed_modifier(id, update=TRUE, priority=100, multiplicative_slowdown=-0.75, blacklisted_movetypes=(FLYING|FLOATING))

/datum/species/shadow/ling/lesser //Empowered thralls. Obvious, but powerful
	name = "Lesser Shadowling"
	id = "l_shadowling"
	say_mod = "chitters"
	species_traits = list(NOBLOOD,NO_UNDERWEAR,NO_DNA_COPY,NOTRANSSTING)
	inherent_traits = list(TRAIT_NOPULSE, TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_PIERCEIMMUNE, TRAIT_RESISTLOWPRESSURE, TRAIT_RESISTCOLD)
	no_equip = list(SLOT_WEAR_MASK, SLOT_WEAR_SUIT, SLOT_GLASSES, SLOT_SHOES, SLOT_S_STORE)
	
	mutanteyes = /obj/item/organ/eyes/night_vision/shadowling/l_shadowling
	burnmod = 1.25
	heatmod = 1.25
	brutemod = 0.75
	punchdamagelow = 5       //shadow claws
	punchdamagehigh = 16     //shadow claws
	punchstunthreshold = 13  //shadow claws 33% chance to stun

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
			H.SetSleeping(0) // Evil shadows don`t sleep
			H.adjustToxLoss(-4)
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, -25)
			H.adjustCloneLoss(-3)
			H.clear_alert("lightexposure")

/datum/game_mode/proc/update_shadow_icons_added(datum/mind/shadow_mind)
	var/datum/atom_hud/antag/shadow_hud = GLOB.huds[ANTAG_HUD_SHADOW]
	shadow_hud.join_hud(shadow_mind.current)
	set_antag_hud(shadow_mind.current, ((is_shadow(shadow_mind.current)) ? "shadowling" : "thrall"))

/datum/game_mode/proc/update_shadow_icons_removed(datum/mind/shadow_mind)
	var/datum/atom_hud/antag/shadow_hud = GLOB.huds[ANTAG_HUD_SHADOW]
	shadow_hud.leave_hud(shadow_mind.current)
	set_antag_hud(shadow_mind.current, null)

/mob/living/proc/add_thrall()
	if(!istype(mind))
		return FALSE
	var/mob/M
	var/thralls_warning_check = 0
	for(M in GLOB.alive_mob_list)
		if(is_thrall(M))
			thralls_warning_check++
		if(!SSticker.mode.victory_warning_announced && (thralls_warning_check >= SSticker.mode.warning_threshold))
			SSticker.mode.victory_warning_announced = TRUE	//then let's give the station a warning
			priority_announce("Large concentration of psychic bluespace energy detected by long-ranged scanners. Shadowling ascension event imminent. Any personnel is authorized to prevent it at all costs!", "Central Command Higher Dimensional Affairs", 'sound/AI/spanomalies.ogg')
	return mind.add_antag_datum(ANTAG_DATUM_THRALL)

/mob/living/proc/add_sling()
	if(!istype(mind))
		return FALSE
	return mind.add_antag_datum(ANTAG_DATUM_SLING)

/mob/living/proc/remove_thrall()
	if(!istype(mind))
		return FALSE
	return mind.remove_antag_datum(ANTAG_DATUM_THRALL)

/mob/living/proc/remove_sling()
	if(!istype(mind))
		return FALSE
	return mind.remove_antag_datum(ANTAG_DATUM_SLING)

/datum/game_mode/shadowling/generate_credit_text()
	var/list/round_credits = list()
	var/len_before_addition

	round_credits += "<center><h1>The Shadowlings:</h1>"
	len_before_addition = round_credits.len
	for(var/datum/mind/shadow in shadows)
		round_credits += "<center><h2>[shadow.name] as a Shadowling</h2>"
	if(len_before_addition == round_credits.len)
		round_credits += list("<center><h2>The Shadowlings have moved to the shadows!</h2>", "<center><h2>We couldn't locate them!</h2>")
	round_credits += "<br>"

	round_credits += ..()
	return round_credits


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
			if (light_amount > LIGHT_DAM_THRESHOLD && prob(4))
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