local M = {}

M.keybind_opts = {
  noremap = true,
  silent  = true,
}
--[[
  Wrapper to bind keys
  By default, enables noremap & silent options
--]]
M.keybind = function(mode, bind, action, opts)
  if not opts then
    local opts = M.keybind_opts
  end
  vim.keymap.set(mode, bind, action, opts)
end

return M
