data:extend(
	{
		{
			type = "item",
			name = "undarl-portable-uranium-fuel-cell",
			icon = "__Fission and Fusion__/graphics/icons/portable-uranium-fuel-cell.png",
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			subgroup = "intermediate-product",
			order = "r[uranium-processing]-a[uranium-fuel-cell]-m",
			fuel_category = "undarl-portable-nuclear",
			burnt_result = "undarl-depleted-uranium-fuel-cell",
			fuel_value = "450MJ",
			stack_size = 60
		},
		{
			type = "item",
			name = "undarl-depleted-uranium-fuel-cell",
			icon = "__Fission and Fusion__/graphics/icons/depleted-uranium-fuel-cell.png",
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			subgroup = "intermediate-product",
			stack_size = 60
		},
		{
			type = "item",
			name = "undarl-fission-reactor-equipment",
			icon = "__Fission and Fusion__/graphics/icons/fission-reactor-equipment.png",
			icon_size = 32,
			placed_as_equipment_result = "undarl-fission-reactor-equipment",
			flags = {"goes-to-main-inventory"},
			subgroup = "equipment",
			order = "a[energy-source]-d",
			stack_size = 10
		},
})
