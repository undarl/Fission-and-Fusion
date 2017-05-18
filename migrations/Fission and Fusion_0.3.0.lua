for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    if force.technologies["undarl-radioisotopes"].researched then
        force.recipes["undarl-fast-rtg-equipment"].enabled = true
        if settings.startup['undarl-fast-rtg-recycling'].value ~= "none" then
            force.recipes["undarl-fast-rtg-recycling"].enabled = true
        end
    end
end
