--Fusion generator temperature setting and update logic adapted
--with thanks from Klonan's diesel generator.

local enabled = settings.startup['undarl-enable-fusion'].value

function migrate_fusion_generators(surface)
	if global.fusion_gens or not enabled then return end
	global.fusion_generator = nil
	global.archived_fusion_generator = nil
	local array = {}
	for k, fusion_generator in pairs(surface.find_entities_filtered({name = "undarl-fusion-generator"})) do
		array[k] = fusion_generator.fluidbox
	end
	global.fusion_gens_size = #array
	global.fusion_gens = array
	global.fusion_gens_interval = math.ceil(global.fusion_gens_size / 200)
end

function check_fusion_generators()
	if not global.fusion_gens or not enabled then return end

	local heat = function(boxes)
		local box = boxes[1]
		if not box then return end
		box.temperature = 20
		boxes[1] = box
	end

	local gens = global.fusion_gens
	local interval = global.fusion_gens_interval
	local tick = game.tick
	for k, gen in pairs (gens) do
		if (k + tick) % interval == 0 then
			if not gen.valid then
				gens[k] = nil
				global.fusion_gens_size = #gens
				global.fusion_gens_interval = math.ceil(global.fusion_gens_size / 200)
			else
				heat(gen)
			end
		end
	end
	global.fusion_gens = gens
end

function placed_fusion_generator(entity)
	if not global.fusion_gens then
		global.fusion_gens = {}
		global.fusion_gens_size = 0
	end
	global.fusion_gens_size = global.fusion_gens_size + 1
	global.fusion_gens[global.fusion_gens_size] = entity.fluidbox
	global.fusion_gens_interval = math.ceil(global.fusion_gens_size / 200)
end
