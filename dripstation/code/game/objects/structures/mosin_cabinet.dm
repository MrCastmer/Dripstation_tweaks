/obj/structure/fireaxecabinet
	var/obj/item/gun/ballistic/rifle/boltaction/qmrifle/mosintactical

/obj/structure/fireaxecabinet/attackby(obj/item/I, mob/user, params)
	check_deconstruct(I, user)//yogs - deconstructible cabinet
	if(iscyborg(user) || I.tool_behaviour == TOOL_MULTITOOL)
		reset_lock(user) //yogs - adds reset option
	else if(I.tool_behaviour == TOOL_WELDER && user.a_intent == INTENT_HELP && !broken)
		//Repairing light damage with a welder
		if(obj_integrity < max_integrity)
			if(!I.tool_start_check(user, amount=2))
				return
			to_chat(user, span_notice("You begin repairing [src]."))
			if(I.use_tool(src, user, 40, volume=50, amount=2))
				obj_integrity = max_integrity
				update_icon()
				to_chat(user, span_notice("You repair [src]."))
		else
			to_chat(user, span_warning("[src] is already in good condition!"))
		return
	else if(istype(I, /obj/item/stack/sheet/rglass) && broken)//yogs - change to reinforced glass
		//Repairing a heavily damaged fireaxe cabinet with glass
		var/obj/item/stack/sheet/rglass/G = I//yogs - change to reinforced glass
		if(G.get_amount() < 2)
			to_chat(user, span_warning("You need two reinforced glass sheets to fix [src]!"))//yogs - change to reinforced glass
			return
		to_chat(user, span_notice("You start fixing [src]..."))
		if(do_after(user, 2 SECONDS, src) && G.use(2))
			broken = 0
			obj_integrity = max_integrity
			update_icon()
	//yogs start - warn user if they use the wrong type of glass to repair
	else if(istype(I, /obj/item/stack/sheet/glass) && broken)
		to_chat(user, span_warning("You need reinforced glass sheets to fix [src]!"))
	//yogs end
	else if(open || broken)
		//Fireaxe cabinet is open or broken, so we can access it's axe slot
		if(istype(I, /obj/item/twohanded/fireaxe) && !fireaxe && axe)
			var/obj/item/twohanded/fireaxe/F = I
			if(F.wielded)
				to_chat(user, span_warning("Unwield the [F.name] first."))
				return
			if(!user.transferItemToLoc(F, src))
				return
			fireaxe = F
			to_chat(user, span_caution("You place the [F.name] back in the [name]."))
			update_icon()
			return
		else if(istype(I, /obj/item/card/id/captains_spare) && !spareid && !axe)
			var/obj/item/card/id/captains_spare/S = I
			if(!user.transferItemToLoc(S, src))
				return
			spareid = S
			to_chat(user, span_caution("You place the [S.name] back in the [name]."))
			update_icon()
			return
		else if(istype(I, /obj/item/gun/ballistic/rifle/boltaction/qmrifle) && !mosintactical && !axe)
			var/obj/item/gun/ballistic/rifle/boltaction/qmrifle/M = I
			if(!user.transferItemToLoc(M, src))
				return
			mosintactical = M
			to_chat(user, span_caution("You place the [M.name] back in the [name]."))
			update_icon()
			return
		else if(istype(I, /obj/item/twohanded/fishingrod/collapsible/miningmedic) && !olreliable && !axe)
			var/obj/item/twohanded/fishingrod/collapsible/miningmedic/R = I
			if(R.opened)
				to_chat(user, span_caution("[R.name] won't seem to fit!"))
				return
			if(!user.transferItemToLoc(R, src))
				return
			olreliable = R
			to_chat(user, span_caution("You place the [R.name] back in the [name]."))
			update_icon()
			return
		else if(!broken)
			//open the cabinet normally.
			toggle_open()
	//yogs start - adds unlock if authorized
	else if (I.GetID())
		if(obj_flags & EMAGGED)
			to_chat(user, span_notice("The [name]'s locking modules are unresponsive."))
			return
		if (allowed(user))
			toggle_lock(user)
		else
			to_chat(user, span_danger("Access denied."))
	//yogs end
	else
		return ..()


/obj/structure/fireaxecabinet/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if((fireaxe || spareid || mosintactical) && loc)
			if(spareid)
				fireaxe = spareid
			if(mosintactical)
				fireaxe = mosintactical
			fireaxe.forceMove(loc)
			fireaxe = null
		new /obj/item/stack/sheet/metal(loc, 2)
	qdel(src)

/obj/structure/fireaxecabinet/blob_act(obj/structure/blob/B)
	if(fireaxe || spareid || mosintactical)
		if(spareid)
			fireaxe = spareid
		if(mosintactical)
			fireaxe = mosintactical
		fireaxe.forceMove(loc)
		fireaxe = null
	qdel(src)

/obj/structure/fireaxecabinet/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(open || broken)
		if(fireaxe || spareid || olreliable)
			if(spareid)
				fireaxe = spareid
			if(mosintactical)
				fireaxe = mosintactical
			if(olreliable)
				fireaxe = olreliable
			user.put_in_hands(fireaxe)
			to_chat(user, span_caution("You take the [fireaxe.name] from the [name]."))
			fireaxe = null
			spareid = null
			mosintactical = null
			olreliable = null
			src.add_fingerprint(user)
			update_icon()
			return
	toggle_open()//yogs - consolidates opening code
	return

/obj/structure/fireaxecabinet/update_icon()
	cut_overlays()
	if(fireaxe)
		add_overlay("axe")
	if(spareid)
		add_overlay("card")
	if(mosintactical)
		add_overlay(image('dripstation/icons/obj/wallmounts.dmi', "mosin"))
	if(olreliable)
		add_overlay("rod")
	if(!open)
		var/hp_percent = obj_integrity/max_integrity * 100
		if(broken)
			add_overlay("glass4")
		else
			switch(hp_percent)
				if(-INFINITY to 40)
					add_overlay("glass3")
				if(40 to 60)
					add_overlay("glass2")
				if(60 to 80)
					add_overlay("glass1")
				if(80 to INFINITY)
					add_overlay("glass")
		if(locked)
			add_overlay("locked")
		else
			add_overlay("unlocked")
	else
		add_overlay("glass_raised")

//yogs NOTICE - toggle_lock() function MIRRORED to yogstation/code/game/objects/structure/fireaxe.dm
//changes made to the below function will have no effect

/obj/structure/fireaxecabinet/Destroy()//<-- mirrored/overwritten proc
	if(fireaxe)
		fireaxe.forceMove(get_turf(src))
	if(spareid)
		spareid.forceMove(get_turf(src))
	if(mosintactical)
		mosintactical.forceMove(get_turf(src))
	QDEL_NULL(spark_system)
	return ..()	

/obj/structure/fireaxecabinet/mosintacticool
	name = "mosin cabinet"
	desc = "Special cabinet for special rifle. QM rifle."
	icon = 'dripstation/icons/obj/wallmounts.dmi'
	icon_state = "mosintactical"
	axe = FALSE
	alert = FALSE
	req_access = list(ACCESS_QM)

/obj/structure/fireaxecabinet/mosintacticool/Initialize()
	. = ..()
	fireaxe = null
	mosintactical = new(src)
	update_icon()

/obj/structure/fireaxecabinet/mosintacticool/balanceissue //no fun allowed

/obj/structure/fireaxecabinet/mosintacticool/balanceissue/Initialize()
. = ..()
	qdel(mosintactical)
	update_icon()