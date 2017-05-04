data:extend(
    {
        --FLUIDS
        {
            type = "fluid",
            name = "undarl-liquid-heavy-water",
            default_temperature = 15,
            max_temperature = 1000,
            heat_capacity = "0.2KJ",
            temperature_dependent =
            {
                {
                    max = 100,
                    localised_name = "fluid-name.undarl-liquid-heavy-water"
                },
                {
                    min = 100,
                    localised_name = "fluid-name.undarl-gas-heavy-steam",
                    icon = "__base__/graphics/icons/fluid/steam.png",
                    base_color = {r = 0.5, g = 0.5, b = 0.5},
                    flow_color = {r = 1.0, g = 1.0, b = 1.0}
                }
            },
            base_color = {r = 0, g = 0, b = 0.6},
            flow_color = {r = 0, g = 0, b = 0.6},
            icon = "__Fission and Fusion__/graphics/icons/liquid-heavy-water.png",
            order = "a[fluid]-a[water]",
            pressure_to_speed_ratio = 0.4,
            flow_to_energy_ratio = 0.59,
            gas_temperature = 100
        },
        {
            type = "fluid",
            name = "undarl-gas-deuterium",
            default_temperature = 15,
            max_temperature = 20,
            --heat_capacity should be 2.67MJ if the generator bug gets fixed
            heat_capacity = "0.2KJ",
            base_color = {r = 0.8, g = 0.9, b = 1.0},
            flow_color = {r = 0.8, g = 0.9, b = 1.0},
            icon = "__Fission and Fusion__/graphics/icons/gas-deuterium.png",
            order = "a[fluid]-a[water]",
            pressure_to_speed_ratio = 0.4,
            flow_to_energy_ratio = 0.59,
            gas_temperature = 15
        },
})
