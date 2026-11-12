hl.config({
  input = {
    kb_layout = 'us',
    kb_options = 'compose:ralt',
    numlock_by_default = true,
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
    },
  },
  cursor = {
    persistent_warps = true,
  },
})

hl.gesture({
  fingers = 3,
  direction = 'vertical',
  action = 'workspace',
})
