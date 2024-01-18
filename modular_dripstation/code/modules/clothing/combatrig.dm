//////Dual-mode hardsuits//////
//Starting with original sindi one
/obj/item/clothing/head/helmet/space/hardsuit/syndi
	name = "blood-red hardsuit helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_helm"
	hardsuit_type = "syndi"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25)
	on = TRUE
	var/light_status = FALSE
	var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode, /datum/action/item_action/toggle_helmet_light)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE

/obj/item/clothing/head/helmet/space/hardsuit/syndi/update_icon()
	if(on)
		icon_state += "[initial(icon_state)][light_status ? "-sealed-light":"-sealed"]"
	else
		icon_state = "[initial(icon_state)][light_status ? "sealed-light":""]"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi))
		linkedsuit = loc
	desc = initial(desc) + " It is in EVA mode"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/attack_self(mob/user) //Toggle Helmet
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot toggle your helmet while in this [user.loc]!") )
		return
	on = !on
	if(on || force)
		to_chat(user, span_notice("You switch your hardsuit to EVA mode, sacrificing speed for space protection."))
		name += " (sealed)"
		desc = initial(desc) + " It is in EVA mode"
		clothing_flags |= visor_flags
		flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
		cold_protection |= HEAD
	else
		to_chat(user, span_notice("You switch your hardsuit to atmospheric mode and can now run at full possible speed."))
		name = initial(name)
		desc = initial(desc) + " It is in combat mode"
		clothing_flags &= ~visor_flags
		flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
		cold_protection &= ~HEAD
	update_icon()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/syndi/AltClick(mob/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/toggle_helmet_light(mob/user)
	light_status = !light_status
	update_icon(user)
	set_light_on(light_status)


/obj/item/clothing/head/helmet/space/hardsuit/syndi/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name += " (sealed)"
			linkedsuit.desc = initial(linkedsuit.desc)
			linkedsuit.slowdown = 1
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		else
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = linkedsuit.alt_desc
			linkedsuit.slowdown = linkedsuit.combat_slowdown
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

		linkedsuit.icon_state = "hardsuit[on]-[hardsuit_type]"
		linkedsuit.update_icon()
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()

/obj/item/clothing/suit/space/hardsuit/syndi
	name = "blood-red hardsuit"
	desc = "A dual-mode advanced hardsuit designed for special operations. Original design by Gorlex Marauders."
	icon_state = "hardsuit1-syndi"
	item_state = "syndie_hardsuit"
	hardsuit_type = "syndi"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	jetpack = /obj/item/tank/jetpack/suit
	var/combat_slowdown = 0 //slowdown when in combat mode
	var/lightweight = 0 //used for flags when toggling


//////Scarlet Syndie suit//////

/obj/item/clothing/head/helmet/space/hardsuit/syndi/scarlet
	name = "scarlet hardsuit helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Manufactured by Donk Co."
	icon_state = "hardsuit1-scarlet"
	item_state = "scarlet_helm"
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits/head.dmi'
	icon = 'dripstation/icons/obj/clothing/suits/hats.dmi'
	hardsuit_type = "scarlet"
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25)

/obj/item/clothing/suit/space/hardsuit/syndi/scarlet
	name = "scarlet hardsuit"
	desc = "A standardized dual-mode hardsuit derived from more advanced special operations hardsuits. Manufactured by Donk Co."
	icon_state = "hardsuit1-scarlet"
	item_state = "scarlet_hardsuit"
	hardsuit_type = "scarlet"
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits/spacesuits.dmi'
	icon = 'dripstation/icons/obj/clothing/suits/spacesuits.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/scarlet
	lightweight = 1
	jetpack = null
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25)
	combat_slowdown = 0.5


//////Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	name = "elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Property of Gorlex Marauders."
	icon_state = "hardsuit1-syndielite"
	hardsuit_type = "syndielite"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 35, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/space/hardsuit/syndi/elite
	name = "elite syndicate hardsuit"
	desc = "An elite version of the syndicate hardsuit, with improved armour and fireproofing."
	icon_state = "hardsuit1-syndielite"
	hardsuit_type = "syndielite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 25, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

// Optical military
/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical
	name = "experimental elite helmet"
	icon_state = "hardsuit-optical"
	desc = "Strange looking, smoothly contoured helmet. It looks a bit blurry."
	siemens_coefficient = 0
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25)
	var/hit_reflect_chance = 50

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical
	name = "experimental voidsuit"
	icon_state = "experimental elite rig"
	desc = "Strange black hardsuit, with some devices attached to it. It looks a bit blurry. Property of Cybersun Industries."
	siemens_coefficient = 0
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25)
	actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_optical)
	var/cloak = FALSE
	var/hit_reflect_chance = 50

/datum/action/item_action/toggle_optical
	name = "Toggle Optical Disruptor"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT, BODY_ZONE_PRECISE_L_FOOT))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/AltClick(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	if(!istype(H.head, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
		return
	cloak(H)

/obj/item/clothing/suit/space/hardsuit/syndi/elite/optical/proc/cloak(mob/living/carbon/human/H)
	if(cloak)
		cloak = FALSE
		return 1

	to_chat(H, "<span class='notice'>Optical disruptor activated.</span>")
	cloak = TRUE
	animate(H,alpha = 255, alpha = 85, time = 10)

	var/remain_cloaked = TRUE
	while(remain_cloaked)
		sleep(1 SECOND)
		if(!cloak)
			remain_cloaked = 0
		if(H.stat)
			remain_cloaked = 0
		if(!istype(H.head, /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/optical))
			remain_cloaked = 0
	H.invisibility = initial(H.invisibility)
	H.visible_message("<span class='warning'>[H] suddenly fades in.</span>",
	"<span class='notice'>Optical disruptor deactivated.</span>")
	cloak = FALSE

	animate(H,alpha = 85, alpha = 255, time = 10)


//////Military suit designes//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	name = "military hardsuit helmet"
	desc = "An austere hardsuit used by paramilitary groups and real soldiers alike across human space."
	icon_state = "hardsuit1-syndielite"
	hardsuit_type = "militaryelite"
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 35, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25)
	light_range = 7
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT


/obj/item/clothing/suit/space/hardsuit/syndi/military
	name = "military hardsuit"
	desc = "An austere hardsuit used by paramilitary groups and real soldiers alike across human space."
	icon_state = "hardsuit1-syndielite"
	hardsuit_type = "syndielite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 25, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	combat_slowdown = 0.3


//////Emergency Response Team suits//////

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert
	name = "elite emergency response team hardsuit helmet (operative)"
	desc = "Advanced helmet issued to operative of emergency response team Gamma."
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25)
	strip_delay = 130
	light_range = 7

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	name = "elite emergency response team hardsuit (operative)"
	desc = "Advanced rig issued to operative of emergency response team Gamma."
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/sec


//////Commander//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team hardsuit helmet (squad leader)"
	desc = "Advanced helmet issued to officer of emergency response team Gamma."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 70, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25)
	var/hit_reflect_chance = 40

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/examine(mob/user)
	. = ..()
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert))
		. += "Engraved on the back: \
			In this particular shitshow you have to be armed to enforce your authority. \
			But you're not required to use your weapon under any circumstances."

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == SLOT_HEAD)
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
	AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	name = "elite emergency response team hardsuit (squad leader)"
	desc = "Advanced rig issued to officer of emergency response team Gamma. Made from superior materials, one of the latest in the modern combat rigs line."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/com
	var/hit_reflect_chance = 40

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE


//////Engineer//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team hardsuit helmet (field engineer)"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	name = "elite emergency response team hardsuit (field engineer)"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/engi


//////Medic//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med
	name = "elite emergency response team hardsuit helmet (field medic)"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25)
	clothing_flags = THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == SLOT_HEAD)
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
	name = "elite emergency response team hardsuit (field medic)"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/med


//////Paranormal//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paranormal
	name = "elite emergency response team hardsuit helmet (interdimensional specialist)"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25)

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paranormal/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paranormal
	name = "elite emergency response team hardsuit (interdimensional specialist)"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/paranormal

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/paranormal/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, TRUE, ITEM_SLOT_OCLOTHING)


//////Specialists//////
/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team hardsuit helmet (field janitor)"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/jani
	name = "elite emergency response team hardsuit (field janitor)"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/jani

/obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team hardsuit helmet (honksquad operative)"

/obj/item/clothing/suit/space/hardsuit/syndi/military/ert/clown
	name = "elite emergency response team hardsuit (honksquad operative)"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/military/ert/clown