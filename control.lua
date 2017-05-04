require "fusion-generator-scripts"

script.on_configuration_changed(function(data)
	if data.mod_changes == nil then return end
	if data.mod_changes["Fission and Fusion"] == nil then return end
	local version = data.mod_changes["Fission and Fusion"].old_version

	if version then
		for k, s in pairs (game.surfaces) do
			migrate_fusion_generators(s)
		end
		for k, f in pairs (game.forces) do
			f.reset_recipes()
		end
	end
end)

script.on_event(defines.events.on_tick, function(event)
	check_fusion_generators()
end)

function BuiltEntity(event)
	local entity = event.created_entity
	if entity.name == "undarl-fusion-generator" then
		placed_fusion_generator(entity)
		return
	end
end

script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
