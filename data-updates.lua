--Integrations for GotLag's Nuclear Fuel
if data.raw.recipe['mox-fuel-cell'] then
	require('integrations.NuclearFuel')
end

--Add in reactor interface signals if they aren't already present
if settings['startup']['undarl-enable-fusion'].value then
	--Virtual signal background
	local BLUE_BACKGROUND = "__base__/graphics/icons/signal/shape_square.png"
	if not data.raw['virtual-signal']['signal-temperature'] then
		data:extend({
			{
			type = "virtual-signal",
			name = "signal-temperature",
			icons =
			{
				{icon = BLUE_BACKGROUND},
				{icon = "__Reactor Interface__/graphics/signal/temperature.png"}
			},
			subgroup = "undarl-fusion-reactor-signals",
			order = "a-a"
		}
	})
end

if not data.raw['virtual-signal']['signal-fuel'] then
	data:extend({
		{
		type = "virtual-signal",
		name = "signal-fuel",
		icons =
		{
			{icon = BLUE_BACKGROUND},
			{icon = "__Reactor Interface__/graphics/signal/fuel.png"}
		},
		subgroup = "undarl-fusion-reactor-signals",
		order = "a-b"
	}
})
end
end
