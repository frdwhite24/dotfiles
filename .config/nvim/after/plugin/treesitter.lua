require"nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "dockerfile",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "yaml",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
