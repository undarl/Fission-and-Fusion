local intermediate_recipes = {}

--Integrations for GotLag's Nuclear Fuel
if mods['Nuclear Fuel'] then
	require('integrations.NuclearFuel').collect_intermediate_recipes(intermediate_recipes)
end

--Integrations for Angel's Petrochem
if mods['angelspetrochem'] and settings.startup['undarl-enable-fusion'].value then
	require('integrations.AngelPetrochem')
end

--Add in reactor temperature signal if not already present
if settings.startup['undarl-enable-fusion'].value then
	if not data.raw['virtual-signal']['signal-temperature'] then
		data:extend({
			{
				type = "virtual-signal",
				name = "undarl-signal-temperature",
				icon = "__Fission-and-Fusion__/graphics/icons/temperature.png",
				icon_size = 32,
				subgroup = "undarl-fusion-reactor-signals",
				order = "a-a"
			}
		})
	end
end

for _, module in pairs(data.raw["module"]) do
	local module_limitation = module.limitation
  if module.effect.productivity and module_limitation then
    for recipe_name in pairs(intermediate_recipes) do
      table.insert(module_limitation, recipe_name)
    end
  end
end
