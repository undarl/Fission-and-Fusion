--Add radioisotope chance to breeder cell reprocessing
if settings['startup']['undarl-enable-radioisotopes'].value then
	table.insert(
		data.raw.recipe['breeder-fuel-reprocessing'].results,
	{name = "undarl-radioisotopes", probability = 0.5, amount = 1})
end

if settings['startup']['undarl-enable-fission'].value then
	--Add plutonium chance to portable cell reprocessing
	table.insert(
		data.raw.recipe['undarl-reprocess-portable-uranium-cell'].results,
	{name = "plutonium", probability = 0.25, amount = 1})

	--Add portable breeder cells and reprocessing, portable MOX recipe
	data:extend(
		{
			{
				type = "item",
				name = "undarl-portable-breeder-fuel-cell",
				icon = "__Fission and Fusion__/graphics/icons/portable-breeder-fuel-cell.png",
				flags = {"goes-to-main-inventory"},
				subgroup = "intermediate-product",
				order = "r[uranium-processing]-a[uranium-fuel-cell]-n",
				fuel_category = "portable-nuclear",
				burnt_result = "undarl-depleted-breeder-fuel-cell",
				fuel_value = "225MJ",
				stack_size = 60
			},
			{
				type = "item",
				name = "undarl-depleted-breeder-fuel-cell",
				icon = "__Fission and Fusion__/graphics/icons/depleted-breeder-fuel-cell.png",
				flags = {"goes-to-main-inventory"},
				subgroup = "intermediate-product",
				stack_size = 60
			},
			{
				type = "recipe",
				name = "undarl-portable-mox-fuel-cell",
				energy_required = 10,
				enabled = false,
				ingredients =
				{
					{"iron-plate", 2},
					{"plutonium", 1},
					{"uranium-238", 1}
				},
				result = "undarl-portable-uranium-fuel-cell",
				result_count = 20
			},
			{
				type = "recipe",
				name = "undarl-portable-breeder-fuel-cell",
				energy_required = 10,
				enabled = false,
				ingredients =
				{
					{"iron-plate", 2},
					{"plutonium", 1},
					{"uranium-238", 4}
				},
				result = "undarl-portable-breeder-fuel-cell",
				result_count = 20
			},
			{
				type = "recipe",
				name = "undarl-reprocess-portable-breeder-cell",
				energy_required = 30,
				enabled = false,
				category = "centrifuging",
				ingredients = {{"undarl-depleted-breeder-fuel-cell", 10}},
				icon = "__Fission and Fusion__/graphics/icons/reprocess-portable-breeder-cell.png",
				subgroup = "intermediate-product",
				order = "r[uranium-processing]-b[nuclear-fuel-reprocessing]-n",
				main_product = "",
				results =
				{
					{
						name = "plutonium",
						amount = 2
					},
					{
						name = "uranium-235",
						probability = 0.25,
						amount = 1
					}
				}
			}
	})

	table.insert(data.raw.technology['nuclear-fuel-reprocessing'].effects,
	{type = "unlock-recipe", recipe = "undarl-portable-breeder-fuel-cell"})

	table.insert(data.raw.technology['nuclear-fuel-reprocessing'].effects,
	{type = "unlock-recipe", recipe = "undarl-reprocess-portable-breeder-cell"})

	table.insert(data.raw.technology['kovarex-enrichment-process'].effects,
	{type = "unlock-recipe", recipe = "undarl-portable-mox-fuel-cell"})

	--Add radioisotope chance to portable breeder reprocessing
	if settings['startup']['undarl-enable-radioisotopes'].value then
		table.insert(
			data.raw.recipe['undarl-reprocess-portable-breeder-cell'].results,
		{name = "undarl-radioisotopes", probability = 0.5, amount = 1})
	end
end
