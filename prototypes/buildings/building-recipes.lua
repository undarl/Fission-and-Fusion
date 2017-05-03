data:extend(
	{
		{
			type = "recipe",
			name = "undarl-fusion-generator",
			enabled = true,
			ingredients = {{"iron-gear-wheel", 50}, {"copper-plate", 50}, {"pipe", 20}},
			result = "undarl-fusion-generator"
		},
		{
    type = "recipe",
    name = "undarl-deuterium-pellets",
	category = "chemistry",
    energy_required = 5,
    enabled = true,
    ingredients =
    {
      {type="fluid", name="undarl-gas-deuterium", amount=120},
    },
    result = "undarl-deuterium-pellets",
    result_count = 10
  },
  {
    type = "recipe",
    name = "undarl-fusion-reactor",
    energy_required = 4,
    enabled = true,
    ingredients =
    {
      {"concrete", 500},
      {"steel-plate", 500},
      {"advanced-circuit", 500},
      {"copper-plate", 500},
    },
    result = "undarl-fusion-reactor"
  },
	}
)
