local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "Catppuccin Mocha",

	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "Pretendard JP" },
	}),
	font_size = 13,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,

	enable_tab_bar = false,

	window_background_opacity = 1.00,
	macos_window_background_blur = 20,

	audible_bell = "Disabled",
	visual_bell = {
		fade_in_duration_ms = 50,
		fade_out_duration_ms = 50,
	},

	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,

	disable_default_key_bindings = true,

	leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "c",
			mods = "CMD",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CMD",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnCommandInNewTab,
		},
		{
			key = "x",
			mods = "LEADER",
			action = act.CloseCurrentTab({
				confirm = true,
			}),
		},
		{
			key = "n",
			mods = "LEADER",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateTabRelative(-1),
		},
	},
}
