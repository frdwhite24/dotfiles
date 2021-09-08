-- The structure of this follows the sections within this great collection
-- of Neovim plugins https://github.com/rockerBOO/awesome-neovim#plugins
require('packer').startup(function()
  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'  -- Built in Neovim LSP client
  -- use 'glepnir/lspsaga.nvim'  -- Improved LSP UI
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'simrat39/rust-tools.nvim'

  -- Lua support
  use 'nvim-lua/plenary.nvim'  -- required by multiple plugins below

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'  -- custom icons on completion menu
  use 'hrsh7th/cmp-buffer'  -- Sources from here down
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
  }

  -- Colors
  use 'norcalli/nvim-colorizer.lua'

  -- Colorscheme
  use 'bluz71/vim-nightfly-guicolors'

  -- Statusline and tabline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  
  -- Git
  use {
    'APZelos/blamer.nvim',  -- inline git blame
    config = function()
      vim.g['blamer_enabled'] = 1
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Comment
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- use 'folke/todo-comments.nvim'  -- Search through for TODO comments

  -- Project
  -- use 'windwp/nvim-spectre'  -- Search and replace panel

  -- Editing supports
  use 'tpope/vim-surround'  -- Vim surround support (change brackets with cs)
  use 'haya14busa/is.vim'  -- Improved incremental search
  use {
    -- config included in nvim-cmp for new indented line between pairs after <CR>
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }
  use 'windwp/nvim-ts-autotag'

  -- Testing
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

