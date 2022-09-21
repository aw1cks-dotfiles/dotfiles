local bind = require('lib').keybind

bind('n', '<space>e', vim.diagnostic.open_float)
bind('n', '[d', vim.diagnostic.goto_prev)
bind('n', ']d', vim.diagnostic.goto_next)
bind('n', '<space>q', vim.diagnostic.setloclist)

-- This function is only called once the language sercer attaches to the buffer
return function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = require('lib').keybind_opts
  bufopts.buffer = bufnr

  bind('n', 'gd', vim.lsp.buf.definition, bufopts)
  bind('n', 'gD', vim.lsp.buf.declaration, bufopts)
  bind('n', 'K', vim.lsp.buf.hover, bufopts)
  bind('n', 'gi', vim.lsp.buf.implementation, bufopts)
  bind('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  bind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  bind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  bind('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  bind('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  bind('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  bind('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  bind('n', 'gr', vim.lsp.buf.references, bufopts)
  bind('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
