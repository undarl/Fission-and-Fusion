data:extend(
{
	{
    type = "electric-energy-interface",
    name = "undarl-rtg-array",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "undarl-rtg-array"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
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
      filename = "__base__/graphics/entity/accumulator/accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125}
    },
  },
})
