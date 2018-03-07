data:extend(
	{
		{
			type = "item",
			name = "undarl-radioisotopes",
			icon = "__Fission and Fusion__/graphics/icons/radioisotopes.png",
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			subgroup = "intermediate-product",
			order = "h",
			stack_size = 100
		},
		{
			type = "item",
			name = "undarl-rtg-equipment",
			icon = "__Fission and Fusion__/graphics/icons/rtg.png",
			icon_size = 32,
			placed_as_equipment_result = "undarl-rtg-equipment",
			flags = {"goes-to-main-inventory"},
			subgroup = "equipment",
			order = "a[energy-source]-c",
			stack_size = 10
		},
		{
			type = "item",
			name = "undarl-rtg-array",
			icon = "__Fission and Fusion__/graphics/icons/rtg-array.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "y[radioisotopes]-a[rtg-array]",
			place_result = "undarl-rtg-array",
			stack_size = 10,
		},
})

--Generate fast RTG items
local frtgpower = 100

while frtgpower >= 10 do
	data:extend(
		{
			{
				type = "item",
				name = "undarl-fast-rtg-equipment-" .. frtgpower,
				localised_name = {"equipment-name.undarl-fast-rtg-equipment", frtgpower},
				localised_description = {"item-description.undarl-fast-rtg-equipment", frtgpower},
				icon = "__Fission and Fusion__/graphics/icons/fast-rtg.png",
			icon_size = 32,
				placed_as_equipment_result = "undarl-fast-rtg-equipment-" .. frtgpower,
				flags = {"goes-to-main-inventory"},
				subgroup = "equipment",
				order = "a[energy-source]-c",
				stack_size = 10
			}
	})
	frtgpower = frtgpower - 5
end
