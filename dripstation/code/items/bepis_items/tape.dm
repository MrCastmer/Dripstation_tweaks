/obj/item/stack/tape/super
	name = "super sticky tape"
	singular_name = "super sticky tape"
	desc = "Quite possibly the most mischevious substance in the galaxy. Use with extreme lack of caution."
	//conferred_embed = EMBED_HARMLESS_SUPERIOR okey it doesn`t work
	//splint_factor = 0.4
	merge_type = /obj/item/stack/tape/super
	//greyscale_colors = "#4D4D4D#75433F"
	tape_gag = /obj/item/clothing/mask/muzzle/tape/super
	removal_time = 2 // 6 seconds i guess
	removal_pain = 3

/obj/item/clothing/mask/muzzle/tape/super
	name = "super tape piece"
	desc = "A piece of tape that can be put over someone's mouth. This one has extra strengh."
	//greyscale_colors = "#4D4D4D"
	strip_delay = 80

/obj/item/stack/tape/pointy
	name = "pointy tape"
	singular_name = "pointy tape"
	desc = "Used for sticking to things for sticking said things inside people."
	//icon_state = "tape_spikes"
	//conferred_embed = EMBED_POINTY
	merge_type = /obj/item/stack/tape/pointy
	//greyscale_config = /datum/greyscale_config/tape/spikes
	//greyscale_colors = "#E64539#808080#AD2F45"
	tape_gag = /obj/item/clothing/mask/muzzle/tape/pointy
	removal_pain = 10

/obj/item/clothing/mask/muzzle/tape/pointy
	name = "pointy tape piece"
	desc = "A piece of tape that can be put over someone's mouth. Looks like it will hurt if this is ripped off."
	icon_state = "tape_piece_spikes"
	//worn_icon_state = "tape_piece_spikes_worn"
	//greyscale_config = /datum/greyscale_config/tape_piece/spikes
	//greyscale_config_worn = /datum/greyscale_config/tape_piece/worn/spikes
	//greyscale_colors = "#E64539#AD2F45"
	//harmful_strip = TRUE
	//stripping_damage = 10