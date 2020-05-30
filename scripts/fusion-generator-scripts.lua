--Fusion generator temperature setting and update logic adapted
--with thanks from Klonan's diesel generator.
local TICKS_PER_UPDATE = 200

function recalculate_fusion_gen_update_rate(fusion_gens)
  local generator_count = #fusion_gens
  if generator_count >= TICKS_PER_UPDATE then
    fusion_gens.gens_per_update = math.ceil(generator_count / TICKS_PER_UPDATE)
    fusion_gens.ticks_per_update = 1
  else
    fusion_gens.gens_per_update = 1
    if generator_count > 0 then
      fusion_gens.ticks_per_update = math.ceil(TICKS_PER_UPDATE / generator_count)
    else
      fusion_gens.ticks_per_update = false
    end
  end
end

function update_fusion_generators(event)
  local fusion_gens = global.fusion_gens
  local ticks_per_update = fusion_gens.ticks_per_update
  if not ticks_per_update then return end
  local tick = event.tick
  if tick % ticks_per_update ~= 0 then return end
  local gens_per_update = fusion_gens.gens_per_update
  local removed = false
  local i = fusion_gens.next
  for j=1,gens_per_update do
    local generator = fusion_gens[i]
    local remove = false
    if not generator.valid then
      remove = true
    else
      local fluid = generator[1]
      if fluid then
        fluid.temperature = 20
        generator[1] = fluid
      end
    end
    if remove then
      removed = true
      fusion_gens[i] = fusion_gens[#fusion_gens]
      fusion_gens[#fusion_gens] = nil
    end
    if i >= #fusion_gens then
      i = 1
    else
      i = i + 1
    end
  end
  fusion_gens.next = i
  if removed then
    recalculate_fusion_gen_update_rate(fusion_gens)
  end
end

function placed_fusion_generator(entity)
  fusion_gens = global.fusion_gens
  fusion_gens[#fusion_gens + 1] = entity.fluidbox
  recalculate_fusion_gen_update_rate(fusion_gens)
end
