vim.g.mapleader = ','
vim.g.maplocalleader = ','

local python_path = '/usr/bin/'
local platform = require('lib').platform
if platform == 'Darwin' then
  python_path = '/opt/homebrew/bin/'
end
vim.g.python3_host_prog = python_path .. 'python3'
