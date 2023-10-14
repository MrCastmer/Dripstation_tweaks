/obj/item/gun/grenade_launcher
	name = "\improper M79 grenade launcher"
	pin = /obj/item/firing_pin
	throw_speed = 2
	throw_range = 10
	var/list/grenades = list()
	var/max_grenades = 1
	var/max_range = 10

/obj/item/gun/grenade_launcher/Initialize()
	. = ..()
	chambered = new /obj/item/ammo_casing/grenadegun(src)

/obj/item/gun/grenade_launcher/handle_atom_del(atom/A)
	. = ..()
	if(A in grenades)
		grenades.Remove(A)

/obj/item/gun/grenade_launcher/recharge_newshot()
	if(!grenades.len)
		return
	chambered.newshot()



/obj/item/gun/grenade_launcher/get_ammo_list()
	if(!in_chamber)
		return ..()
	var/obj/item/grenade/grenade = in_chamber
	return list(grenade.hud_state, grenade.hud_state_empty)

/obj/item/gun/grenade_launcher/ready_proj(obj/object_to_fire)
	if(!istype(object_to_fire, grenade/obj/item/grenade))
		return FALSE
	vargrenade/obj/item/grenade/grenade_to_launch = object_to_fire
	var/turf/user_turf = get_turf(src)
	grenade_to_launch.forceMove(user_turf)
	user?.visible_message(span_danger("[user] fired a grenade!"), span_warning("You fire [src]!"))
	log_explosion("[key_name(user)] fired a grenade ([grenade_to_launch]) from [src] at [AREACOORD(user_turf)].")
	log_combat(user, src, "fired a grenade ([grenade_to_launch]) from [src]")
	playsound(user, enloudened.enloudened_sound, fire_sound_volume, vary_fire_sound)
	grenade_to_launch.det_time = min(10, grenade_to_launch.det_time)
	grenade_to_launch.activate(user)
	grenade_to_launch.throw_at(target, max_range, 3, (user ? user : loc))
	return TRUE



/obj/item/ammo_casing/grenade_launcher/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if(!BB)
		return
	if(istype(loc, /obj/item/gun/grenade))
		var/obj/item/gun/grenade/SG = loc
		var/obj/item/projectile/bullet/reusable/dart/D = BB
		if(!SG.grenades.len)
			return

		var/obj/item/reagent_containers/grenade/S = SG.grenades[1]

		S.reagents.trans_to(BB, S.reagents.total_volume, transfered_by = user)
		D.add_dart(S, S.proj_piercing)
		SG.grenades.Remove(S)
	..()



/obj/item/gun/grenade_launcher/riot
	name = "\improper GL-81 riot grenade launcher"
	desc = "A lightweight, single-shot grenade launcher to launch tear gas grenades. Used by Nanotrasen security during riots."
	pin = /obj/item/firing_pin/implant/mindshield









/obj/item/ammo_box/magazine/internal/TGgrenadelauncher
	name = "tear gas grenade launcher internal magazine"
	ammo_type = /obj/item/ammo_casing/a40mm/tg
	caliber = "40mm"
	max_ammo = 1

/obj/item/ammo_casing/a40mm/tg
	name = "40mm TG shell"
	desc = "A cased tear gas grenade that can only be activated once fired out of a grenade launcher."
	caliber = "40mm"
	icon_state = "40mmHE"
	projectile_type = /obj/item/projectile/bullet/a40mm/tg

/obj/item/projectile/bullet/a40mm/tg
	name ="40mm grenade"
	desc = "USE A WEEL GUN"
	icon_state= "bolter"
	damage = 60

/obj/item/projectile/bullet/a40mm/tg/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 2, 1, 0, flame_range = 3)
	return BULLET_ACT_HIT
	chem_splash(detonation_turf, affected_area, reactants, ignition_temp, threatscale)