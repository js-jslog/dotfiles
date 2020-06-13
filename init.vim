set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
set smartcase
set encoding=utf-8

filetype off                  " required

" set vim to use ctags
set tags=tags

call plug#begin()
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
"Plug 'kana/vim-fakeclip'
Plug 'morhetz/gruvbox'
Plug 'takac/vim-hardtime'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'powerline/powerline-fonts'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-sleuth'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/gv.vim'
"Plug 'majutsushi/tagbar'
Plug 'mmai/vim-markdown-wiki'
call plug#end()

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

let g:airline_theme="base16"

" air-line
let g:airline_powerline_fonts = 1

" activate hardtime
let g:hardtime_default_on = 1

" ctrlp can see hidden files
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

" Rainbow-parentheses colours
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

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

let g:deoplete#enable_at_startup = 1
