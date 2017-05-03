data:extend(
	{
		{
			type = "fuel-category",
			name = "portable-nuclear"
		},
		{
			type = "generator-equipment",
			name = "undarl-fission-reactor-equipment",
			sprite =
			{
				filename = "__undarl-fission-fusion__/graphics/fission-reactor-equipment.png",
				width = 128,
				height = 128,
				priority = "medium"
			},
			shape =
			{
				width = 4,
				height = 4,
				type = "full"
			},
			energy_source =
			{
				type = "burner",
				usage_priority = "primary-output"
			},
			burner =
			{
				fuel_category = "portable-nuclear",
				effectivity = 1,
				fuel_inventory_size = 1,
				burnt_inventory_size = 1
			},
			power = "750kW",
			categories = {"armor"}
		},
		{
			type = "generator-equipment",
			name = "undarl-rtg-equipment",
			sprite =
			{
				filename = "__undarl-fission-fusion__/graphics/rtg.png",
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
