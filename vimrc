" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required
set encoding=utf-8

call plug#begin()

" Plugins
Plug 'AndrewRadev/switch.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-g-dot'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'matchit.zip'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'shime/vim-livedown'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'wincent/terminus'

" Text objects pre
Plug 'kana/vim-textobj-user'
" Text objects
Plug 'kana/vim-textobj-entire'
Plug 'whatyouhide/vim-textobj-erb'
Plug 'tek/vim-textobj-ruby'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-indent'

" Tags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" Color
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'

" Experimental
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

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
set number              " show relative line number
set showcmd             " show incomplete cmds down the bottom
set showmatch           " Show matching brackets when text indicator is over them
set virtualedit=block
set wildmenu            " Enable tab
set lazyredraw
set ttyfast
set autoread            " Reload file if changed
set backspace=indent,eol,start
set nrformats-=octal
set scrolloff=1
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.orig

filetype plugin indent on


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
set noignorecase        " Dont ignore case
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
set wildmode=list:longest,list:full
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
vnoremap * :<C-u>call <SID>VSetSearch()<cr>//<cr><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<cr>??<cr><c-o>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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
cnoremap w!! w !sudo tee % >/dev/null

" Toggle hlsearch
nnoremap <silent> <leader><cr> :set hlsearch!<cr>

" Start and end with <bs> and <cr>
nnoremap <cr> G
nnoremap <bs> gg
vnoremap <cr> G
vnoremap <bs> gg

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

" Quickfix
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>co :copen<cr>

" Virtual lines are real lines
nnoremap j gj
nnoremap k gk

" Using spanish keyboard this is better
" , to next f/F/t/T
" ; to previous f/F/t/T
nnoremap ; ,
nnoremap , ;

" Plugin Config --------------------------------------------------
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

" Ag.vim
nnoremap <leader>a :Ag<space>

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
nnoremap <silent> <leader>t :TagbarToggle<cr>
let g:tagbar_autoclose = 1

" Switch
let g:switch_mapping = "-"

" UltiSnips
inoremap <c-j> <nop>
inoremap <c-k> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Vim-gitgutter
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_column_always = 1

