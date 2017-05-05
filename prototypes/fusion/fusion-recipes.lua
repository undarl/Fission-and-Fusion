data:extend(
	{
		{
			type = "recipe",
			name = "undarl-make-heavy-water",
			category = "chemistry",
			enabled = false,
			energy_required = 10,
			ingredients =
			{
				{type = "fluid", name = "water", amount = 1000},
			},
			results =
			{
				{type = "fluid", name = "undarl-liquid-heavy-water", amount = 10}
			},
			main_product = "",
			icon = "__Fission and Fusion__/graphics/icons/liquid-heavy-water.png",
			subgroup = "fluid-recipes",
			order = "b[fluid-chemistry]-y",
			crafting_machine_tint =
			{
				primary = {r = 0.400, g = 0.400, b = 1.000, a = 0.000}, --#6666FF
				secondary = {r = 0.400, g = 0.400, b = 1.000, a = 0.000}, --#6666FF
				tertiary = {r = 0.000, g = 0.000, b = 0.600, a = 0.000}, --#000099
			}
		},
		{
			type = "recipe",
			name = "undarl-make-deuterium",
			category = "chemistry",
			enabled = false,
			energy_required = 5,
			ingredients =
			{
				{type = "fluid", name = "undarl-liquid-heavy-water", amount = 20},
			},
			results =
			{
				{type = "fluid", name = "undarl-gas-deuterium", amount = 20}
			},
			main_product = "",
			icon = "__Fission and Fusion__/graphics/icons/gas-deuterium.png",
			subgroup = "fluid-recipes",
			order = "b[fluid-chemistry]-z",
			crafting_machine_tint =
			{
				primary = {r = 0.000, g = 0.000, b = 0.600, a = 0.000}, --#000099
				secondary = {r = 0.000, g = 0.000, b = 0.600, a = 0.000}, --#000099
				tertiary = {r = 0.800, g = 0.898, b = 1.000, a = 0.000}, --#CCE5FF
			}
		},
		{
			type = "recipe",
			name = "undarl-fusion-generator",
			enabled = false,
			ingredients = {{"iron-gear-wheel", 50}, {"copper-plate", 50}, {"pipe", 20}},
			result = "undarl-fusion-generator"
		},
		{
			type = "recipe",
			name = "undarl-deuterium-pellets",
			category = "chemistry",
			energy_required = 5,
			enabled = true,
			--Deuterium gas at working (max) temperature has an energy of 13.35MJ/unit
			--Multiply by 6 to get 80MJ for pellets
			ingredients =
			{
				{type = "fluid", name = "undarl-gas-deuterium", amount = 60},
			},
			result = "undarl-deuterium-pellets",
			result_count = 10
		},
		{
			type = "recipe",
			name = "undarl-fusion-reactor",
			energy_required = 4,
			enabled = false,
			ingredients =
			{
				{"concrete", 500},
				{"steel-plate", 500},
				{"advanced-circuit", 500},
				{"copper-plate", 500},
			},
			result = "undarl-fusion-reactor"
		},
	}
)
