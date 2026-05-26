---@type HL.WorkspaceRuleSpec[]
local workspace_rules = {
  {
    workspace = 'special:term',
    gaps_out = 300,
    layout = 'scrolling',
    layout_opts = {
      direction = 'right',
    },
    on_created_empty = Vars.terminal.cmd,
  },
  {
    workspace = 'n[s:special:term]w[v1]',
    gaps_out = { top = 300, bottom = 300, left = 1200, right = 1200 },
    layout = 'scrolling',
    layout_opts = {
      direction = 'right',
    },
    on_created_empty = Vars.terminal.cmd,
  },
  {
    workspace = 'special:discord',
    gaps_out = { top = 300, bottom = 300, left = 1200, right = 1200 },
    on_created_empty = 'discord',
  },
  {
    workspace = 'special:whatsapp',
    gaps_out = { top = 300, bottom = 300, left = 1200, right = 1200 },
    on_created_empty = 'brave --app=https://web.whatsapp.com',
  },
  {
    workspace = 'special:teamspeak3',
    gaps_out = { top = 300, bottom = 300, left = 1200, right = 1200 },
    on_created_empty = 'teamspeak3',
  },
  {
    workspace = 'special:game',
  },
  {
    workspace = 'special:slack',
    gaps_out = { top = 300, bottom = 300, left = 1200, right = 1200 },
    on_created_empty = 'brave --app=https://app.slack.com/client',
  },
}

---@type HL.WindowRuleSpec[]
local window_rules = {
  -- special workspaces
  {
    match = {
      class = 'discord',
    },
    workspace = 'special:discord',
  },
  {
    match = {
      class = [[brave-web\.whatsapp\.com__-.*]],
    },
    workspace = 'special:whatsapp',
  },
  {
    match = {
      class = 'teamspeak3',
    },
    workspace = 'special:teamspeak3',
    float = true,
  },
  {
    match = {
      class = [[brave-app\.slack\.com__client-.*]],
    },
    workspace = 'special:slack',
  },
  {
    match = {
      class = 'gamescope',
    },
    workspace = 'special:game',
    float = true,
    center = true,
  },
  {
    match = {
      class = [[steam_app_.*]],
    },
    workspace = 'special:game',
    float = true,
    center = true,
  },
  -- always floating windows
  {
    match = {
      class = [[org\.pulseaudio\.pavucontrol]],
    },
    float = true,
    center = true,
  },
  {
    match = {
      class = 'hyprland-run',
    },
    float = true,
  },
  -- fix dragging issues with xwayland
  {
    match = {
      class = [[^$]],
      title = [[^$]],
      xwayland = true,
      float = true,
      fullscreen = false,
      pin = false,
    },
    no_focus = true
  },
  -- suppress maximize request from all apps
  {
    match = {
      class = '.*',
    },
    suppress_event = 'maximize',
  },
}

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})

for _, ws in ipairs(workspace_rules) do
  hl.workspace_rule(ws)
end

for _, wr in ipairs(window_rules) do
  hl.window_rule(wr)
end
