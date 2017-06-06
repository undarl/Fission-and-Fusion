data:extend(
	{
		{
			type = "recipe",
			name = "undarl-rtg-equipment",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"undarl-radioisotopes", 2},
				{"steel-plate", 5},
				{"advanced-circuit", 3},
				{"copper-cable", 5},
			},
			result = "undarl-rtg-equipment",
		},
		{
			type = "recipe",
			name = "undarl-fast-rtg-equipment",
			localised_name = {"equipment-name.undarl-fast-rtg-equipment", 100},
			localised_description = {"item-description.undarl-fast-rtg-equipment", 100},
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"undarl-radioisotopes", 2},
				{"steel-plate", 5},
				{"advanced-circuit", 3},
				{"copper-cable", 5},
			},
			result = "undarl-fast-rtg-equipment-100",
		},
		{
			type = "recipe",
			name = "undarl-fast-rtg-recycling",
			icon = "__Fission and Fusion__/graphics/icons/fast-rtg-recycle.png",
			category = "chemistry",
			subgroup = "equipment",
			order = "a[energy-source]-c",
			energy_required = 30,
			enabled = false,
			ingredients =
			{
				{"undarl-fast-rtg-equipment-10", 1},
			},
			results =
			{
				{name = "steel-plate", amount_min = 2, amount_max = 3},
				{name = "advanced-circuit", amount_min = 1, amount_max = 2},
				{name = "copper-cable", amount_min = 2, amount_max = 3},
			}
		},
		{
			type = "recipe",
			name = "undarl-rtg-array",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"undarl-rtg-equipment", 10},
				{"steel-plate", 10},
				{"copper-cable", 10},
			},
			result = "undarl-rtg-array"
		},
})
