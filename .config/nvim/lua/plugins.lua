local lsp = function(use)
  use 'neovim/nvim-lspconfig'  -- Built in Neovim LSP client
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'rust-lang/rust.vim'  -- rust.vim in Neovim pre-package has bug
  -- master branch on rust.vim has it fixed so update direct from there
  -- https://github.com/rust-lang/rust.vim/issues/460
  use 'simrat39/rust-tools.nvim'
end

local completion = function(use)
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip' -- https://github.com/L3MON4D3/LuaSnip
  -- use "rafamadriz/friendly-snippets"  -- https://github.com/rafamadriz/friendly-snippets

  -- Completion sources from here down
  use 'hrsh7th/cmp-buffer'
  -- TODO: remove if not needed
  use 'hrsh7th/cmp-nvim-lsp'  -- https://github.com/hrsh7th/cmp-nvim-lsp
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-nvim-lua'  -- https://github.com/hrsh7th/cmp-nvim-lua
  use 'saadparwaiz1/cmp_luasnip'  -- https://github.com/saadparwaiz1/cmp_luasnip
  -- NOTE: these are on my watch list
  -- tried but not happy with this https://github.com/tzachar/cmp-tabnine
  -- https://github.com/David-Kunz/cmp-npm
end

local utils = function(use)
  use 'nvim-lua/plenary.nvim'  -- https://github.com/nvim-lua/plenary.nvim
end

local syntax = function(use)
  use {
    'EdenEast/nightfox.nvim',
    config = function ()
      require'nightfox'.load("nightfox")
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'romgrk/nvim-treesitter-context',
    config = function()
      require'treesitter-context'.setup()
    end
  }
  use 'norcalli/nvim-colorizer.lua'
  use {
    "narutoxy/dim.lua",  -- https://github.com/NarutoXY/dim.lua
    requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    config = function()
      require('dim').setup({})
    end
  }
end

local layout = function(use)
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- FIXME: this introduces a bug where if i open a file from a quickfix list while
  -- the dashboard is open, it'll split the buffers horizontally instead of opening
  -- the file over the dashboard and closing the dashboard buffer
  -- use {
  --   'goolord/alpha-nvim',  -- https://github.com/goolord/alpha-nvim
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.dashboard'.opts)
  --   end
  -- }
end

local git = function(use)
  use {
    'lewis6991/gitsigns.nvim',  -- https://github.com/lewis6991/gitsigns.nvim
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
      'ruifm/gitlinker.nvim',  -- https://github.com/ruifm/gitlinker.nvim
      requires = 'nvim-lua/plenary.nvim',
  }
end

local navigation = function(use)
  use 'nvim-telescope/telescope.nvim'
  use {
    'kyazdani42/nvim-tree.lua',  -- https://github.com/kyazdani42/nvim-tree.lua
    requires = 'kyazdani42/nvim-web-devicons',
  }
end

local comments = function(use)
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    "folke/todo-comments.nvim",  -- https://github.com/folke/todo-comments.nvim
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }
end

local editor_support = function(use)
  use 'tpope/vim-surround'  -- Vim surround support (change brackets with cs)
  use {
    -- config included in nvim-cmp for new indented line between pairs after <CR>
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }
  use 'windwp/nvim-ts-autotag'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        filetype_exclude = { "alpha" },
        show_current_context = true,
      }
    end
  }
  use 'yamatsum/nvim-cursorline'  -- https://github.com/yamatsum/nvim-cursorline
end

local startup = function(use)
  use 'wbthomason/packer.nvim'  -- https://github.com/wbthomason/packer.nvim

  lsp(use)
  completion(use)
  utils(use)
  syntax(use)
  layout(use)
  git(use)
  navigation(use)
  comments(use)
  editor_support(use)
end

require('packer').startup(startup)
