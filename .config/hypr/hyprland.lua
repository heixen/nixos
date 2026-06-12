-- =============================================
-- Hyprland Lua Configuration
-- =============================================

local mainMod = "SUPER"


-- Monitors
hl.monitor({
  output = "eDP-1",
  mode = "1360x768@60",
  position = "0x0",
  scale = "1",
})

-- Environment variables
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")

-- Curves & Animations
hl.curve("myBezier", {
  type = "bezier",
  points = { { 0.05, 0.9 }, { 0.1, 1.05 } }
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Gestures
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Window Rules
hl.window_rule({
  match = { class = "kitty" },
  float = true,
})

-- Layer Rules
hl.layer_rule({
  match = { namespace = "fuzzel" },
  blur = true,
  ignore_alpha = 0.1,
  animation = "slide top",
})

-- Keybinds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprlauncher")) -- assuming this is your $menu
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("fuzzel drun"))

-- More binds (I kept most of yours)
hl.bind(mainMod .. " + G", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

-- Brightness & Volume
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +2%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 2%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Screenshot
hl.bind(mainMod .. " + I",
  hl.dsp.exec_cmd('grim "$(date +"%Y-%m-%d_%H:%M:%S.png")" && notify-send "Grim" "$(date +"%Y-%m-%d_%H:%M:%S.png")"'))

-- Navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ direction = "right" }))

for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Resize & Move with keys
hl.bind(mainMod .. " + L", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + H", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + K", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + J", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ x = 0, y = 100, relative = true }))

-- General Settings
hl.config({
  input = {
    kb_layout = "us, ru, ara",
    kb_options = "grp:alt_shift_toggle",
    follow_mouse = 1,
    touchpad = { natural_scroll = true },
    sensitivity = 0,
  },
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
    col = {
      active_border = { colors = { "rgba(7EBAE4ee)", "rgba(5277C3ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    layout = "dwindle",
    allow_tearing = false,
  },
  decoration = {
    rounding = 0,
    blur = {
      enabled = true,
      size = 10,
      passes = 3,
      ignore_opacity = false,
    },
    shadow = {
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },
  animations = { enabled = true },
  dwindle = { preserve_split = true },
  master = { new_status = "true" },
  misc = { force_default_wallpaper = 0 },
})

-- Startup
hl.on("hyprland.start", function()
  hl.exec_cmd("~/.config/hypr/scripts/suspend.sh")
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("awww img ~/wallpapers/a.jpg")
  hl.exec_cmd("wl-paste -t text --watch clipman store --no-persist")
  hl.exec_cmd("udiskie")
end)
