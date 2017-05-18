--One game day is 25000 ticks
local DEPLETION_INTERVAL = 25000

function place_fast_rtg(event)
	if not global.fastrtgs then
		global.fastrtgs = {}
	end
	table.insert(global.fastrtgs,
{
	['entity'] = event.equipment,
	['position'] = event.equipment.position,
	['grid'] = event.grid,
	['duration'] = 0,
	['power_percent'] = tonumber(string.sub(event.equipment.name, 27))
})
end

function update_fast_rtgs()
	if not global.fastrtgs then return end

	for k, rtg in pairs(global.fastrtgs) do
		if not rtg.entity.valid then --Clean invalid entries
			table.remove(global.fastrtgs, k)
		elseif rtg.power_percent > 10 then --When the RTG has hit 10% it no longer gets updated
			rtg.duration = rtg.duration + 600
			--Update equipment if we're due for capacity loss
			if rtg.duration >= DEPLETION_INTERVAL then
				rtg.duration = 0
				rtg.power_percent = rtg.power_percent - 5
				rtg.grid.take({position = rtg.position})
				rtg.entity = rtg.grid.put({name = "undarl-fast-rtg-equipment-" .. rtg.power_percent, position = rtg.position})
			end
			--Write updates back to global table
			global.fastrtgs[k] = rtg
		end
	end
end
