/mob/living/simple_animal/ascendant_shadowling
	name = "ascendant shadowling"
	desc = "HOLY SHIT RUN THE FUCK AWAY- <span class='shadowling'>RAAAAAAA!</span>"
	icon = 'yogstation/icons/mob/mob.dmi'
	icon_state = "shadowling_ascended"
	icon_living = "shadowling_ascended"
	verb_say = "telepathically thunders"
	verb_ask = "telepathically thunders"
	verb_exclaim = "telepathically thunders"
	verb_yell = "telepathically thunders"
	force_threshold = 40 //INFINITY previously couldn`t die by normal means, now just very robast. They are halfway gods, u know.
	damage_coeff = list(BRUTE = -0.5, BURN = 0.5, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	health = 1000
	maxHealth = 1000 // Like maybe fire 40 times with pulse or do something crasy to stop them.
	del_on_death = 1
	speed = 0
	see_in_dark = 9
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	see_invisible = SEE_INVISIBLE_MINIMUM
	response_help   = "pokes"
	response_disarm = "flails at"
	response_harm   = "flails at"
	harm_intent_damage = 0
	armour_penetration = 50 //Godlike attacks with claws of pure darkness
	melee_damage_lower = 40 //Was 60, then 160, nerfed. Giving a chance to assistents and deathsquad members.
	melee_damage_upper = 100 //Was 160, increased penetration for chadness (previously attacks do 40 damage to deathsquads)
	attacktext = "rends"
	attack_sound = 'sound/weapons/slash.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	environment_smash = 3
	faction = list("faithless")
	var/obj/item/gps/internal
	var/internal_type = /obj/item/gps/internal/ascendant_shadowling
	speech_span = SPAN_REALLYBIG //screw it someone else can figure out how to put both SPAN_YELL and SPAN_REALLYBIG on a speech_span later

/mob/living/simple_animal/ascendant_shadowling/Initialize()
	. = ..()
	LoadComponent(/datum/component/walk)
	internal = new internal_type(src)

/mob/living/simple_animal/ascendant_shadowling/Destroy()
	QDEL_NULL(internal)
	. = ..()

/mob/living/simple_animal/ascendant_shadowling/death(gibbed)
	if(!gibbed)
		send_to_playing_players(span_shadowling("<b><font size=4> Shadow Signature Silently Sinks Into Void, Fleeing The Battle. Regroup. Reassemble. Evil Is Timeless, After All... </font>"))
		var/X
		var/mob/M = X
		for(X in GLOB.alive_mob_list)
			M = X
			to_chat(M, span_notice("<i><b>You feel a woosh as newly released energy temporarily distorts space itself...</b></i>"))
	..()

/mob/living/simple_animal/ascendant_shadowling/Process_Spacemove(movement_dir = 0)
	return TRUE //copypasta from carp code

/mob/living/simple_animal/ascendant_shadowling/ex_act(severity)
	return FALSE //You think an ascendant can be hurt by bombs? HA

/obj/item/gps/internal/ascendant_shadowling
	icon_state = null
	gpstag = "Shadowy Signal"
	desc = "Shadowy?.. Oh god, oh fuck..."
	invisibility = 100

/mob/living/simple_animal/ascendant_shadowling/singularity_act()
	to_chat(src, "<span class='shadowling>NO NO NO AAAAAAAAAAAAAAAAAAA-</span>")
	send_to_playing_players(span_shadowling("<b>\"<font size=6>NO!</font> <font size=5>I will</font> <font size=4>not be.... destroyed</font> <font size=3>by a....</font> <font size=2>AAAAAAA-</font>\""))
	for(var/X in GLOB.alive_mob_list)
		var/mob/M = X
		to_chat(M, span_notice("<i><b>You feel a woosh as newly released energy temporarily distorts space itself...</b></i>"))
	sound_to_playing_players('sound/hallucinations/wail.ogg') // Ghosts have ears!!
	QDEL_NULL(internal)
	. = ..()