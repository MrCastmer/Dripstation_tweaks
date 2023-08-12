/obj/item/gun/ballistic/rifle/boltaction/brand_new
	desc = "A brand new Mosin Nagant issued by Nanotrasen for their interns. You would rather not to damage it."
	can_be_sawn_off = FALSE

/obj/item/gun/ballistic/rifle/boltaction/brand_new/prime
	name = "\improper Regal Nagant"
	desc = "A prized hunting Mosin Nagant. Used for the most dangerous game."
	icon = 'dripstation/icons/obj/weapons/ballistic.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon_state = "mosinprime"
	item_state = "mosinprime"
	can_be_sawn_off = TRUE
	sawn_desc = "A sawn-off Regal Nagant... Doing this was a sin, I hope you're happy. \
		You are now probably one of the few people in the universe to ever hold a \"Regal Obrez\". \
		Even thinking about that name combination makes you ill."

/obj/item/gun/ballistic/rifle/boltaction/brand_new/prime/sawoff(mob/user)
	. = ..()
	if(.)
		name = "\improper Regal Obrez" // wear it loud and proud