" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required
set encoding=utf-8

call plug#begin()

" Plugins
Plug 'AndrewRadev/switch.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-g-dot'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'matchit.zip'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'shime/vim-livedown'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

" Text objects pre
Plug 'kana/vim-textobj-user'
" Text objects
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'tek/vim-textobj-ruby'
Plug 'whatyouhide/vim-textobj-erb'

" Tags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" Color
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'

" Experimental
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'

" Plug 'wincent/terminus'

call plug#end()

" GUI --------------------------------------------------
if has("gui_running")
  " Maximize gvim window (on my screen)
  set lines=40 columns=150
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

" Misc --------------------------------------------------
set autoread                                     " Reload file if changed
set backspace=indent,eol,start
set cpoptions+=$                                 " Show $ with 'cw' and similar commands
set hidden                                       " Edit various files without saving or undoing
set lazyredraw                                   " Fast macros
set listchars=eol:↲,tab:▶\ ,extends:>,precedes:<
set noerrorbells                                 " Don't beep
set noshowmode                                   " Don't show current mode down the bottom (airline does)
set nowrap                                       " Don't warp lines
set nrformats-=octal
set number                                       " Show absolute line number
set scrolloff=1
set showcmd                                      " Show incomplete cmds down the bottom
set showmatch                                    " Show matching brackets when text indicator is over them
set splitbelow
set splitright
set ttyfast
set virtualedit=block
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
set wildignore+=*.orig
set wildignore+=.hg,.git,.svn                    " Version control
set wildmenu                                     " Enable tab
set wildmode=list:full,full


filetype plugin indent on

" Reaction time
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
set incsearch
set magic               " Magic REGEX


" Do not continue comments when adding a line with o/O
augroup no_comments_oO
    autocmd!
    autocmd BufEnter * set formatoptions-=o
augroup END


" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent

" Tab wrapper
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

augroup my_filetypes
    autocmd!
    autocmd FileType html     setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType markdown setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType ruby     setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType xml      setlocal softtabstop=2 shiftwidth=2 tabstop=2
    autocmd FileType sql      setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END

" Maps --------------------------------------------------
" Leader is <space>
nnoremap <space> <nop>
vnoremap <space> <nop>
let mapleader=" "

" Edit vimrc and source vimrc
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:AirlineRefresh<cr>

" Toggle paste mode
nmap <silent> <F2> :set paste!<cr>
set pastetoggle=<F2>
" Remove paste when leaving Insert mode
augroup my_paste_group
    autocmd!
    autocmd InsertLeave * set nopaste
augroup END

" Command line bindings
command! W w
cnoremap jj <esc>
cnoremap w!! w !sudo tee % >/dev/null

" Toggle hlsearch
nnoremap <silent> <leader><cr> :set hlsearch!<cr>

" Fix Y weird behaivour
nnoremap Y y$

" Toggle line wrap
nnoremap <leader>lw :set wrap!<cr>
" Show current line
nnoremap <leader>ll :set cursorline!<cr>
" Show chars
nnoremap <leader>lc :set list!<cr>

" Quick save and quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>

" Update diffs
nnoremap du :diffupdate<cr>

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
nnoremap <leader>bd :Bdelete<cr>
" Quickfix
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>co :copen<cr>

" Virtual lines are real lines
nnoremap j gj
nnoremap k gk

" Start and end of line on command mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Using spanish keyboard this is better
" , to next f/F/t/T
" ; to previous f/F/t/T
nnoremap ; ,
nnoremap , ;

" Swap 0/^ and '/`
nnoremap 0 ^
nnoremap ^ 0
nnoremap ` '
nnoremap ' `

" Plugin Config --------------------------------------------------
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

" Ag.vim
nnoremap <leader>a :Ag<space>

" Commentary
augroup commentstrings
    autocmd!
    autocmd FileType matlab set commentstring=%%s
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
let g:switch_mapping = "gS"
augroup my_switch_group
    autocmd!
    autocmd FileType gitrebase let b:switch_custom_definitions =
        \ [
        \   {
        \     'pick': 'reword',
        \     'reword': 'edit',
        \     'edit': 'squash',
        \     'squash': 'fixup',
        \     'fixup': 'pick',
        \   },
        \ ]
augroup end

" UltiSnips
inoremap <c-j> <nop>
inoremap <c-k> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Vim-after-object
autocmd VimEnter * call after_object#enable(['A', 'AA'], '=', ':', '-', '#', ' ')

" Vim-easy-align
nmap ga <Plug>(LiveEasyAlign)
xmap ga <Plug>(LiveEasyAlign)
xmap <Enter> <Plug>(LiveEasyAlign)

" Vim-fugitive
nnoremap <leader>gb  :Gblame<cr>
nnoremap <leader>gc  :Gcommit<cr>
nnoremap <leader>gd  :Gdiff<cr>
nnoremap <leader>gm  :Gmove<space>
nnoremap <leader>gr  :Gread<cr>:w<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gw  :Gwrite<cr>:w<cr>
nnoremap <leader>gps :Dispatch :Gpush<cr>
nnoremap <leader>gpl :Dispatch :Gpull<cr>

" Vim-gitgutter
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_column_always = 1

