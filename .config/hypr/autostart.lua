-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Idle daemon: keyboard-receiver autosuspend gate + auto-suspend.
-- Config: hypr/hypridle.conf. Omarchy's own quickshell idle plugin only
-- handles lock (and the display-off that follows it) plus the stock terminal
-- screensaver.
-- Started by the packaged hypridle.service (WantedBy=graphical-session.target).
-- Do NOT launch it here too: two hypridle instances run the same listeners and
-- fight over DPMS, turning the screen off and on underneath each other.
-- o.launch_on_start("hypridle")

-- Video wallpaper: start only after Hyprland is ready, and keep it looping.
hl.on("hyprland.start", function()
  hl.exec_cmd('mpvpaper -f -o "no-audio --loop-file=inf --panscan=1" DP-2 /home/jcajigas/Downloads/systemd_torvalds_1080p_16x9.mp4')
end)
