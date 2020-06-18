set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
set smartcase
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
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/denite.nvim'
""Plug 'kana/vim-fakeclip'
Plug 'morhetz/gruvbox'
"Plug 'takac/vim-hardtime'
""Plug 'pangloss/vim-javascript'
""Plug 'mxw/vim-jsx'
"Plug 'powerline/powerline-fonts'
Plug 'tpope/vim-fugitive'
""Plug 'tpope/vim-surround'
""Plug 'tpope/vim-speeddating'
""Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'junegunn/gv.vim'
""Plug 'majutsushi/tagbar'
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

imap jk <ESC>

:set hlsearch
:nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
:noremap <F4> :set hlsearch! hlsearch?<CR>

" ONLY USEFUL IF REMAPPING , IN TMUX
" imap m. ,

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

syntax on
" filetype plugin indent on

" force diffs to be vertical - for fugitive
set diffopt+=vertical

filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set cursorline
set cursorcolumn
set visualbell
set ignorecase
set splitright

" Scrolling
set scrolloff=1
set sidescrolloff=15
set sidescroll=1

" Toggle relative numbering and set to absolute on loss of focus and insert
" mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn() " This looks like it should be the other function
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn() " This looks like it should be the other function
autocmd InsertLeave * call ToggleRelativeOn()

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

silent! colorscheme gruvbox
set background=dark

set noshowmode

"let g:airline_theme="base16"
"
"" air-line
"let g:airline_powerline_fonts = 1
"
"" activate hardtime
"let g:hardtime_default_on = 1
"
" ctrlp can see hidden files
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

"
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\  'typescript': ['tsserver', 'eslint'],
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses warn bg color (typically yellow)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
