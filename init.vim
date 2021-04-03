" ============================================================
" === Plugins
" ============================================================
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
" === LUA config
" ==== LSP setup
" ==== Useful resources:
" ==== - https://github.com/neovim/nvim-lspconfig
" ==== Treesitter setup
" ============================================================
lua << EOF
require'lspconfig'.tsserver.setup{}
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "json",
    "html",
    "bash",
    "yaml",
    "lua",
    "css",
    "regex",
    "ql",
    "query",
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
}
EOF
" ============================================================
" === END LUA config
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

"silent! colorscheme gruvbox
"set background=dark

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

