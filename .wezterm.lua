local wezterm = require("wezterm")

local config = {
	enable_tab_bar = false,
	font_size = 18,
	font = wezterm.font_with_fallback({ "CaskaydiaMono Nerd Font" }),
	window_background_opacity = 1,
	window_decorations = "RESIZE",
	scrollback_lines = 10000,
	macos_window_background_blur = 10,

	colors = {
		foreground = "#d5d0c9",
		background = "#181716",

		cursor_bg = "#e5a1a3",
		cursor_fg = "#181716",
		cursor_border = "#e5a1a3",
		compose_cursor = "#caa2ca",

		selection_fg = "#d5d0c9",
		selection_bg = "#383838",

		scrollbar_thumb = "#383838",
		split = "#2e2a27",

		ansi = {
			"#000000",
			"#f56e7f",
			"#bec975",
			"#f58669",
			"#42d9c5",
			"#d286b7",
			"#37cb8a",
			"#88847f",
		},
		brights = {
			"#2e2a27",
			"#e5a1a3",
			"#e8d6a7",
			"#f3b061",
			"#80c5de",
			"#c3a6cb",
			"#9ed7a8",
			"#d7c3ba",
		},
	},
}

return config
