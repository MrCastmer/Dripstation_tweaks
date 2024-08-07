/obj/projectile/energy/bolt/large //big ebow bolts
	name = "large bolt"
	icon_state = "cbbolt"
	irradiate = 300
	pass_flags = PASSGLASS

/obj/projectile/energy/bolt/on_hit(atom/target, blocked = FALSE)
	..()
	if(ishuman(target))
		target.reagents.add_reagent(/datum/reagent/toxin/relaxant, 8)
		target.reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 8)
		target.reagents.add_reagent(/datum/reagent/toxin/anacea, 6)
