" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required
set encoding=utf-8

call plug#begin()

" Basic
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'

" Plugins
Plug 'AndrewRadev/switch.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-g-dot'
Plug 'christoomey/vim-sort-motion'
Plug 'cohama/lexima.vim'
Plug 'floobits/floobits-neovim', has('nvim') ? {} : { 'on': [] }
Plug 'gorodinskiy/vim-coloresque'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/matchit.zip'

" Text objects
Plug 'kana/vim-textobj-user'
" Plug 'Julian/vim-textobj-variable-segment'
" Plug 'bps/vim-textobj-python'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
" Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
" Plug 'lucapette/vim-textobj-underscore'
Plug 'sgur/vim-textobj-parameter'
" Plug 'tek/vim-textobj-ruby'
" Plug 'vimtaku/vim-textobj-keyvalue'

" Tags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Color
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'

" Experimental
Plug 'bronson/vim-visual-star-search'
Plug 'matze/vim-move'
Plug 'terryma/vim-smooth-scroll'
Plug 'wellle/targets.vim'
Plug 'metakirby5/codi.vim'
Plug 'wincent/terminus'
Plug 'mhinz/vim-sayonara'

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
set gdefault                                     " Assume /g flag on :s substitutions
set hidden                                       " Edit various files without saving or undoing
set lazyredraw                                   " Fast macros
set linebreak
set listchars=eol:↲,tab:▶\ ,extends:>,precedes:<
set noerrorbells                                 " Don't beep
set noshowmode                                   " Don't show current mode down the bottom (airline does)
set nowrap                                       " Don't warp lines
set nrformats-=octal
set relativenumber
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
set clipboard=unnamed,unnamedplus
set termguicolors

" .tex files are LaTeX, not plaintex
let g:tex_flavor = "latex"

filetype plugin indent on

" Reaction time
set timeoutlen=300
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
set hlsearch   " Highlight search
set ignorecase " Dont ignore case
set smartcase  " Dont ignore case
set incsearch
set magic      " Magic REGEX


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


" Store undo info inside .vim/undo
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif

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

" Do not highlight trailing whitespace in insert mode
augroup whitespace
    autocmd!
    autocmd InsertEnter * :DisableWhitespace
    autocmd InsertLeave * :EnableWhitespace
augroup END

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag with FZF
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

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
cnoremap jk <esc>
cnoremap kj <esc>
cnoremap w!! w !sudo tee % >/dev/null

" Visual indent
vnoremap < <gv
vnoremap > >gv

" Open and close folds
nnoremap <leader><leader> za
nnoremap <leader>j zaj
nnoremap <leader>k zak

" Toggle hlsearch
nnoremap <silent> <leader><cr> :set hlsearch!<cr>

" Fix Y weird behaivour
nnoremap Y y$

" Toggle line wrap
nnoremap <leader>tw :windo set wrap!<cr>
" Show current line
nnoremap <leader>tl :set cursorline!<cr>
" Show chars
nnoremap <leader>tc :set list!<cr>
" Show indent guides
nnoremap <leader>ti :IndentGuidesToggle<cr>

" Set filetype
nnoremap <leader>ft :set filetype=

" Quick save and quit
nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>

" Update diffs
nnoremap du :diffupdate<cr>

" Exit insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Exit visual mode
vnoremap <leader><leader> <ESC>

" Select pasted text
noremap gV `[V+`]

" Stop annoying :q menu
noremap q: :q

" Format paragraph with Q
nnoremap Q gqip
vnoremap Q gq

" Buffers
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

" Virtual lines are real lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap $ g$

" Start and end of line on command mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" " Using spanish keyboard this is better
" " , to next f/F/t/T
" " ; to previous f/F/t/T
" nnoremap ; ,
" nnoremap , ;
" vnoremap ; ,
" vnoremap , ;

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

" EasyTag
set tags=./tags;
let g:easytags_dynamic_files = 2

" Fzf
nnoremap <leader>b :Buffers<CR>
nnoremap <C-p> :Files<CR>

let g:fzf_files_options =
  \ '--reverse ' .
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Tagbar
nnoremap <silent> <leader>tt :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

" Quick-scope

" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Rainbow
let g:rainbow_active = 0
nnoremap <leader>tr :RainbowToggle<cr>
let g:rainbow_conf = {
  \ 'ctermfgs': [
  \   'brown',
  \   'Darkblue',
  \   'darkgray',
  \   'darkgreen',
  \   'darkcyan',
  \   'darkred',
  \   'darkmagenta',
  \   'brown',
  \   'gray',
  \   'black',
  \   'darkmagenta',
  \   'Darkblue',
  \   'darkgreen',
  \   'darkcyan',
  \   'darkred',
  \   'red',
  \ ]
\ }

" Switch
let g:switch_mapping = "-"
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

    autocmd FileType terraform let b:switch_custom_definitions =
        \ [
        \   {
        \     '\(\s\+source =\) "git::ssh://\(.*\)//\(.*\)"': '\1 "../../terraform-modules/\3" # \2',
        \     '\(\s\+source =\) ".*/terraform-modules/\(.*\)" # \(.*\)': '\1 "git::ssh://\3//\2"',
        \   },
        \ ]
augroup end

" Terraform
let g:terraform_fmt_on_save = 1

" UltiSnips
inoremap <c-j> <nop>
inoremap <c-k> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" Vim-easy-align
nmap ga <Plug>(LiveEasyAlign)
xmap ga <Plug>(LiveEasyAlign)
xmap <Enter> <Plug>(LiveEasyAlign)

" Vim-fugitive
nnoremap <leader>gb  :Gblame<cr>
nnoremap <leader>gc  :Gcommit<cr>
nnoremap <leader>gd  :Gvdiff<cr>
nnoremap <leader>gm  :Gmove<space>
nnoremap <leader>gs  :Gstatus<cr>

" Vim-gitgutter
let g:gitgutter_diff_args = '-w'
let g:gitgutter_map_keys = 0
set signcolumn=yes
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 0

" Vim supertab
let g:SuperTabDefaultCompletionType = "context"

" Vim syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_ansible_checkers = ['yaml/yamllint']

" Vim syntastic
let g:UltiSnipsListSnippets = "<c-l>"

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Vim rooter
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 8, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 8, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 8, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 8, 4)<CR>

" Codi
let g:codi#rightalign = 0
