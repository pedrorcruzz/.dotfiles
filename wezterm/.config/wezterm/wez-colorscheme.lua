local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Cloud (terminal.sexy)" -- "City Streets (terminal.sexy)" Cloud (terminal.sexy)
	config.colors = {
		tab_bar = {
			background = "rgba(0, 0, 0, 0.2)",
		},
		cursor_bg = "#FFF",
		cursor_border = "#FFF",
		background = "#1A1A1A", -- "#1E1E1E", #1A1A1A
	}
end

return module
