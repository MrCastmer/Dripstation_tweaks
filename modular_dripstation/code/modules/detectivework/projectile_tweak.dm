/obj/item/ammo_casing
	var/leaves_residue   //leaves gunpowder in hands?

/obj/item/ammo_casing/proc/leave_residue(mob/living/carbon/human/H)
	for(H)
		if(H.gloves && istype(H.gloves, /obj/item/clothing/gloves))
			var/obj/item/clothing/gloves/G = H.gloves
			G.gunshot_residue = caliber
		else
			H.gunshot_residue = caliber

/obj/item/ammo_casing/magic
	leaves_residue = FALSE

/obj/item/ammo_casing/energy
	leaves_residue = FALSE