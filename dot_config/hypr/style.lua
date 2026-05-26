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
    workspace_wraparound = true,
  },
})

hl.curve('almost_linear', { type = 'bezier', points= { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points= { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({
  leaf = 'global',
  enabled = false,
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
