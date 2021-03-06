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

local RTG = require ('scripts.fast-rtg-scripts')
local Reactor = require ('scripts.fusion-reactor-scripts')

local function on_init()
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

local function migrate_old_global(old_global)
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
    for _, rtg in pairs(old_fastrtgs) do
      if not rtg.last_tick then
        rtg.last_tick = last_rtg_update_tick
      end
      fastrtgs[#fastrtgs + 1] = rtg
    end
  end

  RTG.recalculate_rtg_update_rate(fastrtgs)

  -- reset temperature to 15, given that we're burning fluid, rather than fiddling with fluid temperature.
  local fusion_gens = old_global.fusion_gens
  for _,generator in pairs(fusion_gens) do
    if type(generator) == 'table' then
      local fluid = generator[1]
      fluid.temperature = 15
      generator[1] = fluid
    end
  end

  -- ensure that global.reactors is an array
  -- reduce the size of the global data structure by referencing the same SIGNAL_TEMP and SIGNAL_FUEL_AVAILABLE everywhere
  local old_reactors = old_global.reactors
  local reactors = global.reactors
  local reactor_index = global.reactor_index

  local SIGNAL_TEMP = global.SIGNAL_TEMP
  local SIGNAL_FUEL_AVAILABLE = global.SIGNAL_FUEL_AVAILABLE

  if old_reactors then
    for _, reactor in pairs(old_reactors) do
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
local function on_configuration_changed(_)
  if game.active_mods["Fission and Fusion"] then
    local old_global = remote.call("Fission and Fusion", "read_global")
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

local function on_runtime_mod_setting_changed(event)
  local setting = event.setting
  if setting == "undarl-reactor-interface-ticks-per-update" then
    Reactor.update_reactor_interface_ticks_per_update()
  end
end

local on_tick
if RTG_ENABLED and FUSION_ENABLED then
  on_tick = function (event)
    RTG.update_fast_rtgs(event)
    Reactor.update_reactor_interfaces(event)
  end
elseif FUSION_ENABLED then
  on_tick = Reactor.update_reactor_interfaces
elseif RTG_ENABLED then
  on_tick = RTG.update_fast_rtgs
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
  for _,event in ipairs(events) do
    script.on_event(event, handler, filters)
  end
end

if FUSION_ENABLED then
  local fusion_reactor_filter = {
    {
      filter = "name",
      name = "undarl-fusion-reactor"
    }
  }

  register_events(
    {
      defines_events.on_built_entity,
      defines_events.on_robot_built_entity,
    },
    function (event) Reactor.add_interface(event.created_entity) end,
    fusion_reactor_filter
  )

  local script_raised_create_events = {
    defines_events.on_script_raised_built,
    defines_events.on_script_raised_revive
  }

  if SCRIPT_RAISED_HAS_FILTER then
    register_events(
      script_raised_create_events,
      function (event) Reactor.add_interface(event.entity) end,
      fusion_reactor_filter
    )
  else
    register_events(
      script_raised_create_events,
      function (event)
        local entity = event.entity
        if entity.name == "undarl-fusion-reactor" then
          Reactor.add_interface(entity)
        end
      end
    )
  end

  local remove_interface_event = function(event) Reactor.remove_interface(event.entity) end

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
        Reactor.remove_interface(entity)
      end
    )
  end
end

if RTG_ENABLED then
  script.on_event(
    defines_events.on_player_placed_equipment,
    RTG.place_fast_rtg
  )
end
