data:extend(
	{
		{
			type = "technology",
			name = "undarl-portable-reactors",
			icon = "__Fission and Fusion__/graphics/fission-reactor-equipment.png",
			icon_size = 128,
			--icon = "__base__/graphics/technology/kovarex-enrichment-process.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "undarl-fission-reactor-equipment",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-portable-nuclear-fuel-cell",
				}
			},
			prerequisites = {"modular-armor", "nuclear-power"},
			unit =
			{
				count = 100,
				ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},
				time = 30
			},
			--order = "g-a-c"
		},
})
