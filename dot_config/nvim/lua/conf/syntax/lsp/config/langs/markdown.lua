return function(on_attach, lsp_flags)

  require('lspconfig').marksman.setup(require('coq').lsp_ensure_capabilities({
    lsp_flags = lsp_flags,
    on_attach = on_attach,
  }))

end

