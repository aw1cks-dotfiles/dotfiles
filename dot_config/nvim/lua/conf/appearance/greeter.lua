local theme = require('alpha.themes.theta')
local button = require('alpha.themes.dashboard').button

local exec = function(x, is_lua)
  local lua = ''
  if is_lua then
    lua = 'lua '
  end

  return '<cmd>' .. lua .. x .. '<CR>'
end

theme.header.val = {
  '      _   _        __      ___               ',
  '     | \\ | |       \\ \\    / (_)           ',
  '     |  \\| | ___  __\\ \\  / / _ _ __ ___   ',
  '     | . ` |/ _ \\/ _ \\ \\/ / | | \'_   `_ \\ ',
  '     | |\\  |  __/ (_) \\  /  | | | | | | |  ',
  '     |_| \\_|\\___|\\___/ \\/   |_|_| |_| |_|',
}
theme.buttons.val = {
  { 
    type = 'text',
    val = 'Quick links',
    opts = {
      hl = 'SpecialComment',
      position = 'center',
    },
  },
  {
    type = 'padding',
    val = 1,
  },
  button('e', '  New file', exec('ene')),
   button('t', '  File explorer', exec('require("chadtree").Open()', true)),
  button('u', '  Update plugins', exec('require("packer").update()', true)),
  button('m', '  Mason', exec('require("mason.api.command").Mason()', true)),
  button('q', '  Quit', exec('qa')),
}

require('alpha').setup(theme.config)
