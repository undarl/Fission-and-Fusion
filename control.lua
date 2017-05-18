require ('scripts.fast-rtg-scripts')
require ('scripts.fusion-reactor-scripts')
require ('scripts.fusion-generator-scripts')

global = global or {}
global.reactors = global.reactors or {}

---Re-populate fusion generator table and reset recipes after a mod update.
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

--Update reactor interface information and fusion generator temperature
script.on_event(defines.events.on_tick, function(event)
	if (event.tick % 600) == 0 then update_fast_rtgs() end
	update_reactor_interfaces(event)
	check_fusion_generators()
end)

--Run additional setup when placing a fusion generator or reactor
local function BuiltEntity(event)
	local entity = event.created_entity
	if entity.name == "undarl-fusion-generator" then
		placed_fusion_generator(entity)
		return
	elseif entity.name == "undarl-fusion-reactor" then
		add_interface(entity)
		return
	end
end

--Remove fusion reactor unterface along with its reactor
local function DestedEntity(event)
	if event.entity.name == "undarl-fusion-reactor" then
		remove_interface(event.entity)
		return
	end
end

local function PlacedEquip(event)
	if settings.startup['undarl-enable-radioisotopes'].value and string.sub(event.equipment.name, 1, 25) == "undarl-fast-rtg-equipment" then
		place_fast_rtg(event)
	end
end

--Event hooks
script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
script.on_event(defines.events.on_preplayer_mined_item, DestedEntity)
script.on_event(defines.events.on_robot_pre_mined, DestedEntity)
script.on_event(defines.events.on_entity_died, DestedEntity)
script.on_event(defines.events.on_player_placed_equipment, PlacedEquip)
