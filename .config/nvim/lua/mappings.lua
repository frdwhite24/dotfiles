require('plugins')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
keymap('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- File Explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- Easier indenting
keymap('v', '<', '<gv', opts)  -- reselect after indent left
keymap('v', '>', '>gv', opts)  -- reselect after indent right

-- Keep searches and joins centered 
keymap('n', 'n', 'nzzzv', { noremap = true, silent = false })
keymap('n', 'N', 'Nzzzv', { noremap = true, silent = false })
keymap('n', 'J', 'mzJ`z', { noremap = true, silent = false })

-- Move selected line/block of text in visual mode
-- TODO: implement the below without the mark error coming up and so it works well
-- keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', opts)
-- keymap('x', 'J', ':move \'<+1<CR>gv-gv\'', opts)

-- Working with buffers
keymap('n', '<c-s>', ':w<CR>', {})  -- save buffer in normal mode
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})  -- save buffer in insert mode
keymap('n', 'sh', ':split<Return><C-w>w', {})  -- split window horizontally
keymap('n', 'sv', ':vsplit<Return><C-w>w', {})  -- split window vertically
keymap('n', '<TAB>', ':bnext<CR>', opts)  -- move to next buffer
keymap('n', '<S-TAB>', ':bprevious<CR>', opts)  -- move to previous buffer
keymap('n', '<c-k>', '<c-w>k', opts)  -- move to above split
keymap('n', '<c-j>', '<c-w>j', opts)  -- move to below split
keymap('n', '<c-h>', '<c-w>h', opts)  -- move to left split
keymap('n', '<c-l>', '<c-w>l', opts)  -- move to right split

-- Signify git diffs
keymap('n', '<Leader>gj', '<plug>(signify-next-hunk)', {})  -- jump through diffs
keymap('n', '<Leader>gk', '<plug>(signify-prev-hunk)', {})  -- jump through diffs

-- LSP
keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostics.goto_prev()<CR>', opts)
keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostics.goto_next()<CR>', opts)
keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

