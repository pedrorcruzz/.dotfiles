local module = {}

function module.apply_to_config(config)
	config.window_decorations = "RESIZE"
	config.window_background_opacity = 0.90
	config.macos_window_background_blur = 35
	config.initial_rows = 35
	config.initial_cols = 120
	config.window_padding = {
		left = 0, --16
		right = 0, --16
		top = 0, --16
		bottom = 0, --8
	}
end

return module
