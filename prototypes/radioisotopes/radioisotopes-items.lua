data:extend(
	{
		{
			type = "item",
			name = "undarl-radioisotopes",
			icon = "__Fission and Fusion__/graphics/icons/radioisotopes.png",
			flags = {"goes-to-main-inventory"},
			subgroup = "intermediate-product",
			order = "h",
			stack_size = 100
		},
		{
			type = "item",
			name = "undarl-rtg-equipment",
			icon = "__Fission and Fusion__/graphics/icons/rtg.png",
			placed_as_equipment_result = "undarl-rtg-equipment",
			flags = {"goes-to-main-inventory"},
			subgroup = "equipment",
			order = "a[energy-source]-c",
			stack_size = 10
		},
})
