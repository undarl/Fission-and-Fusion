data:extend(
    {
        --FLUIDS
        {
            type = "fluid",
            name = "undarl-liquid-heavy-water",
            default_temperature = 15,
            max_temperature = 1000,
            heat_capacity = "0.2KJ",
            base_color = {r = 0, g = 0, b = 0.6},
            flow_color = {r = 0, g = 0, b = 0.6},
            icon = "__Fission and Fusion__/graphics/icons/liquid-heavy-water.png",
            order = "z[fusion-fluids]-a[heavy-water]",
            pressure_to_speed_ratio = 0.4,
            flow_to_energy_ratio = 0.59,
            gas_temperature = 101.4
        },
        {
            type = "fluid",
            name = "undarl-gas-deuterium",
            default_temperature = 15,
            max_temperature = 20,
            heat_capacity = "2.0MJ",
            base_color = {r = 0.8, g = 0.9, b = 1.0},
            flow_color = {r = 0.8, g = 0.9, b = 1.0},
            icon = "__Fission and Fusion__/graphics/icons/gas-deuterium.png",
            order = "z[fusion-fluids]-b[deuterium]",
            pressure_to_speed_ratio = 0.4,
            flow_to_energy_ratio = 0.59,
            gas_temperature = 15
        },
})
