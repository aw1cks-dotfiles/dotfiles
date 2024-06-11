local helpers = require("helpers")
local wezterm = require("wezterm")


local function background(config)
  config.macos_window_background_blur = 20
  config.win32_system_backdrop = "Acrylic"

  local opacity = {
    ["darwin"] = 0.75,
  }
  config.window_background_opacity = helpers.table_lookup(opacity, helpers.platform, 0.85)
end


local function colour_scheme(config)
  config.color_scheme = "Oxocarbon Dark"
end


local function cursor(config)
  config.default_cursor_style = "BlinkingUnderline"
  config.cursor_blink_rate = 400
end


local function font(config)
  config.freetype_load_flags = "NO_HINTING|MONOCHROME"

  local emoji_fonts = {
    ["darwin"]  = "Apple Color Emoji",
    ["windows"] = "Segoe UI",
  }
  local emoji_font = helpers.table_lookup(emoji_fonts, helpers.platform, "JoyPixels")
  local font_faces = {
    { family = "CaskaydiaCove NFM", weight = "Medium" },
    emoji_font,
  }
  config.font = wezterm.font_with_fallback(font_faces)

  local font_size = {
    ["darwin"] = 16,
  }
  config.font_size = helpers.table_lookup(font_size, helpers.platform, 14)
end


local function inactive_pane(config)
  config.inactive_pane_hsb = {
    saturation = 0.4,
    brightness = 0.5,
  }
end


local function visual_bell(config)
  config.visual_bell = {
    fade_in_function     = "Linear",
    fade_in_duration_ms  = 100,
    fade_out_function    = "EaseOut",
    fade_out_duration_ms = 100,
  }
  config.colors = {
    visual_bell = "#202020",
  }
end


local function window_settings(config)
  local initial_window_width = {
    ["darwin"] = 120,
  }
  local initial_window_height = {
    ["darwin"] = 36,
  }
  config.initial_cols = helpers.table_lookup(initial_window_width, helpers.platform, 80)
  config.initial_rows = helpers.table_lookup(initial_window_height, helpers.platform, 24)

  config.tab_max_width = 32
  config.hide_tab_bar_if_only_one_tab = true

  local window_decorations = {
    ["linux"] = "NONE",
  }
  config.window_decorations = helpers.table_lookup(window_decorations, helpers.platform, "TITLE | RESIZE")

  local window_pad_margin = {
    ["darwin"] = "1.75%",
  }
  local window_padding = helpers.table_lookup(window_pad_margin, helpers.platform, 16)
  config.window_padding = {
    left = window_padding,
    right = window_padding,
    top = window_padding,
    bottom = window_padding,
  }
end


local M = {}

function M.apply(config)
  background(config)
  colour_scheme(config)
  cursor(config)
  font(config)
  inactive_pane(config)
  window_settings(config)
  visual_bell(config)
end

return M
