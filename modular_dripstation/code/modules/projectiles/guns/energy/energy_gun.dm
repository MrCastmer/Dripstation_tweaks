/obj/item/gun/energy/e_gun
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/hos
	name = "\improper NT-S02 MultiPhase Energy Gun"
	desc = "An expensive, modern recreation of the antique laser gun, and the second of the 'S' or special class weapons meant for the use of space station command staff. Like the standard energy gun, it has a stun and kill setting, but due to the increase in demand of portable EMP-based weaponry, this weapon is equipped with an ion mode. Lacks the ability to recharge on its own but provides military grade taser setting."
	icon_state = "hoslaser"
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/ion/hos, /obj/item/ammo_casing/energy/electrode)

/obj/item/gun/energy/e_gun/stun/tesla_revolver
	name = "\improper NT-S01 Revolver Energy Gun"
	desc = "An expensive, modern recreation of the antique laser gun, and the second of the 'S' or special class weapons meant for the use of space station command staff. Like the standard energy gun, it has a stun and kill setting, but also provides specops grade taser setting."
	pin = /obj/item/firing_pin/implant/mindshield
	icon_state = "energyrevolver"
	item_state = "gun"

/obj/item/gun/energy/e_gun/mini/secure
	icon_state = "mini_secure"
	item_state = "gun"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/e_gun/bouncer
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/dragnet
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/turret
	icon = 'icons/obj/guns/energy.dmi'