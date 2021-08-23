"                        _                              __ _
"  _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                            |___/
"
"
" Author: @frdwhite24

" -----------------------------------------------------------------------------
"                                Basic Settings
" -----------------------------------------------------------------------------

" set leader key to spacebar
let mapleader=" "

" Spell checking
set spelllang=en

" Display
set tabstop=2
set autoindent
filetype plugin indent on

set expandtab
set shiftwidth=2
set smartindent
set smarttab
set cindent

set cursorline
set ruler
set signcolumn=yes

" Search
" set nohlsearch
set incsearch
set ignorecase
set smartcase

" Relative numbers
set relativenumber
set number

" Wrapping, viewports and windows
set nowrap
set scrolloff=8
set splitbelow
set splitright

" Whitespace
" set list
" set listchars=space:·,tab:>-,trail:~,extends:>,precedes:<

" Rulers
set colorcolumn=80
set signcolumn=yes
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Project level
set exrc

" Buffers
set hidden

" Other
set noerrorbells

" Give more space for displaying messages in command line
set cmdheight=2

" Long update time (default 4s) leads to poor UX
set updatetime=100

" -----------------------------------------------------------------------------
"                                Plugins
" -----------------------------------------------------------------------------
"
call plug#begin(stdpath('data') . '/plugged')

" Colour theme
" Plug 'crusoexia/vim-monokai'
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'joshdick/onedark.vim'
" Plug 'raphamorim/lucario'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Auto completion COC
Plug 'rust-lang/rust.vim'  " Rust vim support

" Syntax highlighting
Plug 'pangloss/vim-javascript'  " JS syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'  " TS syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'  " TSX and JSX syntax highlighting
Plug 'iloginow/vim-stylus'  " stylus syntax highlighting etc
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax

"  File/code searching
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}  " Fuzzy file searching
Plug 'junegunn/fzf.vim'

" Git and coverage helpers
Plug 'mhinz/vim-signify'  " Git diffs in signcolumn
Plug 'APZelos/blamer.nvim'  " Git blame inline
Plug 'ruanyl/coverage.vim'  " Coverage gutter

" Workflow helpers
Plug 'mattn/emmet-vim'  " Emmet html/css workflow
Plug 'tomtom/tcomment_vim'  " Code commenting toggle
Plug 'tpope/vim-surround'  " vim.surround support
Plug 'haya14busa/is.vim'  " Improved incremental search
Plug 'iamcco/markdown-preview.nvim'  " Markdown previews

" Environment
Plug 'vim-airline/vim-airline'  " status/tabline for vim
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" -----------------------------------------------------------------------------
"                                Theme
" -----------------------------------------------------------------------------
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
" colorscheme monokai
" colorscheme onedark
" colorscheme lucario
colorscheme nightfly

" -----------------------------------------------------------------------------
"                                Remaps
" -----------------------------------------------------------------------------
"
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-J> <C-W><C-J>  " Move to below split
nnoremap <C-K> <C-W><C-K>  " Move to above split
nnoremap <C-L> <C-W><C-L>  " Move to right split
nnoremap <C-H> <C-W><C-H>  " Move to left split
nnoremap <C-S> :w\|bd<CR>  " Save and close current buffer
nmap sh :split<Return><C-w>w  " Split window horizontally
nmap sv :vsplit<Return><C-w>w  " Split window vertically
"
" -----------------------------------------------------------------------------
"                                Autocommands
" -----------------------------------------------------------------------------

" Sets tabs to be 4 spaces for python files
autocmd FileType python setl shiftwidth=4 sts=4 ts=2 et
autocmd FileType php setl shiftwidth=4 sts=4 ts=2 et

" -----------------------------------------------------------------------------
"                                Rust Config
" -----------------------------------------------------------------------------

let g:rustfmt_autosave = 1  " automatic running of rustfmt on save
