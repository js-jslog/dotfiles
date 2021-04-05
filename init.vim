" ============================================================
" === Plugins
" ============================================================
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hoob3rt/lualine.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Required for Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" END Required for Telescope
" Optional for Telescope
Plug 'kyazdani42/nvim-web-devicons'
" END optional for Telescope
call plug#end()
"
" ============================================================
" === END Plugins
" ============================================================
"
"
"
"
" ============================================================
" === Telescope mapings
" ============================================================
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" ============================================================
" === END Telescope mapings
" ============================================================
"
"
"
"
"=============================================================
" === Compe completion
" === - https://github.com/hrsh7th/nvim-compe
"=============================================================
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
"=============================================================
" === END Compe
"=============================================================
"
"
"
"
" ============================================================
" === Options
" ============================================================

" === General ===
set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
set encoding=utf-8

filetype off                  " required
"=== END General ===

" === Text formatting ===
filetype plugin indent on
syntax on

let g:nvcode_termcolors=256
syntax on
colorscheme gruvbox
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" === END Text formatting ===

" === Pane meta-features ===
set diffopt+=vertical         " force diffs to be vertical - for fugitive
set splitright

set cursorline
set cursorcolumn

set visualbell

set scrolloff=1
set sidescrolloff=15
set sidescroll=1

set showmode

set ignorecase                " ignorecase and smartcase work together to make searches
set smartcase                 " case sensitive only when a capital letter is included

set hlsearch
" === END Pane meta-features ===

" === Line numbers ===
" Relative numbers in normal mode
" Absolute numbers in insert mode
function! RelativeNumbers()
  set number relativenumber
endfunction
function! AbsoluteNumbers()
  set number norelativenumber
endfunction
call RelativeNumbers()
autocmd FocusLost * call RelativeNumbers()
autocmd FocusGained * call AbsoluteNumbers()
autocmd InsertEnter * call AbsoluteNumbers()
autocmd InsertLeave * call RelativeNumbers()
" === END Line number ===
"
" ============================================================
" === END Options
" ============================================================



" ============================================================
" === Key bindings
" ============================================================

imap jk <ESC>

nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>

" === Navigate between panes ===
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" === END Navigate between panes ===

" === Paste from clipboard ===
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" === END Paste from clipboard ===

" === Resize panes ===
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
" === END Resize panes ===

" ============================================================
" === END Key bindings
" ============================================================

" ============================================================
" === LUA config - must be at end of file
" ============================================================
lua require('lsp_config')
lua require('treesitter_config')
lua require('compe_config')
" Lualine docs: https://github.com/hoob3rt/lualine.nvim
lua require('lualine').setup{}
