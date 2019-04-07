data:extend(
	{
		{
			type = "technology",
			name = "undarl-radioisotopes",
			icon = "__Fission and Fusion__/graphics/rtg-tech.png",
			icon_size = 256,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "undarl-rtg-equipment",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-fast-rtg-equipment",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-rtg-array",
				}
			},
			prerequisites = {"nuclear-fuel-reprocessing"},
			unit =
			{
				count = 500,
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1}
				},
				time = 30
			},
		},
})
