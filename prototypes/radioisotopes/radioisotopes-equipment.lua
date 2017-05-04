data:extend(
	{
		{
			type = "generator-equipment",
			name = "undarl-rtg-equipment",
			sprite =
			{
				filename = "__Fission and Fusion__/graphics/rtg.png",
				width = 128,
				height = 128,
				priority = "medium"
			},
			shape =
			{
				width = 2,
				height = 2,
				type = "full"
			},
			energy_source =
			{
				type = "electric",
				usage_priority = "primary-output"
			},
			power = "75kW",
			categories = {"armor"}
		},
})
