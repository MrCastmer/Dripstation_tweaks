/obj/item/clothing/gloves/color/black
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	var/fingerless_variation = /obj/item/clothing/gloves/fingerless

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
	icon_state = "black_tactifool"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	resistance_flags = NONE
	custom_premium_price = 600
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

/obj/item/clothing/gloves/tackler/combat/nt
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