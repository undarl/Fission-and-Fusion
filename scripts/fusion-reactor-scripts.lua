--Fusion reactor interfaces adapted with thanks from GotLag's Reactor Interface.

function add_interface(reactor)
	local interface = reactor.surface.create_entity
	{
		name = "undarl-fusion-reactor-interface",
		position = {reactor.position.x - 1.5, reactor.position.y + 1.25},
		force = reactor.force
	}

	interface.operable = false
	interface.destructible = false
	if game.virtual_signal_prototypes['signal-temperature'] then
		SIGNAL_TEMP = {type = "virtual", name = "signal-temperature"}
	else
		SIGNAL_TEMP = {type = "virtual", name = "undarl-signal-temperature"}
	end
	SIGNAL_FUEL_AVAILABLE = {type = "item", name = "undarl-deuterium-pellets"}

	table.insert(global.reactors,
		{
			id = reactor.unit_number,
			entity = reactor,
			interface = interface,
			control = interface.get_or_create_control_behavior(),
			signals =
			{
				parameters =
				{
					["temp"] = {signal = SIGNAL_TEMP, count = 0, index = 1},
					["fuel"] = {signal = SIGNAL_FUEL_AVAILABLE, count = 0, index = 2},
				}
			}
	})
end

function remove_interface(dead_reactor)
	for i, reactor in pairs(global.reactors) do
		if reactor.id == dead_reactor.unit_number then
			reactor.interface.destroy() -- remove interface
			table.remove(global.reactors, i) -- remove reactor's table entry
		end
	end
end

function update_reactor_interfaces(event)
	if not settings['startup']['undarl-enable-fusion'].value then return end
	TICKS_PER_UPDATE = 1
	local index = (event.tick % TICKS_PER_UPDATE) + 1

	global.reactors = global.reactors or {}

	while index <= #global.reactors do
		local reactor = global.reactors[index]
		reactor.signals.parameters["temp"].count = reactor.entity.temperature
		local fuel = reactor.entity.burner.inventory
		if not fuel.is_empty() then
			reactor.signals.parameters["fuel"].signal.name = fuel[1].name
			reactor.signals.parameters["fuel"].count = fuel[1].count
		else
			reactor.signals.parameters["fuel"].count = 0
		end
		reactor.control.parameters = reactor.signals
		index = index + TICKS_PER_UPDATE
	end
end
