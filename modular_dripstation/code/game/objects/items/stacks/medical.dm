/obj/item/stack/medical/gauze
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/stack/medical/gauze/improvised
	icon = 'icons/obj/stack_medical.dmi'

/obj/item/stack/medical/bruise_pack
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/stack/medical/ointment
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/reagent_containers/medspray
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/reagent_containers/medspray/attack_self(mob/user)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/attack(mob/M, mob/user, def_zone)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/update_icon_state()
	. = ..()
	switch(volume)
		if(30)
			icon_state = "[initial(icon_state)]_full"
		if(0)
			icon_state = "[initial(icon_state)]_empty"
		else
			icon_state = "[initial(icon_state)]"
