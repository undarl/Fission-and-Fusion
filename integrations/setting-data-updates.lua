--Add portable cell reprocessing unlock
if settings['startup']['undarl-enable-fission'].value then
	table.insert(data.raw.technology['nuclear-fuel-reprocessing'].effects,
	{type = "unlock-recipe", recipe = "undarl-reprocess-portable-uranium-cell"})
end

--Change prereqs and tech cost for Portable Fusion Reactor
if settings['startup']['undarl-enable-fusion'].value then
	data.raw.technology["fusion-reactor-equipment"].prerequisites = {"undarl-advanced-fusion"}
	if settings['startup']['undarl-enable-fission'].value then
		table.insert(data.raw.technology["fusion-reactor-equipment"].prerequisites,
		"undarl-portable-reactors")
	end
	data.raw.technology["fusion-reactor-equipment"].unit = {
		count = 1000,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"production-science-pack", 1},
			{"high-tech-science-pack", 1},
			{"space-science-pack", 1}
		},
		time = 30
	}
end

--Add radioisotopes to nuclear fuel reprocessing
if settings['startup']['undarl-enable-radioisotopes'].value then
	table.insert(data.raw.recipe['nuclear-fuel-reprocessing'].results,
	{name = "undarl-radioisotopes", probability = 0.50, amount = 1})
	--Add radioisotopes to portable nuclear fuel reprocessing
	if settings['startup']['undarl-enable-fission'].value then
		table.insert(data.raw.recipe['undarl-reprocess-portable-uranium-cell'].results,
		{name = "undarl-radioisotopes", probability = 0.50, amount = 1})
	end
	--Add in appropriate  fast RTG recycling recipe
	local frtgeff = settings.startup['undarl-fast-rtg-recycling'].value
	if frtgeff ~= "none" then
		table.insert(data.raw.technology['undarl-radioisotopes'].effects,
			{
				type = "unlock-recipe",
				recipe = "undarl-fast-rtg-recycling",
		})

		if frtgeff == "25%" then
			data.raw.recipe['undarl-fast-rtg-recycling'].results =
			{
				{name = "steel-plate", amount_min = 1, amount_max = 2},
				{name = "advanced-circuit", amount_min = 0, amount_max = 1},
				{name = "copper-cable", amount_min = 1, amount_max = 2},
			}
		elseif frtgeff == "75%" then
			data.raw.recipe['undarl-fast-rtg-recycling'].results =
			{
				{name = "steel-plate", amount_min = 3, amount_max = 4},
				{name = "advanced-circuit", amount_min = 2, amount_max = 3},
				{name = "copper-cable", amount_min = 3, amount_max = 4},
			}
		end
	end
end
