/obj/item/ectoplasm
	icon = 'modular_dripstation/icons/obj/wizard.dmi'


/obj/item/vibro_weapon
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/melee/transforming/vib_blade 
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/energy_katana
	icon_state = "energy_katana"
	item_state = "energy_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/energy_katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/katana
	name = "modern katana"
	desc = "Modern recreation of ancient terran weapon, capable to slice through variety of materials."
	icon_state = "modern_katana"
	item_state = "modern_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/katana/bloody
	name = "bloody katana"
	desc = "Modern katana covered in blood. And thirsts for even more of it..."
	icon_state = "bloody_katana"
	item_state = "bloody_katana"
	slot_flags = null

/obj/item/katana/basalt
	icon_state = "basalt_katana"
	item_state = "basalt_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/katana/cursed
	icon_state = "cursed"
	item_state = "cursed"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/katana/monomolecular
	name = "monomolecular katana"
	icon_state = "monomolecular"
	item_state = "monomolecular"
	desc = "An elegant weapon, its monomolecular edge is capable of cutting through flesh and bone with ease."
	block_chance = 50
	armour_penetration = 75

/obj/item/katana/murasame
	name = "\improper Murasame"
	icon_state = "murasame"
	item_state = "murasame"
	desc = "Murasame is a sword whose blade is coated with poison, which nearly instantly kills its victim. As soon as the blade's blade pierces the skin, a deadly poison is injected into the victim's wound, killing him in a matter of seconds."
	block_chance = 50
	armour_penetration = 40
	var/next_blow
	var/death_imminent = FALSE
	var/mob/living/death_wisher = null

/obj/item/katana/murasame/afterattack(atom/target, blocked)
	. = ..()
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/victim = target
		victim.reagents.add_reagent(/datum/reagent/toxin/ambusher_toxin, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/amanitin, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/initropidril, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/cyanide, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/venom, 5)
		victim.reagents.add_reagent(/datum/reagent/toxin/acid/fluacid, 5)

/obj/item/katana/murasame/attack_self(mob/living/user)
	if(world.time > next_blow && (istype(user, death_wisher)|| !death_wisher))
		balloon_alert(user, "you starting to cut yourself with [src]!")
		if(do_after(user, 0.5 SECONDS, src))
			to_chat(user, span_notice("You feel a sudden surge of energy!"))
			user.adjustStaminaLoss(-60)
			user.adjustBruteLoss(-40)
			user.adjustFireLoss(-40)
			user.reagents.add_reagent(/datum/reagent/medicine/stimulants, 10)
			if (!death_imminent)
				death_imminent = TRUE
				death_wisher = user
				addtimer(CALLBACK(src, PROC_REF(user_death), death_wisher), 30 SECONDS)
				return
			else
				next_blow = world.time + 5 SECONDS
				return
		else
			balloon_alert(user, "interrupted!")
			return
	else
		to_chat(user, span_notice("You catch your breath and can`s blow yourself now!"))

/obj/item/katana/murasame/proc/user_death(mob/living/user)
	user.reagents.add_reagent(/datum/reagent/toxin/cyanide, 5)
	user.reagents.add_reagent(/datum/reagent/toxin/venom, 5)
	sleep(10 SECONDS)
	user.adjustToxLoss(200)
	death_imminent = FALSE
	death_wisher = null

/obj/item/toy/katana
	icon_state = "modern_katana"
	item_state = "modern_katana"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/toy/katana/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	if(slot == ITEM_SLOT_BACK)
		mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	//if(slot == ITEM_SLOT_SUITSTORE)
	//	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suit_storage.dmi'
	update_appearance(UPDATE_ICON)

/obj/item/melee/sabre
	name = "officer's rapier"
	desc = "An elegant weapon, for a more civilized age. Ceremonial version issued to NanoTrasen finest."

/obj/item/storage/belt/sabre
	name = "rapier sheath"
	desc = "An ornate sheath designed to hold an officer's rapier."

/obj/item/melee/sabre/mono
	name = "\improper monomolecular NanoTrasen rapier"
	desc = "An elegant combat ready weapon of NanoTrasen finest, its monomolecular edge is capable of cutting through flesh and bone with ease."
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	icon_state = "rapier"
	force = 30
	block_chance = 60
	armour_penetration = 100

/obj/item/storage/belt/sabre/mono
	name = "rapier sheath"
	desc = "An ornate sheath designed to preserve monomolecular edge of combat rapier."

/obj/item/storage/belt/sabre/mono/PopulateContents()
	new /obj/item/melee/sabre/mono(src)
	update_appearance(UPDATE_ICON)