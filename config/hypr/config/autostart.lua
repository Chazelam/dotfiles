hl.on("hyprland.start", function()
    -- Wallpaper
    hl.exec_cmd("hyprpaper")

    -- Bar
    hl.exec_cmd(
        "waybar -c ~/dotfiles/config/waybar/config.jsonc " ..
        "-s ~/dotfiles/config/waybar/style.css"
    )

    -- Notifications
    hl.exec_cmd("mako")

    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Other
    -- hl.exec_cmd("flatpak run md.obsidian.Obsidian")
end)