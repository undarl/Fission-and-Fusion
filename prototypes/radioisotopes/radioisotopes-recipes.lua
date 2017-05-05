data:extend(
	{
		{
			type = "recipe",
			name = "undarl-reprocess-radioisotope",
			energy_required = 50,
			enabled = false,
			category = "centrifuging",
			ingredients = {{"used-up-uranium-fuel-cell", 5}},
			icon = "__Fission and Fusion__/graphics/icons/cell-to-radioisotope.png",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-b",
			main_product = "",
			results =
			{
				{
					name = "undarl-radioisotopes",
					probability = 0.75,
					amount = 1
				},
				{
					name = "uranium-238",
					amount = 2
				}
			}
		},
		{
			type = "recipe",
			name = "undarl-portable-reprocess-radioisotope",
			energy_required = 50,
			enabled = false,
			category = "centrifuging",
			ingredients = {{"undarl-depleted-fuel-cell", 10}},
			icon = "__Fission and Fusion__/graphics/icons/portable-cell-to-radioisotope.png",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-c",
			main_product = "",
			results =
			{
				{
					name = "undarl-radioisotopes",
					probability = 0.5,
					amount = 0.5
				},
				{
					name = "uranium-238",
					amount = 1
				}
			}
		},
		{
			type = "recipe",
			name = "undarl-rtg-equipment",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"undarl-radioisotopes", 2},
				{"steel-plate", 10},
				{"advanced-circuit", 5},
				{"copper-cable", 10},
			},
			result = "undarl-rtg-equipment",
		},
		{
			type = "recipe",
			name = "undarl-rtg-array",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"undarl-rtg-equipment", 14},
				{"steel-plate", 5}
			},
			result = "undarl-rtg-array"
		},
})
