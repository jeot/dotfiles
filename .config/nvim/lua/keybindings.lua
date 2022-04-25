local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
local kmopts = { noremap = true }
keymap('n', '<c-h>', '<c-w>h', kmopts)
keymap('n', '<c-j>', '<c-w>j', kmopts)
keymap('n', '<c-k>', '<c-w>k', kmopts)
keymap('n', '<c-l>', '<c-w>l', kmopts)
keymap('n', '<space>q', ':q<CR>', kmopts)
keymap('n', '<space>x', ':wq<CR>', kmopts)
keymap('n', '<space>so', ':so %<CR>', kmopts)
