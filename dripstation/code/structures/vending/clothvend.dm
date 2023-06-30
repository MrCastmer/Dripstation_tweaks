/obj/machinery/vending/hatdispenser
	name = "\improper Hatlord 9000"
	desc = "It doesn't seem the slightest bit unusual. This frustrates you immensely."
	icon_state = "hats"
	icon_deny = "hats-deny"
	icon_vend = "hats-vend"
	product_slogans = "From the people that brought you collectable hat crates, Hatlord!;Who doesn't love spending cash on hats?!"
	product_ads = "Warning, not all hats are dog/monkey compatible.;Apply forcefully with care.;Apply directly to the forehead."	
	products = list(/obj/item/clothing/head/beanie = 3,
			        /obj/item/clothing/head/beanie/black = 3,
		            /obj/item/clothing/head/beanie/red = 3,
					/obj/item/clothing/head/beanie/green = 3,
					/obj/item/clothing/head/beanie/darkblue = 3,
					/obj/item/clothing/head/beanie/purple = 3,
					/obj/item/clothing/head/beanie/yellow = 3,
					/obj/item/clothing/head/beanie/orange = 3,
					/obj/item/clothing/head/beanie/cyan = 3,
					/obj/item/clothing/head/beanie/christmas = 3,
					/obj/item/clothing/head/beanie/striped = 3,
					/obj/item/clothing/head/beanie/stripedred = 3,
					/obj/item/clothing/head/beanie/stripedblue = 3,
					/obj/item/clothing/head/beanie/stripedgreen = 3,
					/obj/item/clothing/head/kippah = 3,
					/obj/item/clothing/head/taqiyahred = 3,
					/obj/item/clothing/head/yogs/fez = 3,
					/obj/item/clothing/head/yogs/ballhat = 3,
					/obj/item/clothing/head/beret = 3,
					/obj/item/clothing/head/beret/archaic = 3,					
					/obj/item/clothing/head/flatcap = 3,													
					/obj/item/clothing/head/yogs/boater = 3)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool = 1,
		              /obj/item/clothing/under/yogs/soviet_dress_uniform = 1)
	premium = list(/obj/item/clothing/head/fedora/brown = 1,
					/obj/item/clothing/head/fedora = 1,
					/obj/item/clothing/head/that = 1,					
					/obj/item/clothing/head/yogs/truecowboy = 1,
					/obj/item/clothing/head/yogs/truecowboy2 = 1)
	refill_canister = /obj/item/vending_refill/hatdispenser
	light_mask = "hats-light-mask"

/obj/item/vending_refill/hatdispenser
	machine_name = "\improper Hatlord 9000"
	icon_state = "refill_clothes"

/obj/machinery/vending/shoedispenser
	name = "\improper Shoelord 9000"
	desc = "Wow, hatlord looked fancy, suitlord looked streamlined, and this is just normal. The guy who designed these must be an idiot."
	icon_state = "shoes"
	icon_deny = "shoes-deny"
	icon_vend = "shoes-vend"	
	product_slogans = "Put your foot down!;NO PLEASE WILLY, DONT HURT ME- *BZZT*,One size fits all!"
	product_ads = "IM WALKING ON SUNSHINE!;No hobbits allowed."
	products = list(/obj/item/clothing/shoes/sneakers/white = 5,
					/obj/item/clothing/shoes/sneakers/black = 5,
					/obj/item/clothing/shoes/sneakers/red = 5,
					/obj/item/clothing/shoes/sneakers/orange = 5,
					/obj/item/clothing/shoes/sneakers/brown = 5,
					/obj/item/clothing/shoes/sneakers/yellow = 5,
					/obj/item/clothing/shoes/sneakers/green = 5,
					/obj/item/clothing/shoes/sneakers/blue = 5,
					/obj/item/clothing/shoes/sneakers/purple = 5,
					/obj/item/clothing/shoes/fire_crocs = 3,
					/obj/item/clothing/shoes/sandal = 3,
					/obj/item/clothing/shoes/sandal/white = 3,
					/obj/item/clothing/shoes/xeno_wraps = 5,
					/obj/item/clothing/shoes/winterboots = 2)
	contraband = list(/obj/item/clothing/shoes/drip = 1,
					/obj/item/clothing/shoes/russian = 1)
	premium = list(/obj/item/clothing/shoes/sneakers/rainbow = 1,
					/obj/item/clothing/shoes/cowboy = 2,
					/obj/item/clothing/shoes/cowboy/white = 2,
					/obj/item/clothing/shoes/cowboy/black = 2,
					/obj/item/clothing/shoes/cowboy/lizard = 2,
					/obj/item/clothing/shoes/laceup = 2,
					/obj/item/clothing/shoes/laceup/brown = 2,
					/obj/item/clothing/shoes/laceup/grey = 2)
	refill_canister = /obj/item/vending_refill/clothing
	light_mask = "shoes-light-mask"		

/obj/item/vending_refill/shoedispenser
	machine_name = "Shoelord 9000"
	icon_state = "refill_clothes"	

/obj/machinery/vending/suitdispenser
	name = "\improper Suitlord 9000"
	desc = "You wonder for a moment why all of your shirts and pants come conjoined. This hurts your head and you stop thinking about it."
	icon_state = "suits"
	icon_deny = "suits-deny"
	icon_vend = "suits-vend"		
	product_slogans = "Pre-Ironed, Pre-Washed, Pre-Wor-*BZZT*;Blood of your enemies washes right out!;Dont carry your size? How about you shave off some pounds you fat lazy- *BZZT*"
	product_ads = "Look dapper! Look like an idiot!; Who are YOU wearing?"
	products = list(/obj/item/clothing/under/color/white = 5,
					/obj/item/clothing/under/skirt/color/white = 5,
					/obj/item/clothing/under/color/grey = 5,
					/obj/item/clothing/under/skirt/color/grey = 5,
					/obj/item/clothing/under/color/black = 5,
					/obj/item/clothing/under/skirt/color/black = 5,
					/obj/item/clothing/under/color/pink = 5,
					/obj/item/clothing/under/skirt/color/pink = 5,
					/obj/item/clothing/under/color/maroon = 5,
					/obj/item/clothing/under/skirt/color/maroon = 5,
					/obj/item/clothing/under/color/red = 5,
					/obj/item/clothing/under/skirt/color/red = 5,
					/obj/item/clothing/under/color/orange = 5,
					/obj/item/clothing/under/skirt/color/orange = 5,
					/obj/item/clothing/under/color/brown = 5,
					/obj/item/clothing/under/skirt/color/brown = 5,
					/obj/item/clothing/under/color/lightbrown = 5,
					/obj/item/clothing/under/skirt/color/lightbrown = 5,
					/obj/item/clothing/under/color/yellow = 5,
					/obj/item/clothing/under/skirt/color/yellow = 5,
					/obj/item/clothing/under/color/green = 5,
					/obj/item/clothing/under/skirt/color/green = 5,
					/obj/item/clothing/under/color/darkgreen = 5,
					/obj/item/clothing/under/skirt/color/darkgreen = 5,
					/obj/item/clothing/under/color/teal = 5,
					/obj/item/clothing/under/skirt/color/teal = 5,
					/obj/item/clothing/under/color/blue = 5,
					/obj/item/clothing/under/skirt/color/blue = 5,
					/obj/item/clothing/under/color/darkblue = 5,
					/obj/item/clothing/under/skirt/color/darkblue = 5,
					/obj/item/clothing/under/color/lightpurple = 5,
					/obj/item/clothing/under/skirt/color/lightpurple = 5)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool = 1,
					/obj/item/clothing/under/yogs/soviet_dress_uniform = 1) //yogs
	premium = list(/obj/item/clothing/under/color/rainbow = 2) //yogs end
	refill_canister = /obj/item/vending_refill/clothing
	light_mask = "suits-light-mask"	

/obj/item/vending_refill/suitdispenser
	machine_name = "Suitlord 9000"
	icon_state = "refill_clothes"	
