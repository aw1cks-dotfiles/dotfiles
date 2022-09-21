local bind = require('lib').keybind

-- Make split direction more natural
vim.o.splitbelow = true
vim.o.splitright = true

-- Navigate more easily
bind('n', '<A-h>', '<C-W><C-H>')
bind('n', '<A-j>', '<C-W><C-J>')
bind('n', '<A-k>', '<C-W><C-K>')
bind('n', '<A-l>', '<C-W><C-L>')

-- Binds for splits
bind('n', '[v', ':vnew<CR>')
bind('n', '[h', ':new<CR>')
