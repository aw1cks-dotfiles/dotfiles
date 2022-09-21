local bind = require('lib').keybind

require('gitsigns').setup()
local gs = package.loaded.gitsigns

bind('n', '<Leader>bl', function() gs.blame_line{full=true} end)
bind('n', '<Leader>bt', gs.toggle_current_line_blame)

bind('n', '<leader>g', function() gs.toggle_signs() end)
bind('n', '<leader>gr', function() gs.reset_buffer() end)
