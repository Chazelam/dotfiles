-- ============================================================================
-- Default window behavior
-- ============================================================================

-- Applications that should remain tiled.
local tile_classes = {
    "kitty",
    "codium",
    "obsidian",
    "zen",
    "hyprfm",
}

-- Window titles excluded from the default floating rule.
local excluded_titles = {
    ".*Network Manager.*",
    "^Volume Control$",
    "^Picture-in-Picture$",
    ".*Hyprshot.*",
}

local tile_regex = "negative:^(" .. table.concat(tile_classes, "|") .. ")$"
local excluded_title_regex = "negative:^(" .. table.concat(excluded_titles, "|") .. ")$"

-- Float and center all windows except tiled applications and special windows.
hl.window_rule({
    name = "default-float-center",
    match = {
        initial_class = tile_regex
        -- initial_title = excluded_title_regex,
    },
    float = true,
    center = true,
})


-- ============================================================================
-- Special application windows
-- ============================================================================

hl.window_rule({
    name = "telegram",
    match = {
        initial_class = "org.telegram.desktop",
    },
    size = { 1100, 900 },
})

-- Network Manager: float, pin, and position near the top-right corner.
hl.window_rule({
    name = "network-manager",
    match = {
        initial_class = "com.network.manager",
    },
    float = true,
    pin = true,
    move = {
        "(monitor_w * 0.762)",
        "(monitor_h * 0.03)",
    },
})


-- Volume Control: float, pin, position, and set a fixed size.
hl.window_rule({
    name = "volume-control",
    match = {
        initial_class = "org.pulseaudio.pavucontrol",
    },
    float = true,
    pin = true,
    move = {
        "(monitor_w * 0.575)",
        "(monitor_h * 0.03)",
    },
    size = { 800, 400 },
})




-- Title: Picture-in-Picture
-- Class: zen
-- Executable path: /opt/zen-browser-bin/zen-bin
-- Resolution: 950x1042

-- Picture-in-Picture: float, pin, and position near the top-right corner.
-- Zen uses the same class for regular browser windows, so the title is
-- also required to identify the Picture-in-Picture window.
hl.window_rule({
    name = "picture-in-picture",
    match = {
        initial_class = "zen",
        initial_title = "Picture-in-Picture",
    },
    float = true,
    pin = true,
    move = {
        "(monitor_w * 0.695)",
        "(monitor_h * 0.04)",
    },
    size = { 576, 324 },
})


-- Hyprshot: float and pin the screenshot selection window.
hl.window_rule({
    name = "hyprshot",
    match = {
        initial_class = "^python3$",
        initial_title = "Hyprshot",
    },
    float = true,
    pin = true,
})


-- ============================================================================
-- General window behavior
-- ============================================================================

-- Suppress maximize events for all windows.
hl.window_rule({
    name = "suppress-maximize",
    match = {
        initial_class = ".*",
    },
    suppress_event = "maximize",
})


-- Prevent focus issues with certain floating XWayland windows.
hl.window_rule({
    name = "fix-xwayland-dragging",
    match = {
        initial_class = "^$",
        initial_title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
