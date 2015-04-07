" Bundle {{{
" Non compatible with vi
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'matchit.zip'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" End of the vundle settings
call vundle#end()            " required
filetype plugin indent on    " required }}}
" Misc {{{
" Edit various files without saving or undoing
set hidden

" Misc
set noerrorbells        " don't beep
set noshowmode          " dont show current mode down the bottom
set nowrap              " don't warp lines
set number              " show line numbe
set showcmd             " show incomplete cmds down the bottom
set so=5                " Dont go to the edges when moving vertically
set virtualedit=block
set wildmenu            " Enable tab
syntax on               " enable syntax

let g:jellybeans_overrides = {
\ 'Cursor': { 'guibg': 'ff00ee', 'guifg': 'ffffff' },
\ 'Search': { 'guifg': '00dddd', 'attr': 'underline' },
\}
colorscheme jellybeans


set showmatch " Show matching brackets when text indicator is over them

" Dont backup files
set nobackup
set noswapfile

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

set laststatus=2 " Allways show status line

" Leader is <space>
nnoremap <space> <nop>
let mapleader=" "

" Searching configs
set hlsearch            " Highlight search
set ignorecase          " Ignore case
set incsearch           " Start searching incremental
set smartcase           " unless it has caps
nnoremap <silent> <leader><cr> :set hlsearch!<cr>
nnoremap <silent> <cr><leader> :set hlsearch!<cr>

" Show $ with 'cw' and similar commands
set cpoptions=ces$

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent
" }}}
" Filetypes {{{
" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable

augroup filetype
 au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 au BufRead,BufNewFile *.cup             set filetype=cup
 au BufRead,BufNewFile *.pl              set filetype=prolog
augroup END

au Syntax jflex so ~/.vim/syntax/jflex.vim
au Syntax cup so ~/.vim/syntax/cup.vim
au FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType markdown setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2
" end Filetpyes }}}
" Maps {{{
" Edit vimrc and source vimrc
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:AirlineRefresh<cr>

" Toggle paste mode
nmap <silent> <F2> :set paste!<cr>
set pastetoggle=<F2>

" Comand line bindings
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
cnoremap jj <esc>

" Open and close folds with <space>
nnoremap <space><space> za
" Quick save
nnoremap <leader>w :w!<cr>

" Exit insert mode
inoremap jj <ESC>

" Split line on this or next space
nnoremap K hf<space>r<cr>

" Buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>bd :bd<cr>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Move from frame to frame
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Force myself to use hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}
" Plugin Config {{{1
 
" NERDTree {{{2
nnoremap <leader>t :NERDTreeToggle<cr>
" }}}2
" UltiSnips {{{2
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}2
"  Airline {{{2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1
" }}}2
" Instant Markdown {{{2
let g:instant_markdown_autostart = 0
"  }}}2
" }}}1
