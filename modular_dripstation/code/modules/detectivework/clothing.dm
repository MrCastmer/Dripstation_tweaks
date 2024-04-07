/obj/item/clothing/gloves
	var/gunshot_residue //Used by forensics.

// Aurora forensics port.
/obj/item/clothing/gloves/clean_blood()
	. = ..()
	gunshot_residue = null