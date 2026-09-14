local mainMod = "SUPER"

-- ============================================================
-- Helpers
-- ============================================================

local function bind(key, dispatcher, options)
    hl.bind(mainMod .. " + " .. key, dispatcher, options)
end

local function command(key, cmd, options)
    bind(key, hl.dsp.exec_cmd(cmd), options)
end

local function bind_key(key, dispatcher, options)
    hl.bind(key, dispatcher, options)
end

-- ============================================================
-- Main
-- ============================================================
command("SHIFT + B", "~/dotfiles/scripts/start_waybar.sh")


-- ============================================================
-- Application launchers
-- ============================================================
command("grave", "kitty")
command("E", "hyprfm")


-- ============================================================
-- System menus
-- ============================================================
command("SPACE", "fuzzel")
command("B", "~/dotfiles/bin/bzmenu -l fuzzel")
command("W", "nmgui")
command("Z", "~/OCR4Linux/OCR4Linux.sh --lang eng+rus")
command("SHIFT + Z", "~/OCR4Linux/OCR4Linux.sh --lang rus")


-- ============================================================
-- System actions
-- ============================================================
local function close_window_except()
    local window = hl.get_active_window()

    if window == nil then
        return
    end

    local excluded_apps = {
        obsidian = true,
        -- zen = true,
    }

    if excluded_apps[window.class] then
        return
    end

    hl.dispatch(hl.dsp.window.close())
end

bind("Q", close_window_except)
command("L", "hyprlock")
command("SHIFT + I", "~/dotfiles/scripts/window_info.sh")
command("SHIFT + D", "vscodium ~/dotfiles/")


-- ============================================================
-- Screenshots and recording
-- ============================================================
bind_key("PRINT", hl.dsp.exec_cmd("hyprshot-gui"))
command("SHIFT + S", "hyprshot -z -m region")
bind_key("SUPER + PRINT", hl.dsp.exec_cmd("kooha"))


-- ============================================================
-- Window state
-- ============================================================
bind("F", hl.dsp.window.float({ action = "toggle" }))
bind("SHIFT + F", hl.dsp.window.fullscreen())


-- ============================================================
-- Clipboard
-- ============================================================
command("V", "~/dotfiles/scripts/cliphist-fuzzel-img.sh")


-- ============================================================
-- Window control
-- ============================================================

-- Resize window
local resize_binds = {
    { key = "SHIFT + LEFT",  x = -50, y = 0 },
    { key = "SHIFT + RIGHT", x = 50,  y = 0 },
    { key = "SHIFT + UP",    x = 0,   y = -50 },
    { key = "SHIFT + DOWN",  x = 0,   y = 50 },
}

for _, item in ipairs(resize_binds) do
    bind(
        item.key,
        hl.dsp.window.resize({
            x = item.x,
            y = item.y,
            relative = true,
        }),
        { repeating = true }
    )
end

-- Move focus
local focus_binds = {
    { key = "LEFT",  direction = "l" },
    { key = "RIGHT", direction = "r" },
    { key = "UP",    direction = "u" },
    { key = "DOWN",  direction = "d" },
}

for _, item in ipairs(focus_binds) do
    bind(
        item.key,
        hl.dsp.focus({
            direction = item.direction,
        })
    )
end


-- Mouse window control

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + SHIFT + mouse:272",
    hl.dsp.window.resize(),
    { mouse = true }
)


-- ============================================================
-- Workspaces
-- ============================================================
local function workspace_binds(workspace, key)
    bind(key, hl.dsp.focus({ workspace = workspace }))
    bind(
        "SHIFT + " .. key,
        hl.dsp.window.move({ workspace = workspace })
    )
end


-- Workspaces 1–5

for i = 1, 5 do
    workspace_binds(i, tostring(i))
end


-- Workspaces 6–10

for i = 6, 10 do
    local key = "F" .. (i - 5)
    workspace_binds(i, key)
end


-- ============================================================
-- Function keys
-- ============================================================
local fn_binds = {
    {
        key = "XF86AudioRaiseVolume",
        command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+",
        options = { repeating = true },
    },
    {
        key = "XF86AudioLowerVolume",
        command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
        options = { repeating = true },
    },
    {
        key = "XF86AudioMute",
        command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    },
    {
        key = "XF86AudioMicMute",
        command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    },
    {
        key = "XF86MonBrightnessUp",
        command = "brightnessctl s 10%+",
        options = { repeating = true },
    },
    {
        key = "XF86MonBrightnessDown",
        command = "brightnessctl s 10%-",
        options = { repeating = true },
    },
    {
        key = "XF86AudioNext",
        command = "playerctl next",
        options = { locked = true },
    },
    {
        key = "XF86AudioPause",
        command = "playerctl play-pause",
        options = { locked = true },
    },
    {
        key = "XF86AudioPlay",
        command = "playerctl play-pause",
        options = { locked = true },
    },
    {
        key = "XF86AudioPrev",
        command = "playerctl previous",
        options = { locked = true },
    },
}

for _, item in ipairs(fn_binds) do
    bind_key(
        item.key,
        hl.dsp.exec_cmd(item.command),
        item.options
    )
end