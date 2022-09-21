require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- require('conf.syntax.mason')

require('conf.syntax.completion')
-- require('conf.syntax.linting')
require('conf.syntax.lsp')
require('conf.syntax.treesitter')
