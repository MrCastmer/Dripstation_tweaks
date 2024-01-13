/obj/item/organ/eyes/night_vision
	name = "night vision eyes"
	eye_color = "00FF00"

//removing shity yogs nightvision code from my beloved shadows
/obj/item/organ/eyes/shadow
	flash_protect = -1
	eye_color = "00FF00"
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	sight_flags = SEE_BLACKNESS
	see_in_dark = 8

//okay, they are actual antags, giving them ability to tweak their vision
/obj/item/organ/eyes/night_vision/alien/sling
	desc = "The eyes of a spooky shadowling! Even without their shadowy owner, looking at these eyes gives you a sense of dread."
	icon_state = "burning_eyes"
	eye_color = "BC2828"
	see_in_dark = 9
	sight_flags = SEE_MOBS	//flag from alien eyes, just mention that they have it
	flash_protect = -1

/obj/item/organ/eyes/night_vision/alien/sling/l_shadowling
	eye_color = "6432B7"
	desc = "The eyes of a spooky shadowling! This pair exudes submission." //and breedable. Fuck, god save my soul.