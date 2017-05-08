data:extend(
	{
		{
			type = "generator-equipment",
			name = "undarl-fission-reactor-equipment",
			sprite =
			{
				filename = "__Fission and Fusion__/graphics/fission-reactor-equipment.png",
				width = 128,
				height = 128,
				priority = "medium"
			},
			shape =
			{
				width = 3,
				height = 3,
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
			power = "500kW",
			categories = {"armor"}
		},
})
