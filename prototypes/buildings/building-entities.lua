data:extend(
	{
		{
			type = "generator",
			name = "undarl-fusion-generator",
			icon = "__undarl-fission-fusion__/graphics/icons/fusion-generator.png",
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 1, result = "undarl-fusion-generator"},
			max_health = 300,
			corpse = "big-remnants",
			dying_explosion = "medium-explosion",
			effectivity = 1,
			fluid_usage_per_tick = 0.5,
			maximum_temperature = 165,
			resistances =
			{
				{
					type = "fire",
					percent = 70
				}
			},
			collision_box = {{ - 1.5, - 1.5}, {1.5, 1.5}},
			selection_box = {{ - 1.7, - 1.7}, {1.7, 1.7}},
			fluid_box =
			{
				base_area = 1,
				base_level = -1,
				pipe_covers = pipecoverspictures(),
				pipe_connections =
				{
					{ type = "input", position = { - 2.1, 0.0} },
					{ type = "input", position = {2.0, 0.0} },
				},
				production_type = "input"
			},
			fluid_input =
			{
				name = "undarl-gas-deuterium",
				amount = 0.0,
				--minimum_temperature = 100,
			},
			energy_source =
			{
				type = "electric",
				usage_priority = "secondary-output"
			},
			horizontal_animation = {
				layers = {
					{
						filename = "__undarl-fission-fusion__/graphics/fusion-generator-horizontal.png",
						priority = "extra-high",
						width = 160,
						height = 160,
						frame_count = 1,
						line_length = 1,
					},
				},
			},
			vertical_animation = {
				layers = {
					{
						filename = "__undarl-fission-fusion__/graphics/fusion-generator-vertical.png",
						priority = "extra-high",
						width = 160,
						height = 160,
						frame_count = 1,
						line_length = 1,
					},
				},
			},
			vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			working_sound =
			{
				sound =
				{
					filename = "__base__/sound/electric-furnace.ogg",
					volume = 0.6
				},
			},
		},
	}
)
