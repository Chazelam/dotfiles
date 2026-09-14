hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:alt_shift_toggle",
        numlock_by_default = ture,

        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = 0.2, -- [-1.0, 1.0] 0 - no modification.

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
        },
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})