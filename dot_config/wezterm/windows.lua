local wezterm = require 'wezterm'

return function(config) 
  local launch_menu = config.launch_menu or {}

  table.insert(launch_menu, {
    label = 'pwsh',
    args = { 'pwsh.exe' },
  })

  -- Find installed visual studio version(s) and add their compilation
  -- environment command prompts to the menu
  for _, vsvers in ipairs(wezterm.glob('Microsoft Visual Studio/20*/*', 'C:/Program Files')) do
    local year = vsvers:gsub('Microsoft Visual Studio/', '')
    table.insert(launch_menu, {
      label = 'x64 Developer PowerShell VS ' .. year,
      args = {
        'pwsh',
        '-NoExit',
        '-Command',
        '&{&"C:/Program Files/' .. vsvers .. '/Common7/Tools/Launch-VsDevShell.ps1" -SkipAutomaticLocation -Arch amd64 -HostArch amd64}'
      },
    })
  end

  config.launch_menu = launch_menu
  return config
end
