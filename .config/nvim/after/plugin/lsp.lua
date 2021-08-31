local nvim_lsp = require('lspconfig')

-- use npm for installing pyright and tsserver

local servers = {'pyright', 'rust_analyzer', 'tsserver'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end

-- This isn't working yet
require('lspkind').init({
    with_text = true,

    preset = 'default',
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
