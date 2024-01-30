/obj/item/gun/energy/laser
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/hitscan
	name = "laser gun"
	desc = "The NT-L4 is a basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	icon_state = "laser_hitscan"
	item_state = LASER
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/laser/captain
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/captain/scattershot
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/lasercannon
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/xray
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
