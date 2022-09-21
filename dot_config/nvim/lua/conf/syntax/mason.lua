require('mason-tool-installer').setup({
  ensure_installed = {
    --[[
    -- Linters
    'vale',

    -- DAP servers
    'bash-debug-adapter',
    'delve',
    --]]
  },
})
