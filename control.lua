-- Modules

local version = require("__stdlib__/stdlib/vendor/version")

local factorio_version = version(script.active_mods["base"])

-- constants

local SCRIPT_RAISED_HAS_FILTER = false

local RTG_ENABLED = settings.startup['undarl-enable-radioisotopes'].value
local FUSION_ENABLED = settings.startup['undarl-enable-fusion'].value

if factorio_version >= version("0.18.27") then
  SCRIPT_RAISED_HAS_FILTER = true
end

-- functions

require ('scripts.fast-rtg-scripts')
require ('scripts.fusion-reactor-scripts')
require ('scripts.fusion-generator-scripts')

function on_init()
  global.fusion_gens = {
    next = 1
  }
  global.fastrtgs = {
    next = 1
  }
  global.reactors = {}
  global.reactor_index = {}

  local SIGNAL_TEMP = {type = "virtual", name = nil}
  if game.virtual_signal_prototypes['signal-temperature'] then
    SIGNAL_TEMP.name = "signal-temperature"
  else
    SIGNAL_TEMP.name = "undarl-signal-temperature"
  end
  global.SIGNAL_TEMP = SIGNAL_TEMP
  global.SIGNAL_FUEL_AVAILABLE = {type = "item", name = "undarl-deuterium-pellets"}
end

function migrate_old_global(old_global)
  log("Migrating global from Fission and Fusion to Fission-and-Fusion...")
  log('global from "Fission and Fusion" (old):')
  log(serpent.block(old_global))
  log("global from 'Fisson-and-Fusion' (new):")
  log(serpent.block(global))
  -- ensure that global.fastrtgs is an array.
  -- populate last_tick with the last update tick under the old scheme.
  -- calculate update rate
  local old_fastrtgs = old_global.fastrtgs
  local fastrtgs = global.fastrtgs

  local last_rtg_update_tick = game.tick % 600

  old_fastrtgs.next = nil
  old_fastrtgs.rtgs_per_update = nil
  old_fastrtgs.ticks_per_update = nil

  if old_fastrtgs then
    for k, rtg in pairs(old_fastrtgs) do
      if not rtg.last_tick then
        rtg.last_tick = last_rtg_update_tick
      end
      fastrtgs[#fastrtgs + 1] = rtg
    end
  end

  recalculate_rtg_update_rate(fastrtgs)


  -- ensure that fusion_gens is an array.
  -- calculate update rate
  local old_fusion_gens = old_global.fusion_gens
  local fusion_gens = global.fusion_gens

  old_fusion_gens.gens_per_update = nil
  old_fusion_gens.next = nil
  old_fusion_gens.ticks_per_update = nil

  local last_rtg_update_tick = game.tick % 600

  if old_fusion_gens then
    for k, generator in pairs(old_fusion_gens) do
      fusion_gens[#fusion_gens + 1] = generator
    end
  end

  recalculate_fusion_gen_update_rate(fusion_gens)


  -- ensure that global.reactors is an array
  -- reduce the size of the global data structure by referencing the same SIGNAL_TEMP and SIGNAL_FUEL_AVAILABLE everywhere
  local old_reactors = old_global.reactors
  local reactors = global.reactors
  local reactor_index = global.reactor_index

  local SIGNAL_TEMP = global.SIGNAL_TEMP
  local SIGNAL_FUEL_AVAILABLE = global.SIGNAL_FUEL_AVAILABLE

  if old_reactors then
    for k, reactor in pairs(old_reactors) do
      local parameters = reactor.signals.parameters
      local unit_number = reactor.id
      reactor.id = nil
      reactor.unit_number = unit_number
      reactor.inventory = reactor.entity.burner.inventory
      parameters.temp.signal = SIGNAL_TEMP
      parameters.fuel.signal = SIGNAL_FUEL_AVAILABLE
      reactors[#reactors + 1] = reactor
      reactor_index[unit_number] = #reactors
    end
  end

  remote.call("Fission and Fusion", "mark_migrated")
  log("merged global:")
  log(serpent.block(global))
  log("Migration complete.")
end

-- On the off chance that someone has provided us with a signal-temperature, or pehaps taken it away again.
function on_configuration_changed(event)
  if game.active_mods["Fission and Fusion"] then
    old_global = remote.call("Fission and Fusion", "read_global")
    if not old_global.migrated then
      migrate_old_global(old_global)
    end
  end
  if game.virtual_signal_prototypes['signal-temperature'] then
    global.SIGNAL_TEMP.name = "signal-temperature"
  else
    global.SIGNAL_TEMP.name = "undarl-signal-temperature"
  end
end

function on_runtime_mod_setting_changed(event)
  local setting = event.setting
  if setting == "undarl-reactor-interface-ticks-per-update" then
    update_reactor_interface_ticks_per_update()
  end
end

local on_tick
if RTG_ENABLED and FUSION_ENABLED then
  on_tick = function (event)
    update_fast_rtgs(event)
    update_fusion_generators(event)
    update_reactor_interfaces(event)
  end
elseif FUSION_ENABLED then
  on_tick = function(event)
    update_fusion_generators(event)
    update_reactor_interfaces(event)
  end
elseif RTG_ENABLED then
  on_tick = update_fast_rtgs
end

--Event hooks

script.on_init(on_init)

script.on_configuration_changed(on_configuration_changed)

local defines_events = defines.events

script.on_event(defines_events.on_runtime_mod_setting_changed,on_runtime_mod_setting_changed)

if on_tick then
  script.on_event(defines_events.on_tick, on_tick)
end

local function register_events(events, handler, filters)
  for i,event in ipairs(events) do
    script.on_event(event, handler, filters)
  end
end

if FUSION_ENABLED then
  local fusion_filters = {
    {
      filter = "name",
      name = "undarl-fusion-reactor"
    },
    {
      filter = "name",
      name = "undarl-fusion-generator"
    }
  }

  function on_new_fusion_thing(entity)
    local entity_name = entity.name
    if entity_name == "undarl-fusion-generator" then
      placed_fusion_generator(entity)
    elseif entity_name == "undarl-fusion-reactor" then
      add_interface(entity)
    end
  end

  function on_created_fusion_thing(event)
    local entity = event.created_entity
    on_new_fusion_thing(entity)
  end

  function on_built_fusion_thing(event)
    local entity = event.entity
    on_new_fusion_thing(entity)
  end

  register_events(
    {
      defines_events.on_built_entity,
      defines_events.on_robot_built_entity,
    },
    on_created_fusion_thing,
    fusion_filters
  )

  local script_raised_create_events = {
    defines_events.on_script_raised_built,
    defines_events.on_script_raised_revive
  }

  if SCRIPT_RAISED_HAS_FILTER then
    register_events(
      script_raised_create_events,
      on_built_fusion_thing,
      fusion_filters
    )
  else
    register_events(
      script_raised_create_events,
      on_built_fusion_thing
    )
  end

  local fusion_reactor_filter = {
    {
      filter = "name",
      name = "undarl-fusion-reactor"
    }
  }

  local remove_interface_event = function(event) remove_interface(event.entity) end

  register_events(
    {
      defines_events.on_pre_player_mined_item,
      defines_events.on_robot_pre_mined,
      defines_events.on_entity_died
    },
    remove_interface_event,
    fusion_reactor_filter
  )

  if SCRIPT_RAISED_HAS_FILTER then
    script.on_event(
      defines_events.script_raised_destroy,
      remove_interface_event,
      fusion_reactor_filter
    )
  else
    script.on_event(
      defines_events.script_raised_destroy,
      function(event)
        local entity = event.entity
        if entity.name ~= "undarl-fusion-reactor" then return end
        remove_interface(entity)
      end
    )
  end
end

if RTG_ENABLED then
  script.on_event(
    defines_events.on_player_placed_equipment,
    place_fast_rtg
  )
end
