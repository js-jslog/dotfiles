set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set vim to use ctags
set tags=tags
" vundle install
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" The following are examples of different formats supported.
"1. plugin on GitHub repo
Plugin 'kana/vim-fakeclip'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-sleuth'
Plugin 'takac/vim-hardtime'
"Plugin 'hari-rangarajan/CCTree'
"Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/powerline-fonts'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
"Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'gregsexton/gitv'
Plugin 'morhetz/gruvbox'
Plugin 'gcmt/taboo.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/rainbow_parentheses.vim'
"2. plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"3. Git plugin not hosted on GitHub
" eg: Plugin 'git://git.wincent.com/command-t.git'
"4. git repos on your local machine (i.e. when working on your own plugin)
" eg: Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vi,
" Pass the path to set the runtimepath properly.
" eg: Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" REMOVE THIS IF INDENTING SEEMS TO BE WORKING. I'D RATHER HAVE IT BELOW WITH
" THE REST: filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" WHY DOES THIS ERROR auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


imap jj <ESC>
imap jk <ESC>

" ONLY USEFUL IF REMAPPING , IN TMUX
" imap m. ,

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

:let mapleader = "-"

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

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
set shiftwidth=4
set softtabstop=4
set number
set cursorline
set visualbell
set ignorecase
set splitright

" Auto resize vim splits to make active split more readible
" set winwidth=104
set winheight=20 " this looks like a necessary hack to prepare for the next 2 lines
set winminheight=20
set winheight=999

" Scrolling
set scrolloff=8
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

" autostart nerdtree
autocmd vimenter * NERDTree

" fix subdirectory navigation NERDTree
set encoding=utf-8
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>
map ,m :NERDTreeToggle<CR>
map ,n :NERDTreeFind<CR>

colorscheme gruvbox
set background=dark

set noshowmode

let g:airline_theme="base16"

" air-line
let g:airline_powerline_fonts = 1

" activate hardtime
let g:hardtime_default_on = 1

" ctrlp can see hidden files
let g:ctrlp_show_hidden = 1

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

" Rainbow-parenthese always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
