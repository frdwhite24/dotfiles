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

" Display
set tabstop=2
set expandtab
set autoindent

set shiftwidth=2
set smartindent
set smarttab
set cindent

set cursorline
set ruler
set signcolumn=yes

" Search
set nohlsearch
set incsearch

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


" -----------------------------------------------------------------------------
"                                Plugins
" -----------------------------------------------------------------------------
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Auto completion COC
Plug 'HerringtonDarkholme/yats.vim'  " TS syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'  " TSX and JSX syntax highlighting
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}  " Fuzzy file searching
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'  " Git diffs in signcolumn

" Theme plugins
" Plug 'crusoexia/vim-monokai'
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'joshdick/onedark.vim'
" Plug 'raphamorim/lucario'

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
"
" -----------------------------------------------------------------------------
"                                Autocommands
" -----------------------------------------------------------------------------

" Sets tabs to be 4 spaces for python files
autocmd FileType python setl shiftwidth=4 sts=4 ts=2 et


" -----------------------------------------------------------------------------
"                                COC Config
" -----------------------------------------------------------------------------
"
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Close suggestion windows when they get stuck using double escape
nnoremap <silent> <ESC><ESC> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>

" -----------------------------------------------------------------------------
"                                FZF Config
" -----------------------------------------------------------------------------
"
nmap <C-p> :Files<CR>
nmap <C-o> :Buffers<CR>
nmap <C-g> :GitFiles<CR>
nmap <C-e> :GitFiles?<CR>
nmap <C-f> :Rg<CR>

" -----------------------------------------------------------------------------
"                                Signify Config
" -----------------------------------------------------------------------------
"
set updatetime=100
