data:extend(
	{
		{
			type = "recipe",
			name = "undarl-portable-nuclear-fuel-cell",
			energy_required = 10,
			enabled = true,
			ingredients =
			{
				{"iron-plate", 5},
				{"plastic-bar", 2},
				{"uranium-235", 1},
				{"uranium-238", 10}
			},
			result = "undarl-portable-nuclear-fuel-cell",
			result_count = 20
		},
		{
			type = "recipe",
			name = "undarl-reprocess-portable-cell",
			energy_required = 50,
			enabled = true,
			category = "centrifuging",
			ingredients = {{"undarl-depleted-fuel-cell", 10}},
			icon = "__undarl-fission-fusion__/graphics/icons/reprocess-portable-cell.png",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]",
			main_product = "",
			results =
			{
				{
					name = "uranium-238",
					amount = 2
				}
			}
		},
		{
			type = "recipe",
			name = "undarl-fission-reactor-equipment",
			energy_required = 10,
			enabled = true,
			ingredients =
			{
				{"plastic-bar", 10},
				{"steel-plate", 10},
				{"advanced-circuit", 10},
				{"copper-plate", 10},
			},
			result = "undarl-fission-reactor-equipment"
		},
})
