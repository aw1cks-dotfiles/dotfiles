local wezterm = require("wezterm")


local function platform()
  -- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
  local wezterm_platform = wezterm.target_triple

  local discovered_platform = "posix" -- seems like a sensible fallback?

  if string.find(wezterm_platform, "apple-darwin", 1, true) then
    discovered_platform = "darwin"
  elseif string.find(wezterm_platform, "linux", 1, true) then
    discovered_platform = "linux"
  elseif string.find(wezterm_platform, "pc-windows", 1, true) then
    discovered_platform = "windows"
  end

  wezterm.log_info("Discovered platform: " .. discovered_platform)
  return discovered_platform
end

-- https://stackoverflow.com/a/76732475
local function want(name)
  local out; if xpcall(
      function()  out = require(name) end,
      function(e) out = e end)
  then return out
  else return nil end
end

local M = {}

M.platform = platform()

function M.table_lookup(tab, k, default_val)
  if tab[k] then
    return tab[k]
  end

  return default_val
end


function M.load_overrides(config)
  local overrides = want("overrides")
  if overrides then
    wezterm.log_info("Loaded local overrides")
    overrides.apply(config)
  end
end

return M
