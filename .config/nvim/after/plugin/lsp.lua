local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

local generic_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- IMPORTANT: use npm for installing language servers. Copy the command below:
-- npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d pyright

-- Python
nvim_lsp['pyright'].setup {}

-- Rust language server
require('rust-tools').setup({
  tools = {
    hover_with_actions = false,
    runnables = {
      use_telescope = false
    },
    debuggables = {
      use_telescope = false
    },
  }
})

-- TypeScript language server
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)

        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        generic_attach(client, bufnr)

        local ts_utils = require("nvim-lsp-ts-utils")

        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            import_all_timeout = 5000,
            import_all_priorities = {
                buffers = 4,
                buffer_content = 3,
                local_files = 2,
                same_file = 1,
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_opts =  {
              condition = function(utils)
                return utils.root_has_file(".eslintrc.js")
              end,
              diagnostics_format = "#{m} [#{c}]",
            },

            -- formatting
            enable_formatting = true,
            formatter = "eslint_d",
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)

        -- disable tsserver formatting
        client.resolved_capabilities.document_formatting = false

        -- define an alias
        vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")
        vim.cmd("command -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")

        -- format on save
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
}

-- Enable null-ls integration for eslint integration
null_ls.config {
  save_after_format = false,
  sources = {
    -- eslint_d/js/jsx/ts/tsx handled by nvim_ts_utils
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "yaml", "json", "html", "css", "scss" },
    }),
  }
}

nvim_lsp["null-ls"].setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>z",
      "<cmd>lua vim.lsp.buf.formatting()<CR>",
      { noremap = true, silent = true }
    )
    -- format on save
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end,
  flags = {
    debounce_text_changes = 250,
  },
}
