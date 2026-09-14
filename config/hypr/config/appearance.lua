hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 4,
        border_size = 1,
        ["col.active_border"] = "rgba(adadadff)",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = false,
        allow_tearing = false,
    },

    decoration = {
        rounding = 7,
        active_opacity = 1,
        inactive_opacity = 1,

        blur = {
            enabled = false,
        },
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
})