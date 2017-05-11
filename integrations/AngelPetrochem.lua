--Replace sulfur in H2S Exchange recipe with actual H2S
data.raw.recipe['undarl-heavy-water-h2s-exchange'].ingredients =
{
		{type = "fluid", name = "water", amount = 3600},
		{type = "fluid", name = "gas-hydrogen-sulfide", amount = 10},
}

--Transfer Deuterium Electrolysis recipe to electrolyser
data.raw.recipe['undarl-make-deuterium'].category = "petrochem-electrolyser"

--Add oxygen as a byproduct of Deuterium Electrolysis
table.insert(data.raw.recipe['undarl-make-deuterium'].results,
{type = "fluid", name = "gas-oxygen", amount = 10})
