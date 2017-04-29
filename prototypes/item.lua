data:extend(
{
	{
    type = "fluid",
    name = "undarl-liquid-heavy-water",
    icon = "__undarl-fission-fusion__/graphics/icons/liquid-heavy-water.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0, g = 0, b = 153},
    flow_color = {r = 0, g = 0, b = 153},
    max_temperature = 500,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
	},
	{
    type = "fluid",
    name = "undarl-gas-deuterium",
    icon = "__undarl-fission-fusion__/graphics/icons/gas-deuterium.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 204, g = 229, b = 255},
    flow_color = {r = 204, g = 229, b = 255},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
	},
})
