hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 2,
    col = {
      active_border = { colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' }, angle = 45 },
      inactive_border = 'rgba(595959aa)',
    },
    resize_on_border = false,
    layout = 'dwindle',
  },
  decoration = {
    rounding = 0,
    active_opacity = 1,
    inactive_opacity = 1,
    shadow = {
      enabled = false,
    },
    blur = {
      enabled = false,
    }
  },
  animations = {
    enabled = true,
  },
})

--[[
global
  ↳ windows - styles: slide, popin, gnomed
    ↳ windowsIn - window open - styles: same as windows
    ↳ windowsOut - window close - styles: same as windows
    ↳ windowsMove - everything in between, moving, dragging, resizing.
  ↳ layers - styles: slide, popin, fade
    ↳ layersIn - layer open
    ↳ layersOut - layer close
  ↳ fade
    ↳ fadeIn - fade in for window open
    ↳ fadeOut - fade out for window close
    ↳ fadeSwitch - fade on changing activewindow and its opacity
    ↳ fadeShadow - fade on changing activewindow for shadows
    ↳ fadeDim - the easing of the dimming of inactive windows
    ↳ fadeLayers - for controlling fade on layers
      ↳ fadeLayersIn - fade in for layer open
      ↳ fadeLayersOut - fade out for layer close
    ↳ fadePopups - for controlling fade on wayland popups
      ↳ fadePopupsIn - fade in for wayland popup open
      ↳ fadePopupsOut - fade out for wayland popup close
    ↳ fadeDpms - for controlling fade when dpms is toggled
  ↳ border - for animating the border's color switch speed
  ↳ borderangle - for animating the border's gradient angle - styles: once (default), loop
  ↳ workspaces - styles: slide, slidevert, fade, slidefade, slidefadevert
    ↳ workspacesIn - styles: same as workspaces
    ↳ workspacesOut - styles: same as workspaces
    ↳ specialWorkspace - styles: same as workspaces
      ↳ specialWorkspaceIn - styles: same as workspaces
      ↳ specialWorkspaceOut - styles: same as workspaces
  ↳ zoomFactor - animates the screen zoom
  ↳ monitorAdded - monitor added zoom animation
--]]

hl.curve('almost_linear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({
  leaf = 'global',
  enabled = false,
})
hl.animation({
  leaf = 'windows',
  enabled = true,
  speed = 0.5,
  bezier = 'quick',
  style = 'popin 87%',
})
hl.animation({
  leaf = 'workspaces',
  enabled = true,
  speed = 0.5,
  bezier = 'almost_linear',
  style = 'slidevert',
})
hl.animation({
  leaf = 'specialWorkspace',
  enabled = true,
  speed = 0.5,
  bezier = 'almost_linear',
  style = 'fade',
})
hl.animation({
  leaf = 'zoomFactor',
  enabled = true,
  speed = 7,
  bezier = 'quick',
})
