local nvim_lsp = require('lspconfig')

-- use npm for installing pyright and tsserver
local servers = {'pyright', 'rust_analyzer', 'tsserver'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end

