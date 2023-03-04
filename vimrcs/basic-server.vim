
"             ,
"         /\^/`\
"        | \/   |  Reneeth 
"        | |    |  github: @qberg                         hah
"        \ \    /                                         _ _
"         '\\//'   "basic vimrc for servers"            _{ ' }_
"           ||                                         { `.!.` }
"           ||     							           ',_/Y\_,'
"           ||  ,                                        {_,_}
"       |\  ||  |\                                         |
"       | | ||  | |                                      (\|  /)
"       | | || / /                                        \| //
"        \ \||/ /                                          |//
"         `\\//`   \   \./    \\   \./    \\   \./    \ \\ |/ /
"        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" useful clipboard
set clipboard^=unnamed,unnamedplus

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
nnoremap <SPACE> <Nop>
let mapleader = " "

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" set the status line to look like 'ruler', plus buffer number at the end
set statusline=%<%f%h%m%r%w%y%=%l/%L,%c\ %P\ \|\ %n


"--------------------------------------------------------------------
" File Ignores
"--------------------------------------------------------------------

" Ignore version control directories.
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Ignore compiled files.
set wildignore+=*.pyc*

" Ignore miscellaneous files.
set wildignore+=*/.DS_Store,*~

" Ignore packages.
set wildignore+=*node_modules*,*bower_components*,*/vendor,


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7          " Set 7 lines to the cursor - when moving vertically using j/k
set ignorecase    " Ignore cases when searching 
set smartcase	  " Smart about cases when searching
set hlsearch	  " Highlight search results
set incsearch	  " Act like search in modern browsers
set backspace=indent,eol,start
set mouse=a
set lazyredraw	  " Don't redraw while executing macros
set magic 		  " For regular expressions magic is on
set showmatch	  " Show matching brackets
set mat=2         " How many tenths of a second to blank when matching brackets
set showmode      " Always show mode
set splitbelow    " Split new window below current window
set splitright    " Split new window right of current window

"" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme pablo 
catch
endtry

set background=dark


set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" tab for python
set tabstop=4
set shiftwidth=4
set softtabstop=4               " insert mode tab and backspace use 4
set smarttab                    " replace tab to space automatically
set expandtab                   " expand tabs to spaces
set shiftround

" indent
set autoindent smartindent shiftround
set wrap

"--------------------------------------------------------------------
" Mapping Keystrokes
"--------------------------------------------------------------------

nmap <leader>w :w!<cr>			" Fast saving
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Save a million keystrokes
map ; :

" Smart way to move between windows
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" Better window management
map <leader>sh <C-w>s
map <leader>sv <C-w>v
map <leader>se <C-w>=
map <leader>sx :close<cr>

" Close all the buffers
map <leader>bsx :bufdo bd<cr>

" Navigate buffers
map <S-l> :bnext<cr>
map <S-h> :bprevious<cr>

" Tab management
map <leader>to :tabnew<cr>
map <leader>tx :tabclose<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

" Better escape
:imap jj <Esc>
:imap kk <Esc>

" Visual mode moving text
vmap <A-j> :m .+1<cr>==
vmap <A-k> :m .-2<cr>==


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
