local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "carbonfox"

config.font = wezterm.font_with_fallback({
	"Iosevka SS14",
	"Symbols Nerd Font Mono",
})

config.font_size = 11
config.line_height = 1.2
config.cursor_blink_rate = 800
config.enable_scroll_bar = false
config.tab_max_width = 12
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.cursor_thickness = 1
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
return config
