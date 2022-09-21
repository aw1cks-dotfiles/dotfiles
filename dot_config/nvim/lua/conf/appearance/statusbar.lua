local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
  filetypes = {
    'alpha',
    'CHADTree',
    'packer',
  },
  buftypes = {
    'terminal',
  },
  bufnames = {},
}

local base16 = require('base16-colorscheme').colorschemes['default-dark']
local colors = {
  bg = base16.base01,
  black = base16.base00,
  yellow = base16.base0A,
  cyan = base16.base0C,
  oceanblue = base16.base0D,
  green = base16.base0B,
  orange = base16.base09,
  violet = base16.base0E,
  magenta = base16.base0E,
  white = base16.base07,
  fg = base16.base05,
  skyblue = base16.base0C,
  red = base16.base08,
}

local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'yellow',
  CONFIRM = 'yellow',
  VISUAL = 'skyblue',
  LINES = 'skyblue',
  BLOCK = 'skyblue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local components = {
  active = {
    { -- Left
      { -- vi-mode
        provider = ' ',
        hl = function()
          local val = {}
          val.bg = vi_mode_utils.get_mode_color()
          val.fg = 'black'
          val.style = 'bold'
          return val
        end,
        right_sep = ' '
      },
      { -- filename
        provider = function()
          return vim.fn.expand("%:F")
        end,
        hl = {
          fg = 'white',
          bg = 'bg',
          style = 'bold'
        },
      },
    },
    { -- Middle
      {
        provider = 'diagnostic_errors',
        right_sep = ' ',
      },
      {
        provider = 'diagnostic_warnings',
        right_sep = ' ',
      },
      {
        provider = 'diagnostic_hints',
        right_sep = ' ',
      },
      {
        provider = 'diagnostic_info',
        right_sep = ' ',
      },
      { -- gitBranch
        provider = 'git_branch',
        hl = {
          fg = 'yellow',
          bg = 'bg',
          style = 'bold'
        },
        left_sep = '  ',
        right_sep = ' ',
      },
      { -- diffAdd
        provider = 'git_diff_added',
        hl = {
          fg = 'green',
          bg = 'bg',
          style = 'bold'
        },
        left_sep = ' ',
      },
      { -- diffModfified
        provider = 'git_diff_changed',
        hl = {
          fg = 'orange',
          bg = 'bg',
          style = 'bold'
        }
      },
      { -- diffRemove
        provider = 'git_diff_removed',
        hl = {
          fg = 'red',
          bg = 'bg',
          style = 'bold'
        },
      },
    },
    { -- Right
      { -- fileIcon
        provider = function()
          local filename = vim.fn.expand('%:t')
          local extension = vim.fn.expand('%:e')
          local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
          if icon == nil then
            icon = ''
          end
          return icon
        end,
        hl = function()
          local val = {}
          local filename = vim.fn.expand('%:t')
          local extension = vim.fn.expand('%:e')
          local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
          if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
          else
            val.fg = 'white'
          end
          val.bg = 'bg'
          val.style = 'bold'
          return val
        end,
        right_sep = ' '
      },
      { --fileType
        provider = 'file_type',
        hl = function()
          local val = {}
          local filename = vim.fn.expand('%:t')
          local extension = vim.fn.expand('%:e')
          local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
          if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
          else
            val.fg = 'white'
          end
          val.bg = 'bg'
          val.style = 'bold'
          return val
        end,
        right_sep = ' '
      },
      { -- linePercent
        provider = 'line_percentage',
        hl = {
          fg = 'white',
          bg = 'bg',
          style = 'bold',
        },
        right_sep = '   ',
      },
      { -- position
        provider = 'position',
        format   = '{line} : {col}',
        hl = {
          fg = 'white',
          bg = 'bg',
          style = 'bold'
        },
        right_sep = ' ',
        padding  = {
          col  = 4,
          line = 4,
        },
        right_sep = ' ',
      },
    },
  },
  inactive = {
    { -- Left
      { -- fileType
        provider = 'file_type',
        hl = {
          fg = 'black',
          bg = 'cyan',
          style = 'bold'
        },
        left_sep = {
          str = ' ',
          hl = {
            fg = 'NONE',
            bg = 'cyan'
          }
        },
        right_sep = {
          {
            str = ' ',
            hl = {
              fg = 'NONE',
              bg = 'cyan'
            }
          },
          ' '
        }
      },
    }, 
    { -- Middle
    }, 
    { -- Right
    },
  },
}


require('feline').setup({
  theme          = colors,
  default_bg     = bg,
  default_fg     = fg,
  vi_mode_colors = vi_mode_colors,
  components     = components,
  force_inactive = force_inactive,
})
