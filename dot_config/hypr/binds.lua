---@param ... string
---@return string
local with_mod = function(...)
  local s = 'SUPER'
  for _, key in ipairs({...}) do
    s = s .. ' + ' .. key
  end
  return s
end

hl.bind(with_mod('w'), hl.dsp.window.close())
hl.bind(with_mod('q'), hl.dsp.window.kill())
hl.bind(with_mod('f'), hl.dsp.window.float('toggle'))
hl.bind(with_mod('f11'), hl.dsp.window.fullscreen('maximized', 'toggle'))
hl.bind(with_mod('SHIFT', 'f11'), hl.dsp.window.fullscreen('fullscreen', 'toggle'))

-- launch apps
hl.bind(with_mod('return'), hl.dsp.exec_cmd(Vars.terminal.cmd))
hl.bind(with_mod('space'), hl.dsp.exec_cmd(Vars.menu.cmd))
hl.bind(with_mod('ALT', 'space'), hl.dsp.exec_cmd(Vars.menu.cmd_calc))
hl.bind(with_mod('e'), hl.dsp.exec_cmd(Vars.file_manager.cmd))
hl.bind(with_mod('b'), hl.dsp.exec_cmd(Vars.browser.cmd))
hl.bind(with_mod('SHIFT', 'b'), hl.dsp.exec_cmd(Vars.browser.cmd_private))

-- dwindle layout
hl.bind(with_mod('j'), hl.dsp.layout('togglesplit'))
hl.bind(with_mod('SHIFT', 'j'), hl.dsp.layout('swapsplit'))

-- window movement
for _, dir in ipairs({ 'left', 'right', 'up', 'down' }) do
  -- move focus
  hl.bind(with_mod(dir), hl.dsp.focus({ direction = dir }))
  -- move active window
  hl.bind(with_mod('SHIFT', dir), hl.dsp.window.move({ direction = dir }))
  -- swap active window
  hl.bind(with_mod('ALT', dir), hl.dsp.window.swap({ direction = dir }))
end
-- resize active window
hl.bind(with_mod('CTRL', 'left'), hl.dsp.window.resize({ x = -10, y = 0 }), { repeating = true })
hl.bind(with_mod('CTRL', 'right'), hl.dsp.window.resize({ x = 10, y = 0 }), { repeating = true })
hl.bind(with_mod('CTRL', 'up'), hl.dsp.window.resize({ x = 0, y = -10 }), { repeating = true })
hl.bind(with_mod('CTRL', 'down'), hl.dsp.window.resize({ x = 0, y = 10 }), { repeating = true })
-- move/resize with mouse
hl.bind(with_mod('mouse:272'), hl.dsp.window.drag())
hl.bind(with_mod('mouse:273'), hl.dsp.window.resize())

-- cycle workspaces
hl.bind(with_mod('page_up'), hl.dsp.focus({ workspace = 'm-1', }))
hl.bind(with_mod('page_down'), hl.dsp.focus({ workspace = 'm+1' }))
-- switch workspace
for i = 1, 10 do
  hl.bind(with_mod(tostring(i % 10)), hl.dsp.focus({ workspace = i }))
end
-- move active window to workspace
for i = 1, 10 do
  hl.bind(with_mod('SHIFT', tostring(i % 10)), hl.dsp.window.move({workspace = i, follow = true }))
end

-- special workspaces
local state_dir = function()
  return (os.getenv('XDG_STATE_HOME') or '.local/state') .. '/hyprland/mknejp'
end
local last_special_workspace_file = function()
  return state_dir() .. '/last_special_workspace'
end
local read_last_special_workspace = function()
  local f = io.open(last_special_workspace_file(), 'r')
  if (f) then
    local s = f:read('a')
    f:close()
    return s
  end
  return ''
end
local last_special_workspace = read_last_special_workspace()
local write_last_special_workspace = function(s)
  os.execute('mkdir -p "' .. state_dir() .. '"')
  local f = assert(io.open(last_special_workspace_file(), 'w+'))
  if (f) then
    f:write(s)
    f:close()
  end
  last_special_workspace = s
end

hl.bind(with_mod('SHIFT', 'return'), hl.dsp.workspace.toggle_special('term'))
hl.bind(with_mod('escape'), function()
  local ws = hl.get_active_special_workspace('current')
--  error(ws)
  if (ws) then
    local name = ws.name:gsub('^special:', '')
    write_last_special_workspace(name)
    hl.dispatch(hl.dsp.workspace.toggle_special(name))
  else
    hl.dispatch(hl.dsp.workspace.toggle_special(last_special_workspace))
  end
end)
---@param s string name of special workspace without 'special:' prefix
---@return fun(): nil
local toggle_special_workspace = function(s)
  return function()
    write_last_special_workspace(s)
    hl.dispatch(hl.dsp.workspace.toggle_special(s))
  end
end

---@param key string
---@param f function(): nil
local bind_with_and_without_mod = function(key, f)
  hl.bind(with_mod(key), f)
  hl.bind(key, f)
end

-- submap for comms
hl.bind(with_mod('c'), hl.dsp.submap('comms'))
hl.define_submap('comms', 'reset', function()
  bind_with_and_without_mod('d', toggle_special_workspace('discord'))
  bind_with_and_without_mod('w', toggle_special_workspace('whatsapp'))
  bind_with_and_without_mod('t', toggle_special_workspace('teamspeak3'))
  bind_with_and_without_mod('s', toggle_special_workspace('slack'))
  hl.bind('catchall', hl.dsp.submap('reset'))
end)

-- audio controls
hl.bind(with_mod('m'), hl.dsp.exec_cmd(Vars.audio.cmd_mic_mute))
hl.bind(with_mod('SHIFT', 'm'), hl.dsp.exec_cmd(Vars.audio.cmd_mic_unmute))
hl.bind(with_mod('a'), hl.dsp.submap('audio'))
hl.define_submap('audio', 'reset', function()
  hl.bind('v', hl.dsp.exec_cmd(Vars.audio.cmd_vol_ctrl))
  hl.bind('catchall', hl.dsp.submap('reset'))
end)

-- media keys
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd(Vars.audio.cmd_vol_up), { repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd(Vars.audio.cmd_vol_down), { repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd(Vars.audio.cmd_vol_toggle), { locked = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd(Vars.audio.cmd_mic_toggle), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd(Vars.audio.cmd_play), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd(Vars.audio.cmd_play), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd(Vars.audio.cmd_prev), { locked = true })
hl.bind('XF86AudioNext', hl.dsp.exec_cmd(Vars.audio.cmd_next), { locked = true })

-- submap for gaming
hl.bind(with_mod('g'),hl.dsp.submap('gaming'))
hl.define_submap('gaming', 'reset', function()
  bind_with_and_without_mod('g', toggle_special_workspace('gaming'))
  hl.bind('catchall', hl.dsp.submap('reset'))
end)

-- system functions
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd(Vars.monitor.cmd_brightness_up))
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd(Vars.monitor.cmd_brightness_down))
