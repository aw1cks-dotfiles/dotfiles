local on_attach = require('conf.syntax.lsp.config.binds')
local lsp_flags = {
  debounce_text_changes = 150,
}

--[[
  Iterate over all the language servers we want to set up
  They all return a function which will accept our on_attach function & LSP flags as arguments
--]]
for _, lang in ipairs({
  'bash',
  'c',
  'css',
  'docker',
  'go',
  'html',
  'json',
  'lua',
  'markdown',
  'python',
  'ruby',
  'rust',
  'sql',
  'terraform',
  'toml',
  'typescript',
  'yaml',
}) do

  local lsp_init = require('conf.syntax.lsp.config.langs.' .. lang)
  lsp_init(on_attach, lsp_flags)

end
