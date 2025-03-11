-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color schemes
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font("Cascadia Mono")
config.font_size = 21

-- Background
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50

-- Window
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.initial_rows = 35
config.initial_cols = 100

-- Keyboard
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().main
	local ratio = 0.7
	local width, height = screen.width * ratio, screen.height * ratio
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
	})
	-- window:gui_window():maximize()
	window:gui_window():set_inner_size(width, height)
end)

-- and finally, return the configuration to wezterm
return config
