--[[
   Bootstrap Packer package manager.
   See https://github.com/wbthomason/packer.nvim#the-startup-function
--]]

local install_path = vim.fn.stdpath('data') 
                     .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.cmd('packadd packer.nvim')
  return true
end

return false
