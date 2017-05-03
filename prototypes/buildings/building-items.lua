data:extend(
	{
		{
			type = "item",
			name = "undarl-fusion-generator",
			icon = "__base__/graphics/icons/accumulator.png",
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "b[steam-power]-c[steam-turbine]",
			place_result = "undarl-fusion-generator",
			stack_size = 5
		},
		{
			type = "item",
			name = "undarl-deuterium-pellets",
			icon = "__undarl-fission-fusion__/graphics/icons/deuterium-pellets.png",
			flags = {"goes-to-quickbar"},
			subgroup = "intermediate-product",
		    order = "r[uranium-processing]-d",
		    fuel_category = "fusion",
		    fuel_value = "80MJ",
		    stack_size = 60,
		},
		{
			type = "item",
			name = "undarl-fusion-reactor",
			icon = "__undarl-fission-fusion__/graphics/icons/fusion-reactor.png",
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "b[steam-power]-c[steam-turbine]",
			place_result = "undarl-fusion-reactor",
			stack_size = 5
		},
	}
)
