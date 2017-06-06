data:extend(
{
	{
        type = "bool-setting",
        name = "undarl-enable-fission",
        setting_type = "startup",
        default_value = true,
        order = "fandf-a-a",
    },
	{
        type = "bool-setting",
        name = "undarl-enable-radioisotopes",
        setting_type = "startup",
        default_value = true,
        order = "fandf-a-b",
    },
	{
        type = "bool-setting",
        name = "undarl-enable-fusion",
        setting_type = "startup",
        default_value = true,
        order = "fandf-a-c",
    },
	{
        type = "string-setting",
        name = "undarl-fast-rtg-recycling",
        setting_type = "startup",
        default_value = "50%",
		allowed_values = {"none", "25%", "50%", "75%"},
        order = "fandf-a-d",
    },
	{
        type = "string-setting",
        name = "undarl-fast-rtg-recycling-facility",
        setting_type = "startup",
        default_value = "chem plant",
		allowed_values = {"chem plant", "centrifuge"},
        order = "fandf-a-e",
    },
	{
        type = "string-setting",
        name = "undarl-reactor-output",
        setting_type = "startup",
        default_value = "60MW",
		allowed_values = {"40MW", "60MW", "80MW"},
        order = "fandf-a-f",
    },
})
