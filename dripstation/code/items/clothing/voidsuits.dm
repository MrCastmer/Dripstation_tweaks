//////Void suits//////
/obj/item/clothing/head/helmet/space
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70)
	icon_state = "helm-space"
	item_state = "helm-space"

/obj/item/clothing/suit/space
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 70)
	icon_state = "space"
	item_state = "space"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back."


//////EXPLORER NT//////
/obj/item/clothing/head/helmet/space/explorer
	name = "explorer space helmet"
	icon_state = "helm-explorer"
	item_state = "helm-explorer"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The helmet materials seams a bit reinforced."
	armor = list(MELEE = 15, BULLET = 15, LASER = 0, ENERGY = 0, BOMB = 20, BIO = 100, RAD = 70, FIRE = 60, ACID = 65)

/obj/item/clothing/suit/space/explorer
	name = "explorer space suit"
	icon_state = "explorer"
	item_state = "explorer"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. This variation has reinforced bulletproof plating."
	armor = list(MELEE = 25, BULLET = 25, LASER = 0, ENERGY = 0, BOMB = 20, BIO = 100, RAD = 70, FIRE = 60, ACID = 65)


//////PARAMEDIC NT//////
/obj/item/clothing/head/helmet/space/paramedic
	name = "rescue space helmet"
	icon_state = "helm-paramedic"
	item_state = "helm-paramedic"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays."

/obj/item/clothing/suit/space/paramedic
	name = "rescue space suit"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. Seams lightweight."
	icon_state = "paramedic"
	item_state = "paramedic"
	slowdown = 0.7
	w_class = WEIGHT_CLASS_NORMAL


//////HEADS NT//////
/obj/item/clothing/head/helmet/space/heads
	name = "command space helmet"
	icon_state = "helm-command"
	item_state = "helm-command"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. The helmet materials seams reinforced."
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65)

/obj/item/clothing/suit/space/heads
	name = "command space suit"
	icon_state = "command"
	item_state = "command"
	desc = "A suit that protects against low pressure environments. Has a big NT logo on the back. This variation has reinforced seams."
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 10, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65)


//////Space Slav//////
/obj/item/clothing/head/helmet/space/cosmonaut
	icon_state = "helm-cosmonaut"
	item_state = "helm-cosmonaut"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. Has a red star on the forehead."
	armor = list(MELEE = 15, BULLET = 20, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65)

/obj/item/clothing/suit/space/cosmonaut
	icon_state = "cosmonaut"
	item_state = "cosmonaut"
	desc = "A suit that protects against low pressure environments. Seams reinforced. Likely slav-made."
	armor = list(MELEE = 15, BULLET = 20, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 40, ACID = 65)

/obj/item/clothing/head/helmet/space/cosmonaut/combat
	icon_state = "helm-cosmonaut-combat"
	item_state = "helm-cosmonaut-combat"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays. Has a red star on the forehead."
	armor = list(MELEE = 40, BULLET = 50, LASER = 0, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 50, FIRE = 80, ACID = 65)

/obj/item/clothing/suit/space/cosmonaut/combat
	icon_state = "cosmonaut-combat"
	item_state = "cosmonaut-combat
	desc = "A special combat suit that protects against low pressure environments. Lacks laser protection. Has a identification chevron of USSP military forces."
	armor = list(MELEE = 40, BULLET = 50, LASER = 0, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 50, FIRE = 80, ACID = 65)
	slowdown = 0.5


//////Emergency//////
/obj/item/clothing/head/helmet/space/orange
	icon_state = "helm-emergency"
	item_state = "helm-emergency"

/obj/item/clothing/suit/space/orange
	icon_state = "emergency"
	item_state = "emergency"
	slowdown = 2

/obj/item/clothing/head/helmet/space/fragile
	icon_state = "helm-emergency"
	item_state = "helm-emergency"
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 10, FIRE = 0, ACID = 0)

/obj/item/clothing/suit/space/fragile
	icon_state = "emergency"
	item_state = "emergency"
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 10, FIRE = 0, ACID = 0)


//////Syndicate//////
/obj/item/clothing/head/helmet/space/syndicate
	icon_state = "helm-syndicate"
	item_state = "helm-syndicate"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85)

/obj/item/clothing/suit/space/syndicate
	icon_state = "syndicate"
	item_state = "syndicate"
	armor = list(MELEE = 40, BULLET = 50, LASER = 30,ENERGY = 25, BOMB = 30, BIO = 100, RAD = 30, FIRE = 80, ACID = 85)


//Black syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black
	icon_state = "helm-syndicate-black"
	item_state = "helm-syndicate-black"

/obj/item/clothing/suit/space/syndicate/black
	icon_state = "syndicate-black"
	item_state = "syndicate-black"


//Black-red syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/red
	icon_state = "helm-syndicate-black-red"
	item_state = "helm-syndicate-black-red"

/obj/item/clothing/suit/space/syndicate/black/red
	icon_state = "syndicate-black-red"
	item_state = "syndicate-black-red"


//Black medical syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/med
	icon_state = "helm-syndicate-black-med"
	item_state = "helm-syndicate-black-med"

/obj/item/clothing/suit/space/syndicate/black/med
	icon_state = "syndicate-black-med"
	item_state = "syndicate-black-med"


//Black with yellow/red engineering syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate/black/engie
	icon_state = "helm-syndicate-black-engie"
	item_state = "helm-syndicate-black-engie"

/obj/item/clothing/suit/space/syndicate/black/engie
	icon_state = "syndicate-black-engie"
	item_state = "syndicate-black-engie"


//Standart syndicate contract varient
/obj/item/clothing/head/helmet/space/syndicate/contract
	slowdown = 0					//funny, fuck it
	icon_state = "helm-syndicate-contract"
	item_state = "helm-syndicate-contract"

/obj/item/clothing/suit/space/syndicate/contract
	icon_state = "syndicate-contract"
	item_state = "syndicate-contract"





//////Space pirate outfit//////
/obj/item/clothing/head/helmet/space/pirate
	icon_state = "pirate"
	item_state = "pirate"

/obj/item/clothing/head/helmet/space/pirate/bandana
	icon_state = "bandana"
	item_state = "bandana"

/obj/item/clothing/head/helmet/space/pirate/captain
	icon_state = "hgpiratecap"
	item_state = "hgpiratecap"

/obj/item/clothing/suit/space/pirate
	icon_state = "pirate"
	item_state = "pirate"
	slowdown = 0.55

/obj/item/clothing/suit/space/pirate/captain
	icon_state = "hgpirate"
	item_state = "hgpirate"