local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 1000 }

	local function is_vim(pane)
		local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
		return process_name == "nvim" or process_name == "vim"
	end

	local direction_keys = {
		h = "Left",
		j = "Down",
		k = "Up",
		l = "Right",
	}

	local function split_nav(resize_or_move, key)
		return {
			key = key,
			mods = resize_or_move == "resize" and "CTRL | SHIFT" or "CTRL",
			action = wezterm.action_callback(function(win, pane)
				if is_vim(pane) then
					-- pass the keys through to vim/nvim
					win:perform_action({
						SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
					}, pane)
				else
					if resize_or_move == "resize" then
						win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
					else
						win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
					end
				end
			end),
		}
	end

	config.keys = {
		{
			key = "o",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, _)
				local overrides = window:get_config_overrides() or {}

				if overrides.window_background_opacity == 0.90 then
					overrides.window_background_opacity = 1.0
					overrides.macos_window_background_blur = 0
				else
					overrides.window_background_opacity = 0.90
					overrides.macos_window_background_blur = 35
				end

				window:set_config_overrides(overrides)
			end),
		},
		{
			key = "[",
			mods = "OPT|CMD",
			action = wezterm.action.SwitchToWorkspace({
				name = "default",
			}),
		},
		{
			key = "]",
			mods = "OPT|CMD",
			action = wezterm.action.SwitchToWorkspace({
				name = "workspace",
			}),
		},

		{
			mods = "LEADER",
			-- key = "-",
			key = "[",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			-- key = "\\",
			key = "]",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "m",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			mods = "LEADER",
			key = "Space",
			action = wezterm.action.RotatePanes("Clockwise"),
		},
		{
			mods = "LEADER",
			-- key = "0",
			key = "\\",
			action = wezterm.action.PaneSelect({
				mode = "SwapWithActive",
			}),
		},
		{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
		{
			mods = "CMD",
			key = "w",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},
		split_nav("move", "h"),
		split_nav("move", "j"),
		split_nav("move", "k"),
		split_nav("move", "l"),
		-- resize panes
		split_nav("resize", "h"),
		split_nav("resize", "j"),
		split_nav("resize", "k"),
		split_nav("resize", "l"),
		{
			key = "w",
			mods = "CTRL|CMD",
			action = wezterm.action.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:perform_action(
							wezterm.action.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},
	}
end

return module
