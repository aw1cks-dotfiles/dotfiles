local helpers = require("helpers")
local wezterm = require("wezterm")


local function modifier(platform)
  local prefix = {
    ["darwin"] = "SUPER",
    ["posix"] = "SUPER"
  }
  return helpers.table_lookup(prefix, platform, "ALT")
end

local function platform_specific_binds(platform)
  local binds = {
    ["darwin"] = {
      {
        key    = "b",
        mods   = "OPT",
        action = wezterm.action{
          SendKey = {key="b", mods="ALT"},
        }
      },
      {
        key    = "d",
        mods   = "OPT",
        action = wezterm.action{
          SendKey = {key="d", mods="ALT"},
        }
      },
      {
        key    = "f",
        mods   = "OPT",
        action = wezterm.action{
          SendKey = {key="f", mods="ALT"},
        }
      },
      {
        key    = "s",
        mods   = "OPT",
        action = wezterm.action{
          SendKey = {key="s", mods="ALT"},
        }
      },
      {
        key    = "raw:10",
        mods   = "SHIFT",
        action = wezterm.action{
          SendKey = {key="~"},
        }
      },
      {
        key    = "raw:10",
        action = wezterm.action{
          SendKey = {key="~"},
        }
      },
    },
  }

  return helpers.table_lookup(binds, platform, {})
end


local M = {}

function M.apply(config)
  local pane_increment = 5

  local primary_modifier = modifier(helpers.platform)
  local secondary_modifier = primary_modifier .. "|SHIFT"

  local platform_binds = platform_specific_binds(helpers.platform)
  config.keys = {
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
    table.unpack(platform_binds),
  }
end

return M
