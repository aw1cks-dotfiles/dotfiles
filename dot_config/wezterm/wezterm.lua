local wezterm = require 'wezterm';

-- Get our current OS
local osname = "Windows"; -- Only non-POSIX OSes won't work with the detection method
local fh, _ = io.popen("uname 2>/dev/null", "r");
if fh then
	osname = fh:read();
end

-- Consts
local primary_modifier = "ALT";
local secondary_modifier = "ALT|SHIFT";

local font_name = {
  {family = "Iosevka", stretch = "UltraCondensed"},
  "JoyPixels",
  "Noto Color Emoji",
};
local font_size = 14;

local decorations = "TITLE | RESIZE";
local initial_window_width = 80;
local initial_window_height = 24;

local pane_increment = 5;

local window_pad_margin = 16;

-- Custom macOS overrides
if osname == "Darwin" then
  primary_modifier = "SUPER";
  secondary_modifier = "SUPER|SHIFT";
  font_name = {
    {family = "Iosevka Nerd Font Mono", stretch = "UltraCondensed"},
    "Apple Color Emoji",
  };
  font_size = 20;
  initial_window_width = 120;
  initial_window_height = 36;
  window_pad_margin = 24;
end

-- Custom Linux overrides
if osname == "Linux" then
	decorations = "NONE";
end

-- Custom Windows overrides
if osname == "Windows" then
  do end
end

return {
  --
  keys = {
    -- Splits
    {
      key    = "[",
      mods   = primary_modifier,
      action = wezterm.action{
        SplitHorizontal = {domain = "CurrentPaneDomain"},
      },
    },
    {
      key    = "]",
      mods   = primary_modifier,
      action = wezterm.action{
        SplitVertical = {domain = "CurrentPaneDomain"},
      },
    },
    -- Move between panes
    {
      key    = "LeftArrow",
      mods   = primary_modifier,
      action = wezterm.action{
        ActivatePaneDirection = "Left",
      },
    },
    {
      key    = "RightArrow",
      mods   = primary_modifier,
      action = wezterm.action{
        ActivatePaneDirection = "Right",
      },
    },
    {
      key    = "UpArrow",
      mods   = primary_modifier,
      action = wezterm.action{
        ActivatePaneDirection = "Up",
      },
    },
    {
      key    = "DownArrow",
      mods   = primary_modifier,
      action = wezterm.action{
        ActivatePaneDirection = "Down",
      },
    },
    -- Resize panes
    {
      key    = "LeftArrow",
      mods   = secondary_modifier,
      action = wezterm.action{
        AdjustPaneSize = {"Left", pane_increment}
      },
    },
    {
      key    = "RightArrow",
      mods   = secondary_modifier,
      action = wezterm.action{
        AdjustPaneSize = {"Right", pane_increment}
      },
    },
    {
      key    = "UpArrow",
      mods   = secondary_modifier,
      action = wezterm.action{
        AdjustPaneSize = {"Up", pane_increment}
      },
    },
    {
      key    = "DownArrow",
      mods   = secondary_modifier,
      action = wezterm.action{
        AdjustPaneSize = {"Down", pane_increment}
      },
    },
    -- Tabs
    {
      key    = "t",
      mods   = secondary_modifier,
      action = wezterm.action{
        SpawnTab = "CurrentPaneDomain"
      },
    },
    {
      key    = "1",
      mods   = primary_modifier,
      action ={
        ActivateTab = 0
      },
    },
    {
      key    = "2",
      mods   = primary_modifier,
      action ={
        ActivateTab = 1
      },
    },
    {
      key    = "3",
      mods   = primary_modifier,
      action ={
        ActivateTab = 2
      },
    },
    {
      key    = "4",
      mods   = primary_modifier,
      action ={
        ActivateTab = 3
      },
    },
    {
      key    = "5",
      mods   = primary_modifier,
      action ={
        ActivateTab = 4
      },
    },
    {
      key    = "6",
      mods   = primary_modifier,
      action ={
        ActivateTab = 5
      },
    },
    {
      key    = "7",
      mods   = primary_modifier,
      action ={
        ActivateTab = 6
      },
    },
    {
      key    = "8",
      mods   = primary_modifier,
      action ={
        ActivateTab = 7
      },
    },
    {
      key    = "9",
      mods   = primary_modifier,
      action ={
        ActivateTab = 8
      },
    },
    {
      key    = "0",
      mods   = primary_modifier,
      action ={
        ActivateTab = 10
      },
    },
  },
  --
  font = wezterm.font_with_fallback(font_name),
  font_size = font_size,
  freetype_load_flags = "NO_HINTING|MONOCHROME",
  colors = {
    background = "#181818",
    selection_bg = "#8d9e9b",

    foreground = "#d8d8d8",
    selection_fg = "#000000",

    cursor_bg = "#52ad70",
    cursor_fg = "#52ad70",
    cursor_border = "#52ad70",

    split = "#21385c",

    visual_bell = "#d8d8d8",

    -- ansi = {"black", "maroon", "green", "olive", "navy", "purple", "teal", "silver"},
    -- brights = {"grey", "red", "lime", "yellow", "blue", "fuchsia", "aqua", "white"},
    ansi    = {"#181818", "#ab4642", "#a1b56c", "#f7ca88", "#7cafc2", "#ba8baf", "#86c1b9", "#d8d8d8"},
    brights = {"#585858", "#ab4642", "#a1b56c", "#f7ca88", "#7cafc2", "#ba8baf", "#86c1b9", "#f8f8f8"},
  },
	inactive_pane_hsb = {
		saturation = 0.4,
		brightness = 0.5,
	},
  window_decorations = decorations,
  window_background_opacity = 0.85,
  window_padding = {
    left = window_pad_margin,
    right = window_pad_margin,
    top = window_pad_margin,
    bottom = window_pad_margin,
  },
  tab_max_width = 64,
  --
  visual_bell = {
    fade_in_function = "Linear",
    fade_in_duration_ms = 100,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 100,
  },
  --
  default_cursor_style = "BlinkingUnderline",
  cursor_blink_rate = 400,
  --
  hide_tab_bar_if_only_one_tab = true,
  --
  exit_behavior = "Close",
  --
  initial_cols = initial_window_width,
  initial_rows = initial_window_height,
}
