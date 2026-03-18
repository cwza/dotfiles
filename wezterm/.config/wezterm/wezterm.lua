local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- font
config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 24

-- keys
config.keys = {
    {
        key = "F13",
        action = wezterm.action.SendKey { key = "a", mods = "CTRL" },
    },
}

return config
