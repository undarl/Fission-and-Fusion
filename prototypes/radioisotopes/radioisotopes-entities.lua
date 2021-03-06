data:extend(
	{
		{
			type = "electric-energy-interface",
			name = "undarl-rtg-array",
			icon = "__Fission-and-Fusion__/graphics/icons/rtg-array.png",
			icon_size = 32,
			flags = {"placeable-neutral", "player-creation"},
			minable = {hardness = 0.2, mining_time = 0.5, result = "undarl-rtg-array"},
			max_health = 150,
			corpse = "medium-remnants",
			collision_box = {{ -0.8, -0.8}, {0.8, 0.8}},
			selection_box = {{ -1, -1}, {1, 1}},
			energy_source =
			{
				type = "electric",
				buffer_capacity = "300kJ",
				usage_priority = "primary-output",
				input_flow_limit = "0kW",
				output_flow_limit = "300kW",
				emissions = 0.01,
				render_no_power_icon = false,
			},
			energy_production = "300kW",
			energy_usage = "0kW",
			picture =
			{
				filename = "__Fission-and-Fusion__/graphics/rtg-array.png",
				priority = "extra-high",
				width = 75,
				height = 62,
				shift = util.by_pixel(5.5, -1.5),
			},
		},
})
