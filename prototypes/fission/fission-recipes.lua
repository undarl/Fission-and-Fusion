data:extend(
	{
		{
			type = "recipe",
			name = "undarl-portable-uranium-fuel-cell",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"iron-plate", 2},
				{"uranium-235", 1},
				{"uranium-238", 4}
			},
			result = "undarl-portable-uranium-fuel-cell",
			result_count = 20
		},
		{
			type = "recipe",
			name = "undarl-reprocess-portable-uranium-cell",
			energy_required = 30,
			enabled = false,
			category = "centrifuging",
			ingredients = {{"undarl-depleted-uranium-fuel-cell", 10}},
			icon = "__Fission and Fusion__/graphics/icons/reprocess-portable-uranium-cell.png",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]-m",
			main_product = "",
			results =
			{
				{
					name = "uranium-238",
					probability = 0.75,
					amount = 1
				}
			}
		},
		{
			type = "recipe",
			name = "undarl-fission-reactor-equipment",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"plastic-bar", 15},
				{"steel-plate", 10},
				{"advanced-circuit", 10},
				{"copper-cable", 20},
			},
			result = "undarl-fission-reactor-equipment",
		},
})
