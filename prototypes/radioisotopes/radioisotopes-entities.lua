data:extend(
{
	{
    type = "electric-energy-interface",
    name = "undarl-rtg-array",
    icon = "__Fission and Fusion__/graphics/icons/rtg-array.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "undarl-rtg-array"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{- 1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1050kJ",
      usage_priority = "primary-output",
      input_flow_limit = "0kW",
      output_flow_limit = "1050kW",
	  emissions = 0.01,
  	},
	energy_production = "1050kW",
    energy_usage = "0kW",
    picture =
    {
      filename = "__Fission and Fusion__/graphics/rtg-array.png",
      priority = "extra-high",
      width = 75,
      height = 62,
    },
  },
})
