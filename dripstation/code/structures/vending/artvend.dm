/obj/machinery/vending/artvend
	name = "\improper ArtVend"
	desc = "A vending machine for art supplies."
	product_slogans = "Don't be a starving artist, use ArtVend.;Color the floors with crayons, not blood!Don't fart, do art!;Stop by for all your artistic needs!"
	product_ads = "Just like Kindergarten!;Now with 1000% more vibrant colors!;Screwing with the janitor was never so easy!;Creativity is at the heart of every spessman."
	icon_state = "artvend"
	icon_deny = "artvend-deny"
	icon_vend = "artvend-vend"
	light_mask = "artvend-light-mask"
	products = list(/obj/item/stack/cable_coil/random = 12,
					/obj/item/camera = 4,
					/obj/item/camera_film = 6,
					/obj/item/storage/photo_album = 2,
					/obj/item/stack/wrapping_paper = 4,
					/obj/item/stack/packageWrap = 4,
					/obj/item/c_tube = 10,
					/obj/item/hand_labeler = 4,
					/obj/item/clipboard = 2,
					/obj/item/storage/crayons = 4,
					/obj/item/paint/paint_remover = 2,
					/obj/item/pen = 5,
					/obj/item/pen/blue = 5,
					/obj/item/pen/red = 5,
					/obj/item/poster/random_official = 5)
	premium = list(/obj/item/pen/fountain = 1,
					/obj/item/pen/fourcolor = 1,
					/obj/item/paint/anycolor = 1)	
	contraband = list(/obj/item/toy/crayon/mime = 1,
					/obj/item/toy/crayon/rainbow = 1,
					/obj/item/poster/random_contraband = 5)
	refill_canister = /obj/item/vending_refill/clothing

/obj/machinery/vending/artvend/artist
	req_access = list(ACCESS_ARTIST)
	payment_department = ACCOUNT_SRV	

/obj/item/paint/anycolor
	custom_premium_price = 150

/obj/item/pen/fourcolor
	custom_premium_price = 100

/obj/item/vending_refill/artist
	machine_name = "\improper ArtVend"
	icon_state = "refill_art"
