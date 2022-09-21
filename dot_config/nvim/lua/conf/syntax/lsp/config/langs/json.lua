return function(on_attach, lsp_flags)

  require('lspconfig').jsonls.setup(require('coq').lsp_ensure_capabilities({
    lsp_flags = lsp_flags,
    on_attach = on_attach,
    settings  = {
      json = {
        schemas  = require('schemastore').json.schemas(),
        validate = { 
          enable = true,
        },
      }
    },
  }))

end
