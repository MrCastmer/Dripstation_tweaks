/obj/item/gun
	var/dual_wield_spread = 24 //additional spread when autofiring

/obj/item/gun/AltClick(mob/living/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(pin && pin.jammed)
		user.visible_message(span_notice("[user] starting unjamming [user.p_their()] [pin.name] in \the [src]."), \
								 span_notice("You start fixing the [pin.name] in [src]."))
		pin.fix(user, 3 SECONDS)
