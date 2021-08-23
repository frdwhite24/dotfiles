-- Spell checking
vim.bo.spelllang = "en"

-- Tabs, spaces & indent
vim.bo.tabstop = 2
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.smartindent = true
vim.o.smarttab = true
vim.bo.softtabstop = 2

-- Wrapping, viewports and windows
vim.o.scrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.errorbells = false
vim.o.hidden = true
vim.o.cmdheight = 1

-- Rulers and columns
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.colorcolumn = "80"
vim.wo.signcolumn = "yes"
-- TODO: find a better way to highlight the colour column with light grey
vim.highlight.create('ColorColumn', {ctermbg=0, guibg=lightgrey}, false)

-- Colour scheme
vim.o.termguicolors = true
vim.g.colors_name = 'nightfly'

-- Long update time (default 4s) leads to poor UX
vim.o.updatetime = 100
