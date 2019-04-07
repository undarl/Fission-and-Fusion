data:extend(
	{
		{
			type = "technology",
			name = "undarl-fusion",
			icon = "__Fission and Fusion__/graphics/fusion_power.png",
			icon_size = 256,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "undarl-distill-heavy-water",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-heavy-water-h2s-exchange",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-make-deuterium",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-deuterium-pellets",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-fusion-reactor",
				}
			},
			prerequisites = {"nuclear-power"},
			unit =
			{
				count = 1000,
				ingredients = {
					{"automation-science-pack", 2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack", 2},
					{"production-science-pack", 2},
					{"utility-science-pack", 2},
					{"space-science-pack", 1}
				},
				time = 30
			},
		},
		{
			type = "technology",
			name = "undarl-advanced-fusion",
			icon = "__Fission and Fusion__/graphics/advanced_fusion.png",
			icon_size = 256,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "undarl-fusion-generator",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-pressure-cylinder",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-deuterium-pressure-cylinder",
				},
				{
					type = "unlock-recipe",
					recipe = "undarl-empty-deuterium-pressure-cylinder",
				},

			},
			prerequisites = {"undarl-fusion"},
			unit =
			{
				count = 1000,
				ingredients = {
					{"automation-science-pack", 3},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 3},
					{"production-science-pack", 3},
					{"utility-science-pack", 3},
					{"space-science-pack", 1}
				},
				time = 30
			},
		},
})
