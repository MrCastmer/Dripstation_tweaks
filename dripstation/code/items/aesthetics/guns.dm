/////////////////////////////
//////////BALLISTIC//////////
/////////////////////////////
/obj/item/gun/ballistic/automatic/wt550
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	knife_x_offset = 30
	knife_y_offset = 13

/obj/item/gun/ballistic/automatic/wt550/armory
	name = "\improper peacekeeping auto carbine"
	icon_state = "wt550_secure"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/ar
	icon = 'dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/tommygun
	icon = 'dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/proto
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/c20r
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	mag_display = FALSE
	empty_indicator = FALSE

////Due some inheritance problems all new pistols from upstream should be placed here as exceptions
/obj/item/gun/ballistic/automatic/pistol
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/m1911
	icon = 'icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/deagle
	icon = 'icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/stickman
	icon = 'icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/v38
	icon = 'icons/obj/weapons/ballistic.dmi'

////////////////////////////
//////////ENERGY//////////
////////////////////////////

//laser has same pistol issue, check it above
/obj/item/gun/energy/laser
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/retro
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/hellgun
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/captain
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/bluetag
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/redtag
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/makeshiftlasrifle
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/instakill
	icon = 'icons/obj/weapons/energy.dmi'

///Laser Cannon
/obj/item/gun/energy/lasercannon
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

//////////////////////////////
//egun has same pistol issue, check it above
/obj/item/gun/energy/e_gun
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/ancient
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/old
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/mini/practice_phaser
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/hos
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/dragnet
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/turret
	icon = 'icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/bouncer
	icon = 'icons/obj/weapons/energy.dmi'

//////////////////////////////
/obj/item/gun/energy/disabler
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/taser
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/advtaser
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/ionrifle
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/temperature
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/temperature/security
	name = "temperature gun"
	desc = "A weapon that can only be used to its full potential by the truly robust."

/obj/item/gun/energy/temperature/security/secure
	name = "security temperature gun"
	pin = /obj/item/firing_pin/implant/mindshield
	icon_state = "freezegun_secure"

/obj/item/gun/energy/pulse
	icon = 'dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/pulse/pistol/m1911
	icon = 'icons/obj/weapons/energy.dmi'