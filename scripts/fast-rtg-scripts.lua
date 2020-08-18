local S = {}

--One game day is 25000 ticks
local DEPLETION_INTERVAL = 25000
local TICKS_PER_UPDATE = 600

local rtg_equipment_to_power_percent = {}
local power_percent_to_rtg_equipment = {}

for power_percent=100,10,-5 do
  local equipment_name = "undarl-fast-rtg-equipment-" .. power_percent
  rtg_equipment_to_power_percent[equipment_name] = power_percent
  power_percent_to_rtg_equipment[power_percent] = equipment_name
end

function S.recalculate_rtg_update_rate(fastrtgs)
  local rtgcount = #fastrtgs
  if rtgcount >= TICKS_PER_UPDATE then
    fastrtgs.rtgs_per_update = math.ceil(rtgcount / TICKS_PER_UPDATE)
    fastrtgs.ticks_per_update = 1
  else
    fastrtgs.rtgs_per_update = 1
    if rtgcount > 0 then
      fastrtgs.ticks_per_update = math.ceil(TICKS_PER_UPDATE / rtgcount)
    else
      fastrtgs.ticks_per_update = false
    end
  end
end

function S.place_fast_rtg(event)
  local equipment = event.equipment
  local power_percent = rtg_equipment_to_power_percent[equipment.name]
  if not power_percent then return end
  local fastrtgs = global.fastrtgs
  fastrtgs[#fastrtgs + 1] = {
    entity = equipment,
    position = equipment.position,
    grid = event.grid,
    duration = 0,
    power_percent = power_percent,
    last_tick = game.tick
  }
  S.recalculate_rtg_update_rate(fastrtgs)
end

function S.update_fast_rtgs(event)
  local fastrtgs = global.fastrtgs
  local ticks_per_update = fastrtgs.ticks_per_update
  if not ticks_per_update then return end
  local tick = event.tick
  if tick % ticks_per_update ~= 0 then return end
  local rtgs_per_update = fastrtgs.rtgs_per_update
  local removed = false
  local i = fastrtgs.next
  for _ = 1,rtgs_per_update do
    local rtg = fastrtgs[i]
    local remove = false
    if not rtg.entity.valid then
      remove = true
    else
      local last_tick = rtg.last_tick
      rtg.last_tick = tick
      local duration = rtg.duration + (tick - last_tick)
      --Update equipment if we're due for capacity loss
      if duration >= DEPLETION_INTERVAL then
        duration = duration - DEPLETION_INTERVAL
        local power_percent = rtg.power_percent - 5
        rtg.power_percent = power_percent
        if power_percent == 10 then --When the RTG has hit 10% it no longer gets updated
          remove = true
        end
        local position = rtg.position
        rtg.grid.take({position = position})
        rtg.entity = rtg.grid.put({
          name = power_percent_to_rtg_equipment[power_percent],
          position = position
        })
      end
      rtg.duration = duration
    end
    if remove then
      removed = true
      fastrtgs[i] = fastrtgs[#fastrtgs]
      fastrtgs[#fastrtgs] = nil
    end
    if i >= #fastrtgs then
      i = 1
    else
      i = i + 1
    end
  end
  fastrtgs.next = i
  if removed then
    S.recalculate_rtg_update_rate(fastrtgs)
  end
end

return S
