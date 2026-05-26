return {
  terminal = {
    cmd = 'kitty',
    class = 'kitty',
  },
  file_manager = {
    cmd = 'dolphin',
  },
  menu = {
    cmd = 'rofi -modes drun -show drun',
    cmd_calc = 'rofi -modes calc -show calc',
  },
  browser = {
    cmd = 'brave',
    cmd_private = 'brave --incognito',
  },
  audio = {
    cmd_mic_mute = 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1',
    cmd_mic_unmute = 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0',
    cmd_vol_ctrl = 'pavucontrol',
    cmd_vol_up = 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+',
    cmd_vol_down = 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-',
    cmd_vol_toggle = 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle',
    cmd_mic_toggle = 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle',
    cmd_play = 'playerctl play-pause',
    cmd_prev = 'playerctl previous',
    cmd_next = 'playerctl next',
  },
  monitor = {
    cmd_brightness_up = 'brightnessctl -e4 -n2 set 5%+',
    cmd_brightness_down = 'brightnessctl -e4 -n2 set 5%-',
  },
}
