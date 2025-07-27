local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.color_scheme_dirs = { wezterm.config_dir }

config.default_prog = { 'pwsh' }

config.audible_bell = "Disabled"
config.enable_scroll_bar = true

config.initial_cols = 120
config.initial_rows = 28

-- config.font = wezterm.font('Symbols Nerd Font Mono')
-- config.font = wezterm.font('JetBrains Mono Bold')
config.font = wezterm.font('Cascadia Mono')
config.font_size = 12

config.window_frame = {
  font = wezterm.font 'Cascadia Mono',
  font_size = 10,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config = (require 'windows')(config)
end

config.keys = require 'keys'

return config
