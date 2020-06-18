set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
set encoding=utf-8

filetype off                  " required

call plug#begin()
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
""Plug 'tpope/vim-surround'
""Plug 'tpope/vim-speeddating'
""Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'junegunn/gv.vim'
"Plug 'mmai/vim-markdown-wiki'
call plug#end()

" === COC extensions ===
" Keeping this coc config separate from from coc.vim config file since it
" makes sense for this list of extensions near the same list defined for Plug
" above.
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ ]
" === COC end (see nvim/after/plugin/coc.vim for the rest) ===

" ============================================================
" === Key bindings
" ============================================================

imap jk <ESC>

:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Navigate between panes
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>


" ============================================================
" === END Key bindings
" ============================================================

" === Text formatting ===
filetype plugin indent on
syntax on

silent! colorscheme gruvbox
set background=dark

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" === END Text formatting ===


" === Pane meta-features ===
set diffopt+=vertical " force diffs to be vertical - for fugitive
set splitright

set cursorline
set cursorcolumn

set visualbell

set scrolloff=1
set sidescrolloff=15
set sidescroll=1

set showmode

set ignorecase        " ignorecase and smartcase work together to make searches
set smartcase         " case sensitive only when a capital letter is included

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
