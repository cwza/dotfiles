local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- window size
config.initial_rows = 20
config.initial_cols = 100

-- font
config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 24

-- key
config.keys = {
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendKey { key = 'b', mods = 'ALT' },
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
    },
}

return config