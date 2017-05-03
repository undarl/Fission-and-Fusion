data:extend(
	{
		{
			type = "recipe",
			name = "undarl-portable-nuclear-fuel-cell",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"iron-plate", 5},
				{"plastic-bar", 2},
				{"uranium-235", 1},
				{"uranium-238", 9}
			},
			result = "undarl-portable-nuclear-fuel-cell",
			result_count = 20
		},
		{
			type = "recipe",
			name = "undarl-reprocess-portable-cell",
			energy_required = 50,
			enabled = false,
			category = "centrifuging",
			ingredients = {{"undarl-depleted-fuel-cell", 10}},
			icon = "__undarl-fission-fusion__/graphics/icons/reprocess-portable-cell.png",
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-c",
			main_product = "",
			results =
			{
				{
					name = "uranium-238",
					amount = 2
				}
			}
		},
		{
			type = "recipe",
			name = "undarl-fission-reactor-equipment",
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{"plastic-bar", 10},
				{"steel-plate", 10},
				{"advanced-circuit", 10},
				{"copper-plate", 10},
			},
			result = "undarl-fission-reactor-equipment",
		},
		{
    type = "recipe",
    name = "undarl-reprocess-radioisotope",
    energy_required = 50,
    enabled = true,
    category = "centrifuging",
    ingredients = {{"used-up-uranium-fuel-cell", 5}},
    icon = "__undarl-fission-fusion__/graphics/icons/cell-to-radioisotope.png",
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-b",
    main_product = "",
    results =
    {
      {
        name = "undarl-radioisotopes",
		 probability = 0.75,
        amount =1
	},
	{
		name = "uranium-238",
		amount = 2
	}
    }
  },
  {
type = "recipe",
name = "undarl-portable-reprocess-radioisotope",
energy_required = 50,
enabled = true,
category = "centrifuging",
ingredients = {{"undarl-depleted-fuel-cell", 10}},
icon = "__undarl-fission-fusion__/graphics/icons/portable-cell-to-radioisotope.png",
subgroup = "intermediate-product",
order = "r[uranium-processing]-c",
main_product = "",
results =
{
{
  name = "undarl-radioisotopes",
  probability = 0.5,
  amount = 0.5
},
{
	name = "uranium-238",
	amount = 1
}
}
},
{
	type = "recipe",
	name = "undarl-rtg-equipment",
	energy_required = 10,
	enabled = true,
	ingredients =
	{
		{"undarl-radioisotopes", 2},
		{"steel-plate", 10},
		{"advanced-circuit", 5},
		{"copper-cable", 10},
	},
	result = "undarl-rtg-equipment",
},
})
