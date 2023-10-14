/obj/item/gun/ballistic/rocketlauncher
	var/backblastdamage = TRUE

/obj/item/gun/ballistic/rocketlauncher/afterattack(atom/target)
	. = ..()
	magazine.get_round(FALSE) //Hack to clear the mag after it's fired
	
	//Adding cool rocket backblast. The tile behind the rocketman gets blasted hard enough to down and slightly wound anyone
	var/turf/blast_source = get_turf(src)
	var/thrown_dir = REVERSE_DIR(get_dir(blast_source, target))
	var/turf/backblast_loc = get_step(blast_source, thrown_dir)
	smoke.set_up(0, backblast_loc)
	smoke.start()
	if(!backblastdamage)
		return
	for(var/mob/living/carbon/victim in backblast_loc)
		if((victim.mobility_flags & MOBILITY_STAND) || victim.stat == DEAD) //Have to be standing up to get the fun stuff
			continue
		victim.adjustBruteLoss(15) //The shockwave hurts, quite a bit. It can knock unarmored targets unconscious in real life
		victim.Paralyze(60) //For good measure
		victim.emote("pain")
		victim.throw_at(get_step(backblast_loc, thrown_dir), 1, 2)