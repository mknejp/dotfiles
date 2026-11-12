Vars = require('vars')

for _, monitor in ipairs(require('monitors')) do
  hl.monitor(monitor)
end

--hl.env('AQ_DRM_DEVICES', '/dev/dri/amd-igpu:/dev/dri/amd-dgpu')
hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')
hl.env('XCURSOR_THEME', 'broodwar')

hl.config({
  debug = {
    disable_logs = true,
  },
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = 'master',
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = false,
    focus_on_activate = true,
    middle_click_paste = false,
    disable_splash_rendering = true,
  },
})

require('inputs')
require('autorun')
require('workspaces')
require('binds')
require('style')
