" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'valloric/youcompleteme'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'honza/vim-snippets'
"Plugin 'tpope/vim-unimpaired'

" All of your Plugins must be added before the following line
call vundle#end() 

"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
set number
set relativenumber
syntax enable
filetype plugin on
set shell=/bin/bash
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
set encoding=utf-8
set autochdir

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu
"Always show current position
set ruler
" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid
"asdasdlkj

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" set true colors and add vim specific fixes
"set termguicolors
"set t_Co=256

" interface
set background=dark                   " tell vim what the background color looks like
"set colorcolumn=80                   " show a column at 100 chars
"set cursorline                        " highlight current line
"set noshowmode                        " don't show mode
set scrolloff=5                       " keep at least 5 lines above/below
set sidescroll=1                      " smoother horizontal scrolling
set sidescrolloff=5                   " keep at least 5 lines left/right
"set splitbelow                        " create new splits below
"set splitright                        " create new splits to the right
"set wildmode=longest:full,full        " configure wildmenu
set nohidden                          " close buffers instead of hiding them

""""""""""""
"Keys
"""""""""""
" keep selection after indent
vnoremap < <gv
vnoremap > >gv
:command W w
:command Q q
:command WQ wq
:command Wq wq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Close the current buffer
map <leader>bd :Bdelete<cr>:tabclose<cr>gT
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tt :tabnext 

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

nnoremap ñ :

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

"map ,c :s/^/\/\*/<CR><Esc>:nohlsearch<CR>

map <C-t> :NERDTreeToggle<CR>
let g:multi_cursor_next_key='<C-n>'
map <C-c> "+y<CR>
