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
