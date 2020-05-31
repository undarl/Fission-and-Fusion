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
            icon_size = 32,
            order = "z[fusion-fluids]-a[heavy-water]",
            gas_temperature = 101.4
        },
        {
            type = "fluid",
            name = "undarl-gas-deuterium",
            default_temperature = 15,
            max_temperature = 1000,
            heat_capacity = "0.0002288J",
            fuel_value = "6.2392J",
            base_color = {r = 0.8, g = 0.9, b = 1.0},
            flow_color = {r = 0.8, g = 0.9, b = 1.0},
            icon = "__Fission and Fusion__/graphics/icons/gas-deuterium.png",
            icon_size = 32,
            order = "z[fusion-fluids]-b[deuterium]",
            gas_temperature = -252.879
        },
})
