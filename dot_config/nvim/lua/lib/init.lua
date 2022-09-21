local M = {}

M.autoupdate = require('lib.autoupdate')

local keybinds = require('lib.keybinds')
M.keybind_opts = keybinds.keybind_opts
M.keybind = keybinds.keybind

M.platform = require('lib.platform')

M.run_once = require('lib.run_once')

return M
