// ###### HOP ######
/obj/item/clothing/under/rank/head_of_personnel
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/hop.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/hop.dmi'

/obj/item/clothing/under/rank/head_of_personnel/skirt
	can_adjust = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/dress
	name = "head of personnel's dress"
	icon_state = "hop_dress"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/paradefancy
	name = "head of personnel's fancy uniform"
	desc = "For these special occasions when paperwork can wait."
	icon_state = "hopwhimsy"
	item_state = "hopwhimsy"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/parade
	name = "head of personnel's parade uniform"
	desc = "A luxurious uniform for the head of personnel, woven in a deep blue. On the lapel is a small pin in the shape of a corgi's head."
	icon_state = "hop_parade_male"
	can_adjust = FALSE

/obj/item/clothing/under/rank/head_of_personnel/parade/skirt
	name = "head of personnel's parade skirt"
	icon_state = "hop_parade_female"	
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/head_of_personnel/turtleneck
	name = "head of personnel's turtleneck"
	desc = "A dark teal turtleneck and black khakis, for a second with a superior sense of style."
	icon_state = "hopturtle"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/head_of_personnel/turtleneck/alt
	icon_state = "hopturtle_alt"

/obj/item/clothing/under/rank/head_of_personnel/turtleneck/skirt
	name = "head of personnel's turtleneck skirt"
	desc = "A dark teal turtleneck and tanblack khaki skirt, for a second with a superior sense of style."
	icon_state = "hopturtle_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/under/rank/head_of_personnel/skirt/secretary
	name = "head of personnel's secretary skirt"
	icon_state = "hop_secretary"

/obj/item/clothing/shoes/leather
	name = "leather shoes"
	desc = "A sturdy pair of fancy handmade leather shoes."
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'	
	icon_state = "leather"

/obj/item/clothing/head/hooded/winterhood/hop/formal
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "winterhood_hopformal"

/obj/item/clothing/suit/hooded/wintercoat/hop/formal
	name = "head of personnel's formal winter coat"
	desc = "A long cozy winter coat, covered in thick fur. The breast features a proud yellow chevron, reminding everyone that you're the second banana. Someone at CC most really like you, huh?"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "coathopformal"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hop/formal

/obj/item/clothing/suit/armor/vest/hopjacket
	name = "head of personnel's parade jacket"
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	icon_state = "hopformal"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list(MELEE = 10, BULLET = 15, LASER = 15, ENERGY = 25, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 35)
	allowed = list(
		/obj/item/melee/classic_baton,
	)
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/hopjacket/dress
	name = "head of personnel's parade jacket"
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	icon_state = "hopformal_t"

/obj/item/clothing/head/beret/hop
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'	

/obj/item/clothing/suit/armor/vest/alt
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'	

/obj/item/clothing/glasses/hud/personnel
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/glasses_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/glasses_righthand.dmi'	
	icon_state = "sunhudskill"
	item_state = "sunhudskill"

// ###### CAPTAIN ######
/obj/item/clothing/under/rank/captain
	icon = 'modular_dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/uniform/command/captain.dmi'

/obj/item/clothing/under/rank/captain/formal
	name = "captain's formal uniform"
	desc = "Parade version of station captain`s uniform."
	icon_state = "station_captain"
	item_state = "station_captain"

/obj/item/clothing/under/rank/captain/formal/skirt
	name = "captain's formal skirt"
	desc = "Parade version of station captain`s skirt."
	icon_state = "station_captain_skirt"
	item_state = "station_captain_skirt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/captain/kilt
	desc = "Not a skirt, it is, however, armoured and decorated with a tartan sash."
	name = "captain's kilt"
	icon_state = "capkilt"
	item_state = "kilt"

/obj/item/clothing/under/rank/captain/dress
	name = "captain's dress"
	icon_state = "cap_secretary"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/suit/armor/vest/capcarapace
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	item_state = "capcarapace"	

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	name = "captain's bulletproof carapace"
	desc = "A fireproof armored chestpiece reinforced with modern plasceramic plates to provide maximum bullet protection whilst still offering maximum mobility and flexibility. Issued only to the station's finest, although it does chafe your nipples."
	icon_state = "capcarapace_bulletproof"
	body_parts_covered = CHEST|GROIN
	armor = list(MELEE = 30, BULLET = 60, LASER = 30, ENERGY = 10, BOMB = 30, BIO = 0, RAD = 0, FIRE = 100, ACID = 90, WOUND = 15)
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/vest/capcarapace/tunic
	name = "captain's parade tunic"
	desc = "Worn by a Captain to show their class."
	icon_state = "captunic"

/obj/item/clothing/suit/armor/vest/capcarapace/jacket
	name = "captain's jacket"
	icon_state = "capjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/shoes/laceup/brown
	name = "brown laceup shoes"
	icon_state = "oxford_brown"
	item_state = "oxford_brown"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/shoes/laceup/grey
	name = "grey laceup shoes"
	icon_state = "oxford_grey"
	item_state = "oxford_grey"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/shoes/laceup/cap
	name = "command laceup shoes"
	icon_state = "cap_laceups"
	item_state = "cap_laceups"
	icon = 'modular_dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/shoes_righthand.dmi'	

/obj/item/clothing/gloves/color/captain
	icon = 'modular_dripstation/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hands.dmi'

/obj/item/clothing/head/caphat
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/caphat/parade
	icon = 'icons/obj/clothing/hats/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'

/obj/item/clothing/head/beret/captain
	name = "captain's formal beret"
	desc = "If you wanna feel yourself a beet younger."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/bearpelt
	name = "spare bear pelt"
	desc = "It shimmers in the light"
	icon_state = "sparebearpelt"
	icon = 'icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'	

/obj/item/clothing/mask/gas/captain
	name = "captain's gas mask"
	desc = "Nanotrasen cut corners and repainted a spare gas mask, but don't tell anyone."
	icon_state = "gas_cap"
	icon = 'modular_dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 50, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF


////////Formal coat////////
/obj/item/clothing/suit/toggle/capformal
	name = "captain's formal coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "capformal"
	item_state = "capcarapace"	
	blood_overlay_type = "coat"
	icon = 'modular_dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_dripstation/icons/mob/clothing/suits.dmi'
	togglename = "buttons"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	armor = list(MELEE = 40, BULLET = 35, LASER = 40, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 100, ACID = 90, WOUND = 15)
	resistance_flags = FIRE_PROOF
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/suit/toggle/capformal/Initialize(mapload)
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/toggle/capformal/hos
	name = "armored formal coat"
	icon_state = "hos_formal"
	desc = "A formal coat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 20)
	strip_delay = 80
	clothing_flags = THICKMATERIAL

/obj/item/clothing/suit/toggle/capformal/hop
	name = "head of personal's formal coat"
	icon_state = "hop_formal"
	desc = "Lightly armored coat in corporate colors."
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 70, ACID = 90, WOUND = 10)
	allowed = list(
		/obj/item/melee/classic_baton,
	)

/obj/item/clothing/suit/toggle/capformal/centcom
	name = "\improper CentCom formal coat"
	desc = "A CentCom green alteration of the captain's formal coat. Issued only to Nanotrasen's finest!"
	icon_state = "centcom_formal"
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	strip_delay = 80
	clothing_flags = THICKMATERIAL
	blocks_shove_knockdown = TRUE

/obj/item/clothing/suit/toggle/capformal/centcom/alt
	icon_state = "centcom_formalalt"
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/suit/toggle/capformal/centcom/soo
	name = "special operations officer`s coat"
	desc = "Highly protective armor with bluespace enhanced plaskevlar plating stylized as a leather coat. Has special operations officer insignia attached to it."
	icon_state = "soo_coat"
	item_state = "detective"
	armor = list(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 35)
	slowdown = -0.2
	mutantrace_variation = NO_MUTANTRACE_VARIATION	