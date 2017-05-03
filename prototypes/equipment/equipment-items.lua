data:extend(
{
	{
    type = "item",
    name = "undarl-portable-nuclear-fuel-cell",
    icon = "__undarl-fission-fusion__/graphics/icons/portable-nuclear-fuel-cell.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-c",
    fuel_category = "portable-nuclear",
    burnt_result = "undarl-depleted-fuel-cell",
    fuel_value = "500MJ",
    stack_size = 60
  },
  {
    type = "item",
    name = "undarl-depleted-fuel-cell",
	icon = "__undarl-fission-fusion__/graphics/icons/depleted-fuel-cell.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "j",
    stack_size = 60
  },
  {
        type = "item",
        name = "undarl-fission-reactor-equipment",
        icon = "__undarl-fission-fusion__/graphics/icons/fission-reactor-equipment.png",
        placed_as_equipment_result = "undarl-fission-reactor-equipment",
        flags = {"goes-to-main-inventory"},
        subgroup = "equipment",
        order = "a[energy-source]-c",
        stack_size = 10
    },
	{
      type = "item",
      name = "undarl-radioisotopes",
  	  icon = "__undarl-fission-fusion__/graphics/icons/radioisotopes.png",
      flags = {"goes-to-main-inventory"},
	  subgroup = "intermediate-product",
      order = "h",
      stack_size = 100
    },
	{
          type = "item",
          name = "undarl-rtg-equipment",
          icon = "__undarl-fission-fusion__/graphics/icons/rtg.png",
          placed_as_equipment_result = "undarl-rtg-equipment",
          flags = {"goes-to-main-inventory"},
          subgroup = "equipment",
          order = "a[energy-source]-c",
          stack_size = 10
      },
})
