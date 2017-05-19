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
				priority = "medium",
				hr_version = {
					filename = "__Fission and Fusion__/graphics/fission-reactor-equipment-hr.png",
					width = 256,
					height = 256,
				}
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
				fuel_category = "undarl-portable-nuclear",
				effectivity = 1,
				fuel_inventory_size = 1,
				burnt_inventory_size = 1
			},
			power = "500kW",
			categories = {"armor"}
		},
})
