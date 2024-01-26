/obj/item/module
	name = "Module"
	var/complexity = 0
	var/list/incompatible_modules = list()
	actions_types = list(/datum/action/item_action/mode_action)
	var/on = FALSE
	var/second_action = FALSE
	var/second_effect = FALSE
	var/mob/living/carbon/human/cur_user

/datum/action/item_action/mode_action
	name = "Mode activation"

/datum/action/item_action/mode_action/second
	name = "Second setting activation"

/datum/action/item_action/mode_action/second/IsAvailable(feedback = FALSE)
	var/obj/item/module/linked_module = target
	if(!istype(linked_module) || !linked_module.second_action)
		return FALSE
	return ..()

/obj/item/module/Initialize()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/module/attack_self()
	return

/obj/item/module/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/mode_action))
		cycle(user)
	else(!second_action || istype(action, /datum/action/item_action/mode_action/second))
		if(second_action)
			second_effect = !second_effect
			to_chat(user, span_notice("You turn the mode setting [second_effect ? "on" : "off"]."))


/obj/item/module/proc/cycle(mob/user)
	if(!istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi))
		to_chat(user, "<span class='warning'>\The [src] must be connected to the hardsuit!</span>")
		return

	var/mob/living/carbon/human/H = user
	if(!istype(H.s_store, /obj/item/tank/internals))
		to_chat(user, "<span class='warning'>You need a tank in your suit storage!</span>")
		return

	if(user.incapacitated())
		return

	if(!on)
		turn_on(user)
		to_chat(user, span_notice("You turn the [name] on."))
	else
		turn_off(user)
		to_chat(user, span_notice("You turn the jetpack off."))
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()

/obj/item/module/proc/turn_on(mob/user)
	if(!istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi) || !ishuman(loc.loc) || loc.loc != user)
		return
	START_PROCESSING(SSobj, src)
	cur_user = user
	on = TRUE
	update_appearance(UPDATE_ICON)

/obj/item/module/proc/turn_off(mob/user)
	on = FALSE
	STOP_PROCESSING(SSobj, src)
	cur_user = null
	on = FALSE
	update_appearance(UPDATE_ICON)

/obj/item/module/process()
	if(!istype(loc, /obj/item/clothing/suit/space/hardsuit/syndi) || !ishuman(loc.loc))
		turn_off(cur_user)
		return
	var/mob/living/carbon/human/H = loc.loc
	..()



///Energy Shield - Gives you a rechargeable energy shield that nullifies attacks.
/obj/item/module/energy_shield
	name = "модуль силового щита"
	desc = "A personal protective force field typically used for military purposes. \
		This advanced deflector shield is essentially a smaller version of those found on ships.
		what does their electricity consumption indicate? However, he is able to block almost any attack,\
		however, due to the low number of charges, the user still remains mortal."
	icon_state = "energy_shield"
	complexity = 3
	incompatible_modules = list(/obj/item/module/energy_shield)
	/// Max charges of the shield.
	var/max_charges = 3
	/// The time it takes for the first charge to recover.
	var/recharge_start_delay = 20 SECONDS
	/// How much time it takes for charges to recover after they started recharging.
	var/charge_increment_delay = 1 SECONDS
	/// How much charge is recovered per recovery.
	var/charge_recovery = 1
	/// Whether or not this shield can lose multiple charges.
	var/lose_multiple_charges = FALSE
	/// The item path to recharge this shielkd.
	var/recharge_path = null
	/// The icon file of the shield.
	var/shield_icon_file = 'icons/effects/effects.dmi'
	/// The icon_state of the shield.
	var/shield_icon = "shield-red"
	/// Charges the shield should start with.
	var/charges

/obj/item/mod/module/energy_shield/Initialize(mapload)
	. = ..()
	charges = max_charges

/obj/item/mod/module/energy_shield/on_suit_activation()
	mod.AddComponent(/datum/component/shielded, max_charges = max_charges, recharge_start_delay = recharge_start_delay, charge_increment_delay = charge_increment_delay, \
	charge_recovery = charge_recovery, lose_multiple_charges = lose_multiple_charges, recharge_path = recharge_path, starting_charges = charges, shield_icon_file = shield_icon_file, shield_icon = shield_icon)
	RegisterSignal(mod.wearer, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(shield_reaction))

/obj/item/mod/module/energy_shield/on_suit_deactivation(deleting = FALSE)
	var/datum/component/shielded/shield = mod.GetComponent(/datum/component/shielded)
	charges = shield.current_charges
	qdel(shield)
	UnregisterSignal(mod.wearer, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/mod/module/energy_shield/proc/shield_reaction(mob/living/carbon/human/owner, atom/movable/hitby, damage = 0, attack_text = "the attack", attack_type = MELEE_ATTACK, armour_penetration = 0)
	if(SEND_SIGNAL(mod, COMSIG_ITEM_HIT_REACT, owner, hitby, attack_text, 0, damage, attack_type) & COMPONENT_HIT_REACTION_BLOCK)
		//drain_power(use_power_cost)
		return SHIELD_BLOCK
	return NONE