" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'EinfachToll/DidYouMean'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-g-dot'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'matchit.zip'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'shime/vim-livedown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wincent/terminus'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Color
Plugin 'nanotech/jellybeans.vim'
Plugin 'NLKNguyen/papercolor-theme'

" Experimental
Plugin 'AndrewRadev/switch.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tommcdo/vim-exchange'

" End of the vundle settings
call vundle#end()            " required
filetype plugin indent on    " required

" GUI --------------------------------------------------
if has("gui_running")
  " Maximize gvim window (on my screen)
  set lines=40 columns=150
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

" Misc --------------------------------------------------
set hidden " Edit various files without saving or undoing
set noerrorbells        " don't beep
set noshowmode          " dont show current mode down the bottom
set nowrap              " don't warp lines
set relativenumber      " show relative line number
set showcmd             " show incomplete cmds down the bottom
set showmatch           " Show matching brackets when text indicator is over them
set virtualedit=block
set wildmenu            " Enable tab
set lazyredraw
set ttyfast
set autoread            " Reload file if changed
set scrolloff=1
set wildignore+=*/tmp/*,/tmp/*,*.so,*.swp     " MacOSX/Linux


set timeoutlen=500
set ttimeoutlen=100

" Colorscheme
let g:jellybeans_overrides = {
\ 'Cursor': { 'guibg': 'ff00ee', 'guifg': 'ffffff' },
\ 'Search': { 'guifg': '00dddd', 'attr': 'underline' },
\}
colorscheme jellybeans " Dark
" colorscheme PaperColor " Light

" Dont backup files
set nobackup
set noswapfile

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Allways show status line

" Searching configs
set hlsearch            " Highlight search
set ignorecase          " Ignore case
set incsearch           " Start searching incremental
set smartcase           " unless it has caps
set magic               " Magic REGEX

" Show $ with 'cw' and similar commands
set cpoptions+=$

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent

" Temporary tab wrapper
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Visual Mode search with */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Filetypes --------------------------------------------------
" Enable syntax highighting
syntax enable

au FileType html setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType markdown setlocal softtabstop=2 shiftwidth=2 tabstop=2
au FileType ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Maps --------------------------------------------------
" Leader is <space>
nnoremap <space> <nop>
vnoremap <space> <nop>
let mapleader="\<space>"

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

" Toggle hlsearch
nnoremap <silent> <leader><cr> :set hlsearch!<cr>
nnoremap <silent> <cr><leader> :set hlsearch!<cr>

" Keep search terms centered
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Fix Y weird behaivour
nnoremap Y y$

" Toggle line wrap
nnoremap <leader>lw :set wrap!<cr>

" Show current line
nnoremap <leader>ll :set cursorline!<cr>

" Quick save and quit
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" Exit insert mode
inoremap jj <ESC>

" Exit visual mode
vnoremap <leader><leader> <ESC>

" Select pasted text
noremap gV `[V+`]

" Stop annoying Q things
noremap q: :q
noremap Q <nop>

" Buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>bd :bd<cr>

" Virtual lines are real lines
nnoremap j gj
nnoremap k gk

" Plugin Config --------------------------------------------------
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

" Commentary
augroup commentstrings
    autocmd FileType matlab set commentstring=%\ %s
augroup END

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" EasyTag
set tags=./tags;
let g:easytags_dynamic_files = 2

" Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1

" Switch
let g:switch_mapping = "-"

" Vim-gitgutter
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_column_always = 1

