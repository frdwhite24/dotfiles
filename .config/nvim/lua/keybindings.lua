local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})  -- save buffer in normal
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})  -- save buffer in insert
keymap('n', 'sh', ':split<Return><C-w>w', {})  -- split window horizontally
keymap('n', 'sv', ':vsplit<Return><C-w>w', {})  -- split window vertically


local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
