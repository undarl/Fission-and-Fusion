data:extend(
	{
		{
			type = "item",
			name = "undarl-fusion-generator",
			icon = "__Fission and Fusion__/graphics/icons/fusion-generator.png",
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "z[fusion-power]-b[fusion-generator]",
			place_result = "undarl-fusion-generator",
			stack_size = 5
		},
		{
			type = "item",
			name = "undarl-deuterium-pellets",
			icon = "__Fission and Fusion__/graphics/icons/deuterium-pellets.png",
			flags = {"goes-to-quickbar"},
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-z",
			fuel_category = "fusion",
			--Fuel value calculated from 40MW reactor draw * 50% reactor efficiency
			--with a desired burn rate of 1 pellet per second
			fuel_value = "80MJ",
			stack_size = 60,
		},
		{
			type = "item",
			name = "undarl-fusion-reactor",
			icon = "__Fission and Fusion__/graphics/icons/fusion-reactor.png",
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "z[fusion-power]-a[fusion-reactor]",
			place_result = "undarl-fusion-reactor",
			stack_size = 5
		},
})
