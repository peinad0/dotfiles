" Don't try to be vi compatible
set nocompatible

" autocomplete is getting much better :e <tab>...
set  wildchar=<Tab> wildmenu wildmode=full
set    wildignore=*.o,*.obj,*.bak,*.exe,*.swp
set ttimeout
set ttimeoutlen=0

" System clipboard
set clipboard=unnamed
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy

" Commands {{{1

" remove trailing spaces
command! RemoveTrailingSpaces :silent! %s/\v(\s+$)|(\r+$)//g<bar>
		\:exe 'normal ``'<bar>
		\:echo 'Remove trailing spaces and ^Ms.'

command! JustOneInnerSpace :let pos=getpos('.')<bar>
		\:silent! s/\S\+\zs\s\+/ /g<bar>
		\:silent! s/\s$//<bar>
		\:call setpos('.', pos)<bar>
		\:nohl<bar>
		\:echo 'Just one space'

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number


" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
" set textwidth=79
" set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Edit the vimrc file
nmap <silent> ,ev :e ~/.vimrc<CR>
nmap <silent> ,sv :so ~/.vimrc<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Shift + l/h to change tabs right/left
noremap <S-l> gt
noremap <S-h> gT

" Color scheme (terminal)
set t_Co=256
set background=dark

" {{{
  colorscheme gruvbox
  let g:gruvbox_invert_selection = 0
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_italicize_comments = 0
  let g:gruvbox_italicize_strings = 0
" }}}
