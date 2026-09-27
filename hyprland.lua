-- Systemd Nostalgia theme overrides. Applied only when this theme is active,
-- on top of the neutral ~/.config/hypr/looknfeel.lua.

local active_border_color = { colors = { "rgba(7dd3fccc)", "rgba(7ea7ffcc)", "rgba(7fe3b0cc)" }, angle = 45 }
local inactive_border_color = "rgba(7a9cc088)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  decoration = {
    shadow = {
      color = "rgba(7dd3fc33)",
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(7dd3fc33)",
      },
    },
  },
})
