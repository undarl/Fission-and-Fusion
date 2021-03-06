--Make changes to all Portable Fusion Reactors

local generator_equipment = data.raw['generator-equipment']

local burner_data = {
	fuel_category = "undarl-compressed-fusion",
	effectivity = 1,
	fuel_inventory_size = 1,
	burnt_inventory_size = 1
}

local do_not_change_list = {
	['undarl-rtg-equipment'] = true
}

local free_portable_fusion = settings.startup['undarl-free-portable-fusion'].value

for name in string.gmatch(free_portable_fusion, '[^.]+') do
	do_not_change_list[name] = true
end

for name, generator in pairs(generator_equipment) do
	if not generator.burner and not do_not_change_list[name] then
		generator.burner = burner_data
	end
end

