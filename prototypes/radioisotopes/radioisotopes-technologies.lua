data:extend(
	{
		{
			type = "technology",
			name = "undarl-radioisotopes",
			icon = "__Fission and Fusion__/graphics/rtg_tech.png",
			icon_size = 256,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "undarl-rtg-equipment",
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
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1},
					{"production-science-pack", 1}
				},
				time = 30
			},
		},
})
