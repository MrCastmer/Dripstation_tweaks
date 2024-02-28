/obj/item/stack/medical/gauze
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/stack/medical/gauze/improvised
	icon_state = "improvised_gauze"

/obj/item/stack/medical/bruise_pack
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/stack/medical/ointment
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/reagent_containers/medspray
	icon = 'modular_dripstation/icons/obj/aid.dmi'

/obj/item/reagent_containers/medspray/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/on_reagent_change(changetype)			//When the reagents change, change the icon as well.
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/attack_self(mob/user)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/attack(mob/M, mob/user, def_zone)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/reagent_containers/medspray/update_icon_state()
	. = ..()
	var/initial_icon = initial(icon_state)
	if(!reagents || !reagents.total_volume)
		icon_state = "[initial_icon]_empty"
	else if(reagents.total_volume == volume)
		icon_state = "[initial_icon]_full"
	else
		icon_state = "[initial_icon]"