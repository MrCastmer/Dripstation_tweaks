/obj/item/organ/cyberimp/eyes/hud
	icon_state = "eye"
	icon = "dripstation/icons/obj/augment.dmi"
	implant_overlay = null
	
/obj/item/organ/cyberimp/eyes/hud/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	var/obj/item/organ/eyes/eyes = owner.getorganslot(ORGAN_SLOT_EYES)
	to_chat(owner, span_danger("Your hud overloads and blind you!"))
	owner.flash_act(override_blindness_check = 1)
	owner.blind_eyes(4)
	owner.blur_eyes(6)
	eyes.applyOrganDamage(10 / severity)

/obj/item/organ/cyberimp/eyes/hud/medical
	icon_state = "eye_medical"

/obj/item/organ/cyberimp/eyes/hud/security
	icon_state = "eye"

/obj/item/organ/cyberimp/eyes/hud/security/syndicate
	icon_state = "eye_syndicate"

/obj/item/organ/cyberimp/eyes/hud/security/syndicate/emp_act(severity)
	return

/obj/item/organ/cyberimp/eyes/hud/diagnostic
	icon_state = "eye_diagnostic"

/obj/item/organ/cyberimp/eyes/hud/science
	icon_state = "eye_science"