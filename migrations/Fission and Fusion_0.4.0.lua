for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    if force.technologies['undarl-advanced-fusion'].researched then
        force.recipes['undarl-pressure-cylinder'].enabled = true
        force.recipes['undarl-deuterium-pressure-cylinder'].enabled = true
        force.recipes['undarl-empty-deuterium-pressure-cylinder'].enabled = true
    end
end
