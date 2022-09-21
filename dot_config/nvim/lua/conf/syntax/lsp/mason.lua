require('mason-lspconfig').setup({
  ensure_installed = {
    -- 'ansiblels', -- ansible
    'bashls', -- bash
    'clangd', -- c, c++
    'cssls', -- css
    'dockerls', -- docker
    'gopls', -- golang
    'html', -- html
    'jsonls', -- json
    'tsserver', -- javascript, typescript
    'sumneko_lua', -- lua
    'marksman', -- markdown
    'pyright', -- python
    'solargraph', -- ruby
    'rust_analyzer', -- rust
    'sqls', -- sql
    'taplo', -- toml
    'terraformls', -- terraform
    'yamlls', -- yaml
  },
})
