-- TODO: not sure that this is the best way to structure the plugin configs, look
-- into improving it

require('packer').startup(function()
  use 'wbthomason/packer.nvim'  -- Package manager
  use 'bluz71/vim-nightfly-guicolors'  -- Colourscheme
  use 'tomtom/tcomment_vim'  -- Code commenting toggle
  use 'tpope/vim-surround'  -- Vim surround support (change brackets with cs)
  use 'neovim/nvim-lspconfig'  -- Built in Neovim LSP client

  -- Autocompletion with nvim-cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'

  use 'haya14busa/is.vim'  -- Improved incremental search
  use 'mattn/emmet-vim'  -- Emmet html/css workflow
  use 'iamcco/markdown-preview.nvim'  -- Markdown previews

  -- NVIM tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Git diffs in sign column
  use {
    'mhinz/vim-signify',
    config = function()
      vim.g['signify_sign_add'] = '+'
      vim.g['signify_sign_delete'] = '_'
      vim.g['signify_sign_change'] = '~'
      vim.g['signify_sign_delete_first_line'] = '‾'
      vim.g['signify_sign_show_count'] = 0
      vim.g['signify_sign_show_text'] = 1
    end
  }

  -- Git blame inline
  use {
    'APZelos/blamer.nvim',
    config = function()
      vim.g['blamer_enabled'] = 1
    end
  }

  -- Test coverage in sign column
  use {
    'ruanyl/coverage.vim',
    config = function()
      vim.g['coverage_json_report_path'] = 'coverage/coverage-final.json'
      vim.g['coverage_sign_covered'] = '⦿'
      vim.g['coverage_interval'] = 750
      vim.g['coverage_show_covered'] = 0
      vim.g['coverage_show_uncovered'] = 1
    end
  }
end)

