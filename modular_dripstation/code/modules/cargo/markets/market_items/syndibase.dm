/datum/market_item/syndibase
	/// Is it available? Probably yes.
	availability_prob = 100
	/// CARGO_CRATE_VALUE = 200
	price = CARGO_CRATE_VALUE
	/// Keep it 1, if you wand it unlimited
	stock = 1
	/// It`s unlimited
	limitedstock = 0
	/// Your crate name
	var/crate_name
	/// Your crate type
	item
	/// Contains of that crate type
	var/list/contains = null
	/// Our access needed to open
	var/access = FALSE
	/// Any of the accesses needed to open
	var/access_any = FALSE
	markets = list(/datum/market/syndicatecargo)

/datum/market_item/syndibase/spawn_item(loc)
	var/obj/structure/closet/crate/C = new item(loc)
	C.name = crate_name
	if(access)
		C.req_access = list(access)
	if(access_any)
		C.req_one_access = access_any
	fill(C)
	return C

/datum/market_item/syndibase/proc/fill(obj/structure/closet/crate/C)
	for(var/thing in contains)
		new thing(C)

/datum/market_item/syndibase/emergency
	category = "Emergency"

/datum/market_item/syndibase/emergency/evac
	name = "Emergency Equipment Crate"
	desc = "When you need some air."
	contains = list(/mob/living/simple_animal/bot/floorbot,
					/mob/living/simple_animal/bot/floorbot,
					/mob/living/simple_animal/bot/medbot,
					/mob/living/simple_animal/bot/medbot,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/grenade/gas_crystal/pluonium_crystal,
					/obj/item/grenade/gas_crystal/pluonium_crystal)
	price = CARGO_CRATE_VALUE * 1.5
	item = /obj/structure/closet/crate/internals
	crate_name = "emergency crate"