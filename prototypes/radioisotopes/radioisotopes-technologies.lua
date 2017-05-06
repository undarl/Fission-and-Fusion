data:extend(
	{
		{
			type = "technology",
			name = "undarl-radioisotopes",
			icon = "__Fission and Fusion__/graphics/rtg.png",
			icon_size = 128,
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
				count = 100,
				ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
				time = 30
			},
			--order = "g-a-c"
		},
})
