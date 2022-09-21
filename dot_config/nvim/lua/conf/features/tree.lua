-- vim.g.loaded = 0
-- vim.g.loaded_netrwPlugin = 0

if not require('lib').autoupdate({
  func = function()
    require('chadtree').Deps()
  end,
  path = vim.fn.stdpath('data') .. '/chadtree-updated'
}) then
  vim.g.chadtree_settings = {
    profiling = false,
  }
  require('lib').keybind('n', '<Leader>t', function() require('chadtree').Open() end)

  vim.cmd [[
    augroup Chad
      autocmd!
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
    augroup END
  ]]
end
