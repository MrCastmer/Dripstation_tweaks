/datum/stack_recipe/radial
	/// Optional info to be shown on the radial option for this item
	var/desc

/datum/stack_recipe/radial/New(
	title,
	result_type,
	req_amount = 1,
	res_amount = 1,
	max_res_amount = 1,
	time = 0,
	one_per_turf = FALSE,
	on_solid_ground = FALSE,
	on_tram = FALSE,
	window_checks = FALSE,
	placement_checks = NONE,
	applies_mats = FALSE,
	trait_booster,
	trait_modifier = 1,
	desc,
	required_noun,
	category,
)
	if(category)
		src.category = category
	if(desc)
		src.desc = desc
	if(required_noun)
		src.desc += span_boldnotice("[desc ? " - ":""]Requires: [req_amount] [required_noun]\s.")

	return ..()