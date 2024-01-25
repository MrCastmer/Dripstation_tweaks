#define SEALED_RIG_TRAIT "sealed-rig"

//////Dual-mode hardsuits//////
//Starting with original sindi one
/obj/item/clothing/head/helmet/space/hardsuit/syndi
	name = "scarlet RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Manufactured by Donk Co."
	icon_state = "scarlet_helm"
	item_state = "scarlet_helm"
	hardsuit_type = "scarlet"
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	on = FALSE
	var/light_status = FALSE
	var/mobility = TRUE
	var/processing = FALSE
	var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode, /datum/action/item_action/toggle_rig_light)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, LOCKED_HELMET_TRAIT)
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi))
		linkedsuit = loc
	desc = initial(desc) + " It is in combat mode"
	clothing_flags &= ~visor_flags
	flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
	flags_inv &= ~visor_flags_inv
	cold_protection &= ~HEAD

/obj/item/clothing/head/helmet/space/hardsuit/syndi/attack_self(mob/user) //Toggle hardsuit mode
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot toggle your helmet while in this [user.loc]!") )
		return
	if(processing)
		user.balloon_alert(user, "still processing!")
		return
	processing = TRUE
	playsound(src.loc, 'modular_dripstation/sound/servo_motor.ogg', 50, 1)
	if(!do_after(user, 1.8 SECONDS, user, timed_action_flags = (mobility ? IGNORE_ALL : IGNORE_HELD_ITEM), extra_checks = CALLBACK(src, PROC_REF(CheckCanToggle), user)))
		user.balloon_alert(user, "interrupted!")
		return
	processing = FALSE
	on = !on
	if(on || force)
		to_chat(user, span_notice("You switch your hardsuit to EVA mode, sacrificing speed for space protection."))
		name += " (sealed)"
		desc = initial(desc) + " It is in EVA mode"
		icon_state = "[initial(icon_state)]_sealed"
		clothing_flags |= visor_flags
		flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
		cold_protection |= HEAD
	else
		to_chat(user, span_notice("You switch your hardsuit to atmospheric mode and can now run at full possible speed."))
		name = initial(name)
		desc = initial(desc) + " It is in combat mode"
		light_status = FALSE
		set_light_on(light_status)
		icon_state = initial(icon_state)
		clothing_flags &= ~visor_flags
		flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
		cold_protection &= ~HEAD
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()


/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/CheckCanToggle(mob/user)
	var/obj/item/H = user.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!H || !istype(H, linkedsuit.helmettype))
		to_chat(user, span_warning("You need your helmet be on!"))
		return
	return TRUE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/AltClick(mob/user)
	if(!on)
		return FALSE
	light_status = !light_status
	icon_state = "[initial(icon_state)]_sealed[light_status ? "_light":""]"
	set_light_on(light_status)

/datum/action/item_action/toggle_rig_light
	name = "Toggle Helmet Light"

/datum/action/item_action/toggle_rig_light/Trigger()
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/rig = target
	if(istype(rig))
		if(!rig.on)
			return FALSE
		rig.light_status = !rig.light_status
		rig.icon_state = "[initial(rig.icon_state)]_sealed[rig.light_status ? "_light":""]"
		rig.set_light_on(rig.light_status)
		//rig.update_appearance(UPDATE_ICON)
		owner.update_inv_head()

/datum/action/item_action/toggle_rig_light/IsAvailable(feedback = FALSE)
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/rig = target
	if(!istype(rig) || !rig.on)
		return FALSE
	return ..()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name += " (sealed)"
			linkedsuit.desc = "[initial(linkedsuit.desc)] It is in EVA mode."
			linkedsuit.slowdown = linkedsuit.eva_slowdown
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
			linkedsuit.strip_delay += 50
			ADD_TRAIT(linkedsuit, TRAIT_NODROP, SEALED_RIG_TRAIT)
		else
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = "[initial(linkedsuit.desc)] It is in combat mode."
			linkedsuit.slowdown = linkedsuit.combat_slowdown
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			linkedsuit.strip_delay -= 50
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)
			REMOVE_TRAIT(linkedsuit, TRAIT_NODROP, SEALED_RIG_TRAIT)

		linkedsuit.icon_state = "[linkedsuit.hardsuit_type]_rig[on ? "_sealed":""]"
		linkedsuit.update_appearance(UPDATE_ICON)
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()

/obj/item/clothing/suit/space/hardsuit/syndi
	name = "scarlet RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Manufactured by Donk Co."
	icon_state = "scarlet_rig"
	item_state = "scarlet_rig"
	hardsuit_type = "scarlet"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	jetpack = null
	var/combat_slowdown = 0.5 //slowdown when in combat mode
	var/eva_slowdown = 1 //slowdown when in eva mode
	var/lightweight = 1 //used for flags when toggling

/obj/item/clothing/suit/space/hardsuit/syndi/Initialize()
	. = ..()
	SuitRestartHandle()

/obj/item/clothing/suit/space/hardsuit/syndi/proc/SuitRestartHandle()
	slowdown = combat_slowdown
	icon_state = "[hardsuit_type]_rig"
	clothing_flags &= ~STOPSPRESSUREDAMAGE
	cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
	if(lightweight)
		flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

/obj/item/clothing/suit/space/hardsuit/syndi/canStrip(mob/stripper, mob/owner)
	SHOULD_BE_PURE(TRUE)
	return !HAS_TRAIT_FROM(src, TRAIT_NODROP, SEALED_RIG_TRAIT)

/obj/item/clothing/suit/space/hardsuit/syndi/doStrip(mob/stripper, mob/owner)
	SuitRestartHandle()
	playsound(src.loc, 'modular_dripstation/sound/servo_motor.ogg', 50, 1)
	return owner.dropItemToGround(src)

//The Owl Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/owl
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)

/obj/item/clothing/suit/space/hardsuit/syndi/owl
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = 0
	lightweight = 0

//////Bloodred Syndie suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	name = "blood-red RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodred_helm"
	item_state = "bloodred_helm"
	hardsuit_type = "bloodred"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	name = "blood-red RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Original design by Gorlex Marauders."
	icon_state = "bloodred_rig"
	item_state = "bloodred_rig"
	hardsuit_type = "bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	jetpack = /obj/item/tank/jetpack/suit
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = 0
	lightweight = 0

//////Vahlen Sec suit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	name = "vahlen corpsman RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodred_helm"
	item_state = "bloodred_helm"
	hardsuit_type = "bloodred"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE

/obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	name = "blood-red RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Original design by Gorlex Marauders."
	icon_state = "bloodred_rig"
	item_state = "bloodred_rig"
	hardsuit_type = "bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred
	jetpack = /obj/item/tank/jetpack/suit
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 100)
	combat_slowdown = 0
	lightweight = 0


//////Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	name = "elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "relite_helm"
	item_state = "relite_helm"
	hardsuit_type = "relite"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 35, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE

/obj/item/clothing/suit/space/hardsuit/syndi/elite
	name = "elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fireproofing."
	icon_state = "relite_rig"
	item_state = "relite_rig"
	hardsuit_type = "relite"
	jetpack = /obj/item/tank/jetpack/suit
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	lightweight = 0
	combat_slowdown = 0

// Optical military
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical
	name = "experimental elite helmet"
	icon_state = "optical_helm"
	item_state = "optical_helm"
	hardsuit_type = "optical"
	desc = "Strange looking, smoothly contoured helmet. It looks a bit blurry."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	var/hit_reflect_chance = 50

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical
	name = "experimental elite rig"
	icon_state = "optical_rig"
	item_state = "optical_rig"
	hardsuit_type = "optical"
	desc = "Strange black hardsuit, with some devices attached to it. It looks a bit blurry. Property of Cybersun Industries."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_optical)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical
	var/cloak = FALSE
	var/hit_reflect_chance = 50
	lightweight = 0

/datum/action/item_action/toggle_optical
	name = "Toggle Optical Disruptor"

/datum/action/item_action/toggle_optical/Trigger(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	var/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/O = target
	O.cloak(H)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT, BODY_ZONE_PRECISE_L_FOOT))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/AltClick(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	cloak(H)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/proc/cloak(mob/living/carbon/human/H, sl)
	if(cloak)
		cloak = FALSE
		return 1

	to_chat(H, "<span class='notice'>Optical disruptor activated.</span>")
	cloak = TRUE
	animate(H,alpha = 255, alpha = 85, time = 10)

	var/remain_cloaked = TRUE
	while(remain_cloaked)
		sleep(1 SECONDS)
		if(!cloak)
			remain_cloaked = 0
		if(H.stat)
			remain_cloaked = 0
		var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
		if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
			remain_cloaked = 0
	H.invisibility = initial(H.invisibility)
	H.visible_message("<span class='warning'>[H] suddenly fades in.</span>",
	"<span class='notice'>Optical disruptor deactivated.</span>")
	cloak = FALSE

	animate(H,alpha = 85, alpha = 255, time = 10)


//////Medical Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med
	name = "elite medical syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has medical paint pattern."
	icon_state = "smedelite_helm"
	item_state = "smedelite_helm"
	hardsuit_type = "smedelite"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/med
	name = "elite medical syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has medical paint pattern."
	icon_state = "smedelite_rig"
	item_state = "smedelite_rig"
	hardsuit_type = "smedelite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/med


//////Bloody elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/bloodred
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/bloodred
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/bloodred


//////Strike team hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo
	name = "\improper Syndicate Black Ops RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	icon_state = "sbo_helm"
	item_state = "sbo_helm"
	hardsuit_type = "sbo"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/sbo
	name = "\improper Syndicate Black Ops syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 100)
	icon_state = "sbo_rig"
	item_state = "sbo_rig"
	hardsuit_type = "sbo"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo

//////ComsOff hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has contractor style."
	icon_state = "commsoff_helm"
	item_state = "commsoff_helm"
	hardsuit_type = "commsoff"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has contractor style."
	icon_state = "commsoff_rig"
	item_state = "commsoff_rig"
	hardsuit_type = "commsoff"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/sbo/commsoff


//////Military suit designes//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	name = "military RIG helmet"
	desc = "An austere tactical helmet used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_helm"
	item_state = "military_helm"
	hardsuit_type = "military"
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 35, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	light_range = 7
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE


/obj/item/clothing/suit/space/hardsuit/syndi/military
	name = "military RIG"
	desc = "An austere RIG used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_rig"
	item_state = "military_rig"
	hardsuit_type = "military"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 25, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	combat_slowdown = 0.3
	lightweight = 0

//////Emergency Response Team suits//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert
	name = "elite emergency response team RIG helmet (operative)"
	desc = "Advanced helmet issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_helm"
	item_state = "nt_combat_helm"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	strip_delay = 130
	light_range = 7

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	name = "elite emergency response team RIG (operative)"
	desc = "Advanced RIG issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_rig"
	item_state = "nt_combat_rig"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert
	jetpack = /obj/item/tank/jetpack/suit

//////Security//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec
	name = "elite emergency response team hardsuit helmet (security)"
	icon_state = "ert_security_helm"
	item_state = "ert_security_helm"
	hardsuit_type = "ert_security"
	desc = "Advanced helmet issued to security specialist of emergency response team Gamma."

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/sec
	name = "elite emergency response team RIG (security)"
	icon_state = "ert_security_rig"
	item_state = "ert_security_rig"
	hardsuit_type = "ert_security"
	desc = "Advanced RIG issued to security specialist of emergency response team Gamma."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec

//////Commander//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team RIG helmet (squad leader)"
	icon_state = "ert_commander_helm"
	item_state = "ert_commander_helm"
	hardsuit_type = "ert_commander"
	desc = "Advanced helmet issued to officer of emergency response team Gamma."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 70, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	var/hit_reflect_chance = 40

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/examine(mob/user)
	. = ..()
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert))
		. += "Engraved on the back: \
			In this particular shitshow you have to be armed to enforce your authority. \
			But you're not required to use your weapon under any circumstances."

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team RIG (squad leader)"
	desc = "Advanced RIG issued to officer of emergency response team Gamma. Made from superior materials, one of the latest in the modern combat rigs line."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	icon_state = "ert_commander_rig"
	item_state = "ert_commander_rig"
	hardsuit_type = "ert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	var/hit_reflect_chance = 40
	eva_slowdown = 0.7

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE


//////Deathsquad//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/deathsquad
	name = "elite emergency response team RIG helmet (blackops)"
	desc = "Advanced helmet issued to black ops team operator."
	icon_state = "nt_deathsquad_helm"
	item_state = "nt_deathsquad_helm"
	hardsuit_type = "nt_deathsquad"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/deathsquad
	name = "elite emergency response team RIG (blackops)"
	desc = "Advanced RIG issued to black ops team operator. Made from superior materials, one of the latest in the modern combat rigs line."
	icon_state = "nt_deathsquad_rig"
	item_state = "nt_deathsquad_rig"
	hardsuit_type = "nt_deathsquad"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/deathsquad
	combat_slowdown = 0.2


//////Engineer//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team RIG helmet (field engineer)"
	icon_state = "ert_engineer_helm"
	item_state = "ert_engineer_helm"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team RIG (field engineer)"
	icon_state = "ert_engineer_rig"
	item_state = "ert_engineer_rig"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi


//////Medic//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med
	name = "elite emergency response team RIG helmet (field medic)"
	icon_state = "ert_medical_helm"
	item_state = "ert_medical_helm"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 100)
	clothing_flags = THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.show_to(user)
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.hide_from(user)
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/med
	name = "elite emergency response team RIG (field medic)"
	icon_state = "ert_medical_rig"
	item_state = "ert_medical_rig"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med


//////Paradimentional//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional
	name = "elite emergency response team RIG helmet (paradimentional specialist)"
	icon_state = "ert_paradimentional_helm"
	item_state = "ert_paradimentional_helm"
	hardsuit_type = "ert_paradimentional"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paradimentional
	name = "elite emergency response team RIG (paradimentional specialist)"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 100)
	icon_state = "ert_paradimentional_rig"
	item_state = "ert_paradimentional_rig"
	hardsuit_type = "ert_paradimentional"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paradimentional

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paradimentional/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE|MAGIC_RESISTANCE_HOLY, inventory_flags = ITEM_SLOT_OCLOTHING)


//////Specialists//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team RIG helmet (field janitor)"
	icon_state = "ert_janitor_helm"
	item_state = "ert_janitor_helm"
	hardsuit_type = "ert_janitor"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team RIG (field janitor)"
	icon_state = "ert_janitor_rig"
	item_state = "ert_janitor_rig"
	hardsuit_type = "ert_janitor"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team RIG helmet (honksquad operative)"
	icon_state = "ert_clown_helm"
	item_state = "ert_clown_helm"
	hardsuit_type = "ert_clown"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team RIG (honksquad operative)"
	icon_state = "ert_clown_rig"
	item_state = "ert_clown_rig"
	hardsuit_type = "ert_clown"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown