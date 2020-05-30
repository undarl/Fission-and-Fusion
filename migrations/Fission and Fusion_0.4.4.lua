-- ensure that global.fastrtgs is an array.
-- populate last_tick with the last update tick under the old scheme.
-- calculate update rate
local old_fastrtgs = global.fastrtgs

local last_rtg_update_tick = game.tick % 600

if old_fastrtgs then
  for k, rtg in pairs(old_fastrtgs) do
    rtg.last_tick = last_rtg_update_tick
    fastrtgs[#fastrtgs + 1] = rtg
  end
end

fastrtgs.next = 1

global.fastrtgs = fastrtgs

recalculate_rtg_update_rate(fastrtgs)


-- ensure that fusion_gens is an array.
-- calculate update rate
local old_fusion_gens = global.fusion_gens
local fusion_gens = {}

local last_rtg_update_tick = game.tick % 600

if old_fusion_gens then
  for k, generator in pairs(old_fusion_gens) do
    fusion_gens[#fusion_gens + 1] = generator
  end
end

recalculate_fusion_gen_update_rate(fusion_gens)
fusion_gens.next = 1

global.fusion_gens = fusion_gens
global.fusion_gens_size = nil
global.fusion_gens_interval = nil


-- ensure that global.reactors is an array
-- reduce the size of the global data structure by referencing the same SIGNAL_TEMP and SIGNAL_FUEL_AVAILABLE everywhere
local old_reactors = global.reactors
local reactors = {}
local reactor_index = {}

local SIGNAL_TEMP = {type = "virtual", name = nil}
if game.virtual_signal_prototypes['signal-temperature'] then
  SIGNAL_TEMP.name = "signal-temperature"
else
  SIGNAL_TEMP.name = "undarl-signal-temperature"
end
local SIGNAL_FUEL_AVAILABLE  = {type = "item", name = "undarl-deuterium-pellets"}
global.SIGNAL_TEMP = SIGNAL_TEMP
global.SIGNAL_FUEL_AVAILABLE = SIGNAL_FUEL_AVAILABLE

if old_reactors then
  for k, reactor in pairs(old_reactors) do
    local parameters = reactor.signals.parameters
    parameters.temp.signal = SIGNAL_TEMP
    parameters.fuel.signal = SIGNAL_FUEL_AVAILABLE
    reactors[#reactors + 1] = reactor
    reactor_index[reactor.id] = #reactors
  end
end

global.reactors = new_reactors
