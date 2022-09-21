if not require('pkg.bootstrap') then
  require('packer').init({
    max_jobs = 60,
  })
  return require('packer').startup(function(use)
    use({
      -- Core
      {
        'lewis6991/impatient.nvim',
      },
      {
        'nvim-lua/plenary.nvim',
      },
      {
        'wbthomason/packer.nvim',
      },
      {
        'williamboman/mason.nvim',
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        requires = {
          'williamboman/mason.nvim',
        },
      },

      -- LSP & Syntax
      {
        'mfussenegger/nvim-dap',
        requires = {
          'williamboman/mason.nvim',
          'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
      },
      --[[
      {
        'mfussenegger/nvim-lint',
        requires = {
          'williamboman/mason.nvim',
          'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
      },
      --]]
      {
        'mhartington/formatter.nvim',
        requires = {
          'williamboman/mason.nvim',
        },
      },
      {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
      },
      {
        'ms-jpq/coq.thirdparty',
        branch = '3p',
      },
      {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {
          'ms-jpq/coq.artifacts',
          'ms-jpq/coq.thirdparty',
        },
      },
      {
        'neovim/nvim-lspconfig',
        requires = {
          'b0o/SchemaStore.nvim',
          'ms-jpq/coq_nvim',
        },
      },
      {
        'nvim-treesitter/nvim-treesitter',
      },
      {
        'p00f/nvim-ts-rainbow',
        requires = {
          'nvim-treesitter/nvim-treesitter',
        }
      },
      {
        'williamboman/mason-lspconfig.nvim',
        requires = {
          'williamboman/mason.nvim',
          'neovim/nvim-lspconfig',
        },
      },

      -- Appearance
      {
        'alvarosevilla95/luatab.nvim',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
      },
      {
        'feline-nvim/feline.nvim',
      },
      {
        'goolord/alpha-nvim',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
      },
      {
        'RRethy/nvim-base16',
      },
      {
        'yamatsum/nvim-cursorline',
      },

      -- Features
      {
        'ethanholz/nvim-lastplace',
      },
      {
        'gelguy/wilder.nvim',
        requires = {
          'romgrk/fzy-lua-native',
        },
        config = 'vim.cmd("UpdateRemotePlugins")'
      },
      {
        'junegunn/vim-peekaboo',
      },
      {
        'lewis6991/gitsigns.nvim',
      },
      {
        'ms-jpq/chadtree',
        brancdh = 'chad',
      },
    })
    config = {
      max_jobs = 16,
      git = {
        default_url_format = 'https://hub.fastgit.xyz/%s',
      },
    }

    if not require('lib').autoupdate({
      func = function()
        require('packer').update()
      end,
      path = vim.fn.stdpath('data') .. '/packer-updated'
    }) then
      require('impatient')
      -- Include config that depends on packages being installed
      require('conf.appearance')
      require('conf.features')
      require('conf.syntax')
    end
  end)
end
