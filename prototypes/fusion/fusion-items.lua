local recipemap =
{
	["40MW"] = "80MJ",
	["60MW"] = "120MJ",
	["80MW"] = "160MJ",
}

local PELLET_VALUE = recipemap[settings.startup['undarl-reactor-output'].value]

data:extend(
	{
		{
			type = "item",
			name = "undarl-fusion-generator",
			icon = "__Fission and Fusion__/graphics/icons/fusion-generator.png",
			icon_size = 32,
			subgroup = "energy",
			order = "z[fusion-power]-b[fusion-generator]",
			place_result = "undarl-fusion-generator",
			stack_size = 5
		},
		{
			type = "item",
			name = "undarl-deuterium-pellets",
			icon = "__Fission and Fusion__/graphics/icons/deuterium-pellets.png",
			icon_size = 32,
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-z-a",
			fuel_category = "undarl-fusion",
			--Fuel value calculated from reactor draw * 50% reactor efficiency
			--with a desired burn rate of 1 pellet per second
			fuel_value = PELLET_VALUE,
			stack_size = 60,
		},
		{
			type = "item",
			name = "undarl-fusion-reactor",
			icon = "__Fission and Fusion__/graphics/icons/fusion-reactor.png",
			icon_size = 32,
			subgroup = "energy",
			order = "z[fusion-power]-a[fusion-reactor]",
			place_result = "undarl-fusion-reactor",
			stack_size = 5
		},
		{
			type = "item",
			name = "undarl-pressure-cylinder",
			icon = "__Fission and Fusion__/graphics/icons/pressure-cylinder.png",
			icon_size = 32,
			subgroup = "intermediate-product",
			order = "d[empty-barrel]-b",
			stack_size = 30
		},
		{
			type = "item",
			name = "undarl-deuterium-pressure-cylinder",
			icon = "__Fission and Fusion__/graphics/icons/deuterium-pressure-cylinder.png",
			icon_size = 32,
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-z-b",
			fuel_category = "undarl-compressed-fusion",
			fuel_value = "2.5GJ",
			burnt_result = "undarl-pressure-cylinder",
			stack_size = 30
		},
})
