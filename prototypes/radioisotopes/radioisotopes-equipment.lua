data:extend(
	{
		{
			type = "generator-equipment",
			name = "undarl-rtg-equipment",
			sprite =
			{
				filename = "__Fission and Fusion__/graphics/rtg.png",
				width = 32,
				height = 64,
				priority = "medium",
				hr_version = {
					filename = "__Fission and Fusion__/graphics/rtg-hr.png",
					width = 64,
					height = 128,
				}
			},
			shape =
			{
				width = 1,
				height = 2,
				type = "full"
			},
			energy_source =
			{
				type = "electric",
				usage_priority = "primary-output"
			},
			power = "30kW",
			categories = {"armor"}
		},
})

--Generate fast RTG entities
local frtgpower = 100
local FRTGMAXPOWER = 80

while frtgpower >= 10 do
	data:extend(
		{
			{
				type = "generator-equipment",
				name = "undarl-fast-rtg-equipment-" .. frtgpower,
				localised_name = {"equipment-name.undarl-fast-rtg-equipment", frtgpower},
				localised_description = {"item-description.undarl-fast-rtg-equipment", frtgpower},
				sprite =
				{
					filename = "__Fission and Fusion__/graphics/fast-rtg.png",
					width = 32,
					height = 64,
					priority = "medium",
					hr_version = {
						filename = "__Fission and Fusion__/graphics/fast-rtg-hr.png",
						width = 64,
						height = 128,
					}
				},
				shape =
				{
					width = 1,
					height = 2,
					type = "full"
				},
				energy_source =
				{
					type = "electric",
					usage_priority = "primary-output"
				},
				power = ((frtgpower / 100) * FRTGMAXPOWER) .. "kW",
				categories = {"armor"}
			}
	})
	frtgpower = frtgpower - 5
end
