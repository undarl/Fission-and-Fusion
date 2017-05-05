--Add portable cell reprocessing unlock
table.insert(data.raw.technology['nuclear-fuel-reprocessing'].effects, {type = "unlock-recipe", recipe = "undarl-reprocess-portable-cell"})

--Change prereqs and tech cost for Portable Fusion Reactor
data.raw.technology["fusion-reactor-equipment"].prerequisites = {"undarl-advanced-fusion"}
data.raw.technology["fusion-reactor-equipment"].unit = {
	count = 1000,
	ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"production-science-pack", 1}, {"high-tech-science-pack", 1}, {"space-science-pack", 1}},
	time = 30
}
