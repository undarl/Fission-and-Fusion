data:extend(
	{
		{
			type = "fuel-category",
			name = "fusion"
		},
		{
    type = "generator",
    name = "undarl-fusion-generator",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "undarl-fusion-generator"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 10000,
    fluid_usage_per_tick = 0.017,
    maximum_temperature = 20,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { type = "input", position = {0, 3} },
        --{ type = "input", position = {0, -3} },
      },
      production_type = "input"
    },
    fluid_input =
    {
      name = "undarl-gas-deuterium",
      amount = 0.0,
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H.png",
          width = 160,
          height = 123,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(0, -2.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H.png",
            width = 320,
            height = 245,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(0, -2.75),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png",
          width = 217,
          height = 74,
          frame_count = 8,
          line_length = 4,
          draw_as_shadow = true,
          shift = util.by_pixel(28.75, 18),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-H-shadow.png",
            width = 435,
            height = 150,
            frame_count = 8,
            line_length = 4,
            draw_as_shadow = true,
            shift = util.by_pixel(28.5, 18),
            scale = 0.5
          },
        },
      },
    },
    vertical_animation =
    {
     layers =
     {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V.png",
          width = 108,
          height = 173,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(5, 6.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V.png",
            width = 217,
            height = 347,
            frame_count = 8,
            line_length = 4,
            shift = util.by_pixel(4.75, 6.75),
            scale = 0.5
          },
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png",
          width = 151,
          height = 131,
          frame_count = 8,
          line_length = 4,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          hr_version = {
            filename = "__base__/graphics/entity/steam-turbine/hr-steam-turbine-V-shadow.png",
            width = 302,
            height = 260,
            frame_count = 8,
            line_length = 4,
            draw_as_shadow = true,
            shift = util.by_pixel(39.5, 24.5),
            scale = 0.5
          },
        },
      },
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
		{
    type = "reactor",
    name = "undarl-fusion-reactor",
    icon  = "__undarl-fission-fusion__/graphics/icons/fusion-reactor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "undarl-fusion-reactor"},
    max_health = 500,
    corpse = "big-remnants",
    consumption = "40MW",
    burner =
    {
      fuel_category = "fusion",
      effectivity = 0.5,
      fuel_inventory_size = 1,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},

    lower_layer_picture = {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__undarl-fission-fusion__/graphics/fusion-reactor.png",
          width = 160,
          height = 160,
          shift = { -0.03125, -0.1875 },
        },
      }
    },

    working_light_picture =
    {
      filename = "__undarl-fission-fusion__/graphics/fusion-reactor-lights.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive",
    },

    light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      }
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    connection_patches =
    {
      north =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-north.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, -72.5)
      },
      east =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-east.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(72.5, 0)
      },
      south =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-south.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, 72.5)
      },
      west =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-west.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(-72.5, 0)
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
  },
	}
)
