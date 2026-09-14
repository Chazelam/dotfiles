local animation_speed = 1.5
local animations_enabled = true

hl.config({
    animations = {
        enabled = animations_enabled,
    },
})

if animations_enabled then
    hl.curve("myBezier", {
        type = "bezier",
        points = {
            { 0.05, 0.9 },
            { 0.1, 1.05 },
        },
    })

    hl.animation({
        leaf = "windows",
        enabled = true,
        speed = 7 / animation_speed,
        bezier = "myBezier",
    })

    hl.animation({
        leaf = "windowsOut",
        enabled = true,
        speed = 7 / animation_speed,
        bezier = "default",
        style = "popin 80%",
    })

    hl.animation({
        leaf = "border",
        enabled = true,
        speed = 10 / animation_speed,
        bezier = "default",
    })

    hl.animation({
        leaf = "borderangle",
        enabled = true,
        speed = 8 / animation_speed,
        bezier = "default",
    })

    hl.animation({
        leaf = "fade",
        enabled = true,
        speed = 7 / animation_speed,
        bezier = "default",
    })

    hl.animation({
        leaf = "workspaces",
        enabled = true,
        speed = 3 / animation_speed,
        bezier = "default",
    })
end