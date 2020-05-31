--Fusion reactor interfaces adapted with thanks from GotLag's Reactor Interface.
local TICKS_PER_UPDATE = settings.global['undarl-reactor-interface-ticks-per-update'].value

function update_reactor_interface_ticks_per_update()
  TICKS_PER_UPDATE = settings.global['undarl-reactor-interface-ticks-per-update'].value
end

function add_interface(reactor)
  local reactor_position = reactor.position
  local interface = reactor.surface.create_entity{
    name = "undarl-fusion-reactor-interface",
    position = {
      reactor_position.x - 1.5,
      reactor_position.y + 1.25
    },
    force = reactor.force
  }

  interface.operable = false
  interface.destructible = false

  local reactors = global.reactors
  local reactor_index = global.reactor_index
  local unit_number = reactor.unit_number
  reactors[#reactors + 1] = {
    unit_number = unit_number,
    entity = reactor,
    inventory = reactor.burner.inventory,
    interface = interface,
    control = interface.get_or_create_control_behavior(),
    signals = {
      parameters = {
        temp = {signal = global.SIGNAL_TEMP, count = 0, index = 1},
        fuel = {signal = global.SIGNAL_FUEL_AVAILABLE, count = 0, index = 2},
      }
    }
  }
  reactor_index[unit_number] = #reactors
end

function remove_interface(dead_reactor)
  local dead_reactor_unit_number = dead_reactor.unit_number
  local reactor_index = global.reactor_index
  local i = reactor_index[dead_reactor_unit_number]
  local reactors = global.reactors
  dead_reactor = reactors[i]
  local valid_reactor = reactors[#reactors]
  reactors[i] = valid_reactor
  reactors[#reactors] = nil
  if valid_reactor then
    reactor_index[valid_reactor.unit_number] = i
  end
  reactor_index[dead_reactor_unit_number] = nil
  dead_reactor.interface.destroy() -- remove interface
end

function update_reactor_interfaces(event)
  local reactors = global.reactors
  if not next(reactors) then return end

  local ticks_per_update = TICKS_PER_UPDATE
  if ticks_per_update == 0 then return end

  local first_index = (event.tick % ticks_per_update) + 1

  for index=first_index,#reactors,ticks_per_update do
    local reactor = reactors[index]
    local reactor_entity = reactor.entity
    if not reactor_entity.valid or not reactor.inventory.valid then
      remove_interface(reactor)
      goto next
    end
    local reactor_signals = reactor.signals
    local reactor_signals_parameters = reactor_signals.parameters
    reactor_signals_parameters.temp.count = reactor_entity.temperature
    local fuel_signal = reactor_signals_parameters.fuel
    fuel_signal.count = reactor.inventory.get_item_count()
    reactor.control.parameters = reactor_signals
    ::next::
  end
end
