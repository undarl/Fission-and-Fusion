--Make changes to the Portable Fusion Reactor

data.raw['generator-equipment']['fusion-reactor-equipment'].energy_source =
{
	type = "burner",
	usage_priority = "primary-output"
}

data.raw['generator-equipment']['fusion-reactor-equipment'].burner =
{
	fuel_category = "undarl-compressed-fusion",
	effectivity = 1,
	fuel_inventory_size = 1,
	burnt_inventory_size = 1
}
