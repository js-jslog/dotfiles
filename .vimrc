set nocompatible              " be iMproved, required
set shell=/bin/bash           " force the type of shell - needed specifically in windows ubuntu
set smartcase
set encoding=utf-8

filetype off                  " required

" set vim to use ctags
set tags=tags

packadd minpac
call minpac#init()
call minpac#add('kana/vim-fakeclip')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-speeddating')
call minpac#add('tpope/vim-sleuth')
call minpac#add('takac/vim-hardtime')
"call minpac#add('hari-rangarajan/CCTree')
"call minpac#add('majutsushi/tagbar')
call minpac#add('kien/ctrlp.vim')
call minpac#add('powerline/powerline-fonts')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('w0rp/ale')
"call minpac#add('bling/vim-bufferline')
call minpac#add('gregsexton/gitv')
call minpac#add('morhetz/gruvbox')
call minpac#add('gcmt/taboo.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('kien/rainbow_parentheses.vim')
call minpac#add('k-takata/minpac', {'type': 'opt'})

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
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
