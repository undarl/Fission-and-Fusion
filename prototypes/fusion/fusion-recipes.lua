local recipemap =
{
	["40MW"] = 80,
	["60MW"] = 120,
	["80MW"] = 160,
}

local PELLET_COST = recipemap[settings.startup['undarl-reactor-output'].value]

data:extend(
	{
		{
			type = "recipe",
			name = "undarl-distill-heavy-water",
			category = "chemistry",
			enabled = false,
			energy_required = 4,
			ingredients =
			{
				{type = "fluid", name = "water", amount = 1000},
			},
			results =
			{
				{type = "fluid", name = "undarl-liquid-heavy-water", amount = 10}
			},
			main_product = "",
			icon = "__Fission-and-Fusion__/graphics/icons/liquid-heavy-water.png",
			icon_size = 32,
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
			name = "undarl-heavy-water-h2s-exchange",
			category = "chemistry",
			enabled = false,
			energy_required = 2,
			ingredients =
			{
				{type = "fluid", name = "water", amount = 1000},
				{"sulfur", 1},
			},
			results =
			{
				{type = "fluid", name = "undarl-liquid-heavy-water", amount = 10}
			},
			main_product = "",
			icon = "__Fission-and-Fusion__/graphics/icons/liquid-heavy-water.png",
			icon_size = 32,
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
			energy_required = 2,
			ingredients =
			{
				{type = "fluid", name = "undarl-liquid-heavy-water", amount = 20},
			},
			results =
			{
				{type = "fluid", name = "undarl-gas-deuterium", amount = 20}
			},
			main_product = "",
			icon = "__Fission-and-Fusion__/graphics/icons/gas-deuterium.png",
			icon_size = 32,
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
			name = "undarl-deuterium-pellets",
			category = "chemistry",
			energy_required = 4,
			enabled = false,
			--Deuterium gas at working (max) temperature has an energy of 10MJ/unit
			ingredients =
			{
				{type = "fluid", name = "undarl-gas-deuterium", amount = PELLET_COST},
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
				{"processing-unit", 200},
				{"copper-cable", 1000},
			},
			result = "undarl-fusion-reactor"
		},
		{
			type = "recipe",
			name = "undarl-fusion-generator",
			enabled = false,
			ingredients =
			{
				{"concrete", 125},
				{"steel-plate", 125},
				{"processing-unit", 100},
				{"copper-cable", 300},
			},
			result = "undarl-fusion-generator"
		},
		{
			type = "recipe",
			name = "undarl-pressure-cylinder",
			energy_required = 1,
			enabled = false,
			ingredients =
			{
				{type = "item", name = "steel-plate", amount = 2},
			},
			result = "undarl-pressure-cylinder",
			result_count = 1
		},
		{
			type = "recipe",
			name = "undarl-deuterium-pressure-cylinder",
			category = "crafting-with-fluid",
			energy_required = 5,
			enabled = false,
			ingredients =
			{
				{type = "item", name = "undarl-pressure-cylinder", amount = 1},
				{type = "fluid", name = "undarl-gas-deuterium", amount = 250},
			},
			result = "undarl-deuterium-pressure-cylinder",
			result_count = 1
		},
		{
			type = "recipe",
			name = "undarl-empty-deuterium-pressure-cylinder",
			icon = "__Fission-and-Fusion__/graphics/icons/empty-deuterium-pressure-cylinder.png",
			icon_size = 32,
			category = "crafting-with-fluid",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-z-b",
			energy_required = 5,
			enabled = false,
			allow_decomposition = false,
			ingredients =
			{
				{type = "item", name = "undarl-deuterium-pressure-cylinder", amount = 1},
			},
			results =
			{
				{type = "item", name = "undarl-pressure-cylinder", amount = 1},
				{type = "fluid", name = "undarl-gas-deuterium", amount = 250},
			}
		},
	}
)

return {
	collect_intermediate_recipes = function (intermediate_recipes)
		if settings.startup['undarl-enable-fusion-productivity'].value then
			-- these are technically all intermediate recipes, but deuterium is probably cheap enough already...
			intermediate_recipes["undarl-distill-heavy-water"] = true
			intermediate_recipes["undarl-heavy-water-h2s-exchange"] = true
			intermediate_recipes["undarl-make-deuterium"] = true
			intermediate_recipes["undarl-deuterium-pellets"] = true
		end
		intermediate_recipes["undarl-pressure-cylinder"] = true
	end
}
