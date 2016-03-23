set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Monokai color scheme
Plugin 'sickill/vim-monokai'

" Very nice file browser
Plugin 'scrooloose/nerdtree'

" Vinegar, a better file browser
Plugin 'tpope/vim-vinegar'

" Git tools
Plugin 'tpope/vim-fugitive'

" Full path fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" Emmet (For HTML)
Plugin 'mattn/emmet-vim'

" Jump around documents
Plugin 'easymotion/vim-easymotion'

" Fancy status line
Plugin 'bling/vim-airline'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional for snippets:
Plugin 'honza/vim-snippets'

" Syntax checker
Plugin 'scrooloose/syntastic'

" surround.vim: quoting/parenthesizing made simplsurround.vim: quoting/parenthesizing made simplee
Plugin 'tpope/vim-surround'

" Code completion
"Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader = ','
set t_Co=256

syntax enable

try
    colorscheme monokai
catch
endtry


scriptencoding utf-8
set encoding=utf-8
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set incsearch
set hlsearch
set laststatus=2
set clipboard=unnamedplus
set cursorline                   " Highlight current line

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers=['php']

" Forget sudo ??
cmap w!! w !sudo tee > /dev/null %<CR>

" Auto source .vimrc on save 
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Make it easy to edit the .vimrc file
nmap <Leader>ev :e $MYVIMRC<cr>

" Simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Fast saves
nmap <leader>w :w!<cr>

" Duplicate line
vmap D Yp

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Show (partial) command in the status line
set showcmd

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Search symbol on buffer
nmap <C-r> :CtrlPBufTag<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Remove search results
command! H let @/=""

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" NERDTree
map <C-b> :NERDTreeToggle<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
