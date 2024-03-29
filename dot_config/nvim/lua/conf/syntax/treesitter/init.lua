require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'comment',
    'cpp',
    'css',
    'devicetree',
    'dockerfile',
    'gitattributes',
    'gitignore',
    'go',
    'gomod',
    'hcl',
    'html',
    'http',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'jsonnet',
    'latex',
    'llvm',
    'lua',
    'make',
    'meson',
    'ninja',
    'nix',
    'perl',
    'php',
    'proto',
    'python',
    'regex',
    'rego',
    'ruby',
    'rust',
    'scss',
    'sql',
    'toml',
    'yaml',
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
  with_sync = true,
})
