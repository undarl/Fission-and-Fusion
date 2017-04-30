data:extend({
    {
    type = "recipe",
    name = "undarl-make-heavy-water",
    category = "chemistry",
    enabled = true,
    energy_required = 10,
    ingredients =
    {
        {type = "fluid", name = "water", amount = 1200},
    },
    results =
    {
        {type = "fluid", name = "undarl-liquid-heavy-water", amount = 10}
    },
    main_product = "",
    icon = "__undarl-fission-fusion__/graphics/icons/liquid-heavy-water.png",
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
    enabled = true,
    energy_required = 5,
    ingredients =
    {
        {type = "fluid", name = "undarl-liquid-heavy-water", amount = 20},
    },
    results =
    {
        {type = "fluid", name = "undarl-gas-deuterium", amount = 20, temperature = 165}
    },
    main_product = "",
    icon = "__undarl-fission-fusion__/graphics/icons/gas-deuterium.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-z",
    crafting_machine_tint =
    {
        primary = {r = 0.000, g = 0.000, b = 0.600, a = 0.000}, --#000099
        secondary = {r = 0.000, g = 0.000, b = 0.600, a = 0.000}, --#000099
        tertiary = {r = 0.800, g = 0.898, b = 1.000, a = 0.000}, --#CCE5FF
    }
},
})
