local vars = require("config.variables")

-- ============================================================================
-- Laptop configuration
-- ============================================================================

local function configure_laptop()
    if vars.display_mirror_mode then
        hl.monitor({
            output = "eDP-1",
            mode = "1920x1080@60",
            position = "0x0",
            scale = 1,
            bitdepth = 8,
        })

        hl.monitor({
            output = "HDMI-A-1",
            mode = "1920x1080@60",
            position = "auto",
            scale = 1,
            bitdepth = 8,
            mirror = "eDP-1",
        })

        return
    end

    -- Normal monitor layout
    hl.monitor({
        output = "eDP-1",
        mode = "1920x1200@60",
        position = "0x1080",
        scale = 1,
        bitdepth = 8,
    })

    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1,
        bitdepth = 8,
    })

    -- Normal workspace layout
    for i = 1, 5 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "eDP-1",
        })
    end

    for i = 6, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "HDMI-A-1",
        })
    end
end


-- ============================================================================
-- Desktop configuration
-- ============================================================================

local function configure_desktop()
    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1,
        bitdepth = 8,
    })

    for i = 1, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = "HDMI-A-1",
        })
    end
end


-- ============================================================================
-- Apply configuration
-- ============================================================================

if vars.laptop then
    configure_laptop()
else
    configure_desktop()
end