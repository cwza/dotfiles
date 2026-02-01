local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- font
config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 24

return config
