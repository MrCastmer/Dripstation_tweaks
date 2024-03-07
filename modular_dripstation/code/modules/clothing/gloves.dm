/obj/item/clothing/gloves/cargo_gauntlet
	name = "\improper cargo gauntlets"
	desc = "These rubberized gauntlets have high adhesion to the metal surface that allows you to drag crates and lockers with more confidence on them not getting nabbed from you."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "cargogloves"
	item_state = "cargogloves"
	custom_premium_price = 300
	cryo_preserve = TRUE
	cold_protection = HANDS
	heat_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	undyeable = TRUE
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 50, ELECTRIC = 60)
	var/datum/weakref/pull_component_weakref

/obj/item/clothing/gloves/cargo_gauntlet/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_EQUIPPED, PROC_REF(on_glove_equip))
	RegisterSignal(src, COMSIG_ITEM_POST_UNEQUIP, PROC_REF(on_glove_unequip))

/// Called when the glove is equipped. Adds a component to the equipper and stores a weak reference to it.
/obj/item/clothing/gloves/cargo_gauntlet/proc/on_glove_equip(datum/source, mob/equipper, slot)
	SIGNAL_HANDLER

	if(!(slot & ITEM_SLOT_GLOVES))
		return

	var/datum/component/strong_pull/pull_component = pull_component_weakref?.resolve()
	if(pull_component)
		stack_trace("Gloves already have a pull component associated with \[[pull_component.parent]\] when \[[equipper]\] is trying to equip them.")
		QDEL_NULL(pull_component_weakref)

	to_chat(equipper, span_notice("You feel the gauntlets activate as soon as you fit them on, making your pulls stronger!"))

	pull_component_weakref = WEAKREF(equipper.AddComponent(/datum/component/strong_pull))

/*
 * Called when the glove is unequipped. Deletes the component if one exists.
 *
 * No component being associated on equip is a valid state, as holding the gloves in your hands also counts
 * as having them equipped, or even in pockets. They only give the component when they're worn on the hands.
 */
/obj/item/clothing/gloves/cargo_gauntlet/proc/on_glove_unequip(datum/source, force, atom/newloc, no_move, invdrop, silent)
	SIGNAL_HANDLER

	var/datum/component/strong_pull/pull_component = pull_component_weakref?.resolve()

	if(!pull_component)
		return

	to_chat(pull_component.parent, span_warning("You have lost the grip power of [src]!"))

	QDEL_NULL(pull_component_weakref)


/obj/item/clothing/gloves/cargo_gauntlet/qm
	name = "\improper QM`s cargo gauntlets"
	desc = "These rubberized gauntlets have high adhesion to the metal surface that allows you to drag crates and lockers with more confidence on them not getting nabbed from you. Provides additional protection to QM`s hands."
	body_parts_covered = ARMS|HANDS
	clothing_traits = list(TRAIT_STRONG_GRIP)
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 50, ELECTRIC = 60)

/obj/item/clothing/gloves/krav_maga/sec
	name = "krav maga gloves"
	desc = "These gloves can teach you to perform Krav Maga using nanochips."
	icon_state = "fightgloves"
	item_state = "fightgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	cryo_preserve = TRUE

/obj/item/clothing/gloves/krav_maga/combatglovesplus
	name = "combat gloves plus"
	icon_state = "combat_plus"
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'

/obj/item/clothing/gloves/color/black
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	var/fingerless_variation = /obj/item/clothing/gloves/fingerless

/obj/item/clothing/gloves/color/yellow
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'

/obj/item/clothing/gloves/color/black/forensic
	icon = 'icons/obj/clothing/gloves.dmi'

/obj/item/clothing/gloves/color/black/goliath
	icon = 'icons/obj/clothing/gloves.dmi'

/obj/item/clothing/gloves/color/black/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER)
		if(can_be_cut && icon_state == initial(icon_state))//only if not dyed
			to_chat(user, span_notice("You snip the fingertips off of [src]."))
			I.play_tool_sound(src)
			var/obj/item/clothing/gloves/fingerless/FG = fingerless_variation
			new FG(drop_location())
			qdel(src)
	..()

/obj/item/clothing/gloves/combat
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "combat"
	cryo_preserve = TRUE

/obj/item/clothing/gloves/combat/militech
	icon_state = "militech_combat"

/obj/item/clothing/gloves/combat/shelg
	icon_state = "shelg_combat"

/obj/item/clothing/gloves/combat/gorlex
	icon_state = "gorlex_combat"

/obj/item/clothing/gloves/combat/cybersun
	icon_state = "cybersun_combat"

/obj/item/clothing/gloves/combat/cybersun/bloody
	icon_state = "cybersun_combat_bloody"

/obj/item/clothing/gloves/combat/maid
	name = "combat maid sleeves"
	desc = "These 'tactical' gloves and sleeves are fireproof and electrically insulated. Warm to boot."
	icon_state = "syndimaid_arms"
	item_state = "syndimaid_arms"

/obj/item/clothing/gloves/combat/odst	//robust
	name = "\improper ODST gloves"
	desc = "Heavy combat gauntlets issued for frontline personnel."
	icon_state = "ODST_gauntlets"
	cold_protection = ARMS|HANDS
	heat_protection = ARMS|HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	clothing_traits = list(TRAIT_QUICKER_CARRY, TRAIT_STRONG_GRIP)
	armor = list(MELEE = 20, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50, WOUND = 5, ELECTRIC = 100)

/obj/item/clothing/gloves/combat/odst/deathsquad	//literally overpowered
	var/tacticalspeed = 0.66 //Does channels 34% faster
	var/worn

/obj/item/clothing/gloves/combat/odst/deathsquad/equipped(mob/user, slot)
	..()
	var/mob/living/carbon/human/boss = user
	if(slot == ITEM_SLOT_GLOVES)
		if(!worn) //Literally just in case there's some weirdness so you can't cheese this
			boss.physiology.do_after_speed *= tacticalspeed //Does channels 10% faster
			worn = TRUE

/obj/item/clothing/gloves/combat/odst/deathsquad/dropped(mob/user)
	..()
	var/mob/living/carbon/human/boss = user
	if(worn) //This way your speed isn't slowed if you never actually put on the gloves
		boss.physiology.do_after_speed /= tacticalspeed
		worn = FALSE

/obj/item/clothing/gloves/combat/odst/deathsquad/Touch(mob/living/target, proximity = TRUE)
	var/mob/living/M = loc
	M.changeNext_move(CLICK_CD_CLICK_ABILITY) //0.6 seconds instead of 0.8, but affects any intent instead of just harm
	. = FALSE

/obj/item/clothing/gloves/color/latex
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'

/obj/item/clothing/gloves/maid
	name = "maid sleeves"
	desc = "Just cute sleeves."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "maid_arms"
	item_state = "maid_arms"

/obj/item/clothing/gloves/color/captain/black
	desc = "Regal black gloves, with a nice silver trim, a diamond anti-shock coating, and an integrated thermal barrier. Swanky."
	icon_state = "silver"

/obj/item/clothing/gloves/color/black/tactifool
	name = "tactical black gloves"
	desc = "Standart tactical gloves issued for use with security low rank personnel."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "black_tactifool"
	can_be_cut = 1
	fingerless_variation = /obj/item/clothing/gloves/fingerless/tactifool

/obj/item/clothing/gloves/fingerless/tactifool
	name = "tactical fingerless gloves"
	desc = "Plain tactical gloves issued for use with security low rank personnel. These are without fingertips."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "fingerless_tactifool"

/obj/item/clothing/gloves/fingerless/tactifool/qm
	name = "tacticool fingerless gloves"
	desc = "Plain tactical gloves issued for use with security low rank personnel. QM`s personal property."
	cryo_preserve = TRUE

/obj/item/clothing/gloves/fingerless/bigboss/combat
	name = "\improper tactical fingerless gloves"
	desc = "These high-quality tactical gloves are made of genuine leather and suede. They provide thermal protection even without fingers covered. Looks expensive."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "combat_fingerless"
	cold_protection = ARMS|HANDS
	heat_protection = ARMS|HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	body_parts_covered = ARMS|HANDS
	armor = list(MELEE = 15, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50, WOUND = 0, ELECTRIC = 0)

/obj/item/clothing/gloves/tackler
	name = "gripper gloves"
	desc = "Special gloves that manipulate the blood vessels in the wearer's hands, granting them the ability to launch headfirst into walls."
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'
	icon_state = "black"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	resistance_flags = NONE
	custom_premium_price = 400
	cryo_preserve = TRUE
	/// For storing our tackler datum so we can remove it after
	var/datum/component/tackler
	/// See: [/datum/component/tackler/var/stamina_cost]
	var/tackle_stam_cost = 25
	/// See: [/datum/component/tackler/var/base_knockdown]
	var/base_knockdown = 1 SECONDS
	/// See: [/datum/component/tackler/var/range]
	var/tackle_range = 4
	/// See: [/datum/component/tackler/var/min_distance]
	var/min_distance = 0
	/// See: [/datum/component/tackler/var/speed]
	var/tackle_speed = 1
	/// See: [/datum/component/tackler/var/skill_mod]
	var/skill_mod = 1

/obj/item/clothing/gloves/tackler/Destroy()
	tackler = null
	return ..()

/obj/item/clothing/gloves/tackler/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	if(slot & ITEM_SLOT_GLOVES)
		var/mob/living/carbon/human/H = user
		tackler = H.AddComponent(/datum/component/tackler, stamina_cost=tackle_stam_cost, base_knockdown = base_knockdown, range = tackle_range, speed = tackle_speed, skill_mod = skill_mod, min_distance = min_distance)

/obj/item/clothing/gloves/tackler/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_GLOVES) == src)
		QDEL_NULL(tackler)

/obj/item/clothing/gloves/tackler/security
	name = "security gripper gloves"
	desc = "Special gloves that manipulate the blood vessels in the wearer's hands, granting them the ability to launch headfirst into walls. Fireproof to boot!"
	icon_state = "black_tactifool"
	cold_protection = HANDS
	heat_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/tackler/tactical
	name = "tactical gripper fingerless gloves"
	desc = "Special gloves that manipulate the blood vessels on insane level and give the user an edge in close combat."
	icon_state = "tacticalgloves"

	tackle_stam_cost = 20
	base_knockdown = 1.5 SECONDS
	tackle_range = 6
	tackle_speed = 2
	skill_mod = 4
	
	var/tacticalspeed = 0.66 //Does channels 34% faster
	var/worn
	clothing_traits = list(TRAIT_QUICKER_CARRY, TRAIT_STRONG_GRIP)

/obj/item/clothing/gloves/tackler/tactical/equipped(mob/user, slot)
	..()
	var/mob/living/carbon/human/boss = user
	if(slot == ITEM_SLOT_GLOVES)
		if(!worn) //Literally just in case there's some weirdness so you can't cheese this
			boss.physiology.do_after_speed *= tacticalspeed //Does channels 10% faster
			worn = TRUE

/obj/item/clothing/gloves/tackler/tactical/dropped(mob/user)
	..()
	var/mob/living/carbon/human/boss = user
	if(worn) //This way your speed isn't slowed if you never actually put on the gloves
		boss.physiology.do_after_speed /= tacticalspeed
		worn = FALSE

/obj/item/clothing/gloves/tackler/tactical/Touch(mob/living/target, proximity = TRUE)
	var/mob/living/M = loc
	M.changeNext_move(CLICK_CD_CLICK_ABILITY) //0.6 seconds instead of 0.8, but affects any intent instead of just harm
	. = FALSE

/obj/item/clothing/gloves/tackler/combat
	name = "guerrilla combat gloves"
	desc = "Premium quality combative gloves, heavily reinforced to give the user an edge in close combat tackles, though they are more taxing to use than normal gripper gloves. Absorbing electrical shocks and fireproof to boot!"
	icon_state = "combat"

	tackle_stam_cost = 30
	base_knockdown = 1.25 SECONDS
	tackle_range = 5
	skill_mod = 2

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list(MELEE = 15, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 15, BIO = 5, RAD = 5, FIRE = 80, ACID = 50, WOUND = 0, ELECTRIC = 100)

/obj/item/clothing/gloves/tackler/nt
	name = "\improper NT gripper gloves"
	desc = "NT brand tackler gloves, granting the user ability to launch headfirst into walls and letting the user sail through the hallways."
	icon_state = "nt_combat"

	tackle_stam_cost = 15
	base_knockdown = 0.5 SECONDS
	tackle_range = 5
	tackle_speed = 2
	min_distance = 2
	skill_mod = -2

/obj/item/clothing/gloves/tackler/combat/nt_elite
	name = "\improper NT elite gripper gloves"
	desc = "Superior quality combative gloves, good for performing tackle takedowns as well as absorbing electrical shocks."
	icon_state = "nt_combat"

	tackle_stam_cost = 25
	base_knockdown = 1 SECONDS
	tackle_range = 5
	skill_mod = 3


/obj/item/clothing/gloves/tackler/combat/waffle
	name = "\improper Waffle Co rocket gloves"
	desc = "The ultimate in high risk, high reward, perfect for when you need to stop target from fifty feet away or die trying. Banned in most Spinward gridiron football and rugby leagues."
	icon_state = "waffle_combat"

	tackle_stam_cost = 50
	base_knockdown = 2 SECONDS
	tackle_range = 10
	min_distance = 7
	tackle_speed = 6
	skill_mod = 7

/obj/item/clothing/gloves/tackler/combat/infiltrator
	name = "infiltrator combat gloves"
	desc = "Sleek, aerodynamic gripper gloves that are less effective at actually performing takedowns, but more effective at letting the user sail through the hallways."
	icon_state = "infiltrator"

	tackle_stam_cost = 15
	base_knockdown = 0.5 SECONDS
	tackle_range = 5
	tackle_speed = 2
	min_distance = 2
	skill_mod = -2

/obj/item/clothing/gloves/tackler/combat/infiltrator/chameleon
	var/datum/action/item_action/chameleon/change/chameleon_action
	syndicate = TRUE

/obj/item/clothing/gloves/tackler/combat/infiltrator/chameleon/Initialize(mapload)
	. = ..()
	chameleon_action = new(src)
	if(syndicate)
		chameleon_action.syndicate = TRUE
	chameleon_action.chameleon_type = /obj/item/clothing/gloves
	chameleon_action.chameleon_name = "Gloves"
	chameleon_action.chameleon_blacklist = typecacheof(list(/obj/item/clothing/gloves, /obj/item/clothing/gloves/color, /obj/item/clothing/gloves/changeling), only_root_path = TRUE)
	chameleon_action.initialize_disguises()
	add_item_action(chameleon_action)

/obj/item/clothing/gloves/tackler/combat/infiltrator/chameleon/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	chameleon_action.emp_randomise()