" Bundle
" Non compatible with vi
set nocompatible
filetype off                  " required
set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Basic
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Plugins
Plug 'AndrewRadev/switch.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-g-dot'
Plug 'christoomey/vim-sort-motion'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'luochen1990/rainbow'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-endwise'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/matchit.zip'
Plug 'matze/vim-move'
Plug 'bronson/vim-visual-star-search'
Plug 'wincent/terminus'
Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'blueyed/vim-diminactive'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wellle/targets.vim'
Plug 'chrisbra/csv.vim'
Plug 'reedes/vim-pencil'
Plug 'pixelastic/vim-undodir-tree'
Plug 'justinmk/vim-dirvish'
Plug 'raimon49/requirements.txt.vim'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'julian/vim-textobj-variable-segment'

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Color
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'themercorp/themer.lua'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-git'
Plug 'andersevenrud/cmp-tmux'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lua'

" Experimental
Plug 'azabiong/vim-highlighter'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'farmergreg/vim-lastplace'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim' " Replaces vim-gitgutter
Plug 'ZhiyuanLck/smart-pairs' " Replaces lexima
Plug 'lukas-reineke/indent-blankline.nvim' " Repalces 'Yggdroot/indentLine'
Plug 'tweekmonster/startuptime.vim'
Plug 'stevearc/dressing.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yioneko/nvim-yati'


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
set wrap                                         " Don't warp lines
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
set clipboard=unnamed,unnamedplus
set termguicolors
set foldcolumn=1
set numberwidth=3
set foldmethod=syntax
set foldlevelstart=99
set guicursor=
set cursorline

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/Users/jcpadial/miniconda3/envs/neovim/bin/python'

" Folding
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 6
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

nnoremap zO zczO

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
augroup END

" Keep cursor position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
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
lua << EOF
EOF
colorscheme themer_jellybeans " Dark
" colorscheme jellybeans " Dark
" colorscheme PaperColor " Light
" TODO: Update to themer config
highlight Search guifg=#43dede guibg=black
highlight Search gui=underline guifg=#00dddd guibg=#302028
highlight FoldColumn guifg=#535D66 guibg=#1f1f1f

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Dont backup files
set nobackup
set noswapfile

" Status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2 " Always show status line

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

" .localrc is bash
augroup my_rc_files
    autocmd!
    autocmd BufEnter .localrc :set filetype=sh
    autocmd BufEnter .commonrc :set filetype=sh
    autocmd BufEnter .functions :set filetype=sh
augroup END

" Do not highlight trailing whitespace in insert mode
augroup whitespace
    autocmd!
    autocmd InsertEnter * :DisableWhitespace
    autocmd InsertLeave * :EnableWhitespace
augroup END

nnoremap <C-p> :Telescope git_files<cr>

" Maps --------------------------------------------------
" Leader is <space>
nnoremap <space> <nop>
vnoremap <space> <nop>
let mapleader=" "

" Edit vimrc and source vimrc
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:AirlineRefresh<cr>

nnoremap <leader>ip :r!curl -s ifconfig.co<cr>
" Toggle paste mode
nmap <silent> <F2> :set paste!<cr>
set pastetoggle=<F2>
" Remove paste when leaving Insert mode
augroup my_paste_group
    autocmd!
    autocmd InsertLeave * set nopaste
augroup END

" Start and end of line on command mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Command line bindings
command! W w
cnoremap jk <cr>
cnoremap kj <cr>
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
nnoremap <leader>ti :IndentBlanklineToggle<cr>

" Set filetype
nnoremap <leader>ft :Telescope filetypes<cr>

" Quick save and quit
nnoremap <leader>q :Sayonara!<cr>
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>c :close<cr>

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

" Swap 0/^ and '/`
nnoremap 0 ^
nnoremap ^ 0

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Plugin Config --------------------------------------------------

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts=1
let g:airline#extensions#csv#column_display = 'Name'

" Rainbow
let g:rainbow_active = 1
nnoremap <leader>tr :RainbowToggle<cr>
let g:rainbow_conf = {
  \ 'guifgs': [
    \ '#E06C75',
    \ '#E5C07B',
    \ '#98C379',
    \ '#56B6C2',
    \ '#61AFEF',
    \ '#C678DD',
  \ ],
  \ 'separately': {
  \		'vim-plug': {
  \			'syn_name_prefix': 'vimPlugRainbow',
  \		},
  \	},
\ }

" UltiSnips
inoremap <c-j> <nop>
inoremap <c-k> <nop>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets = "<c-l>"
nnoremap <leader>es :UltiSnipsEdit<cr>

" CSV
let g:csv_no_conceal = 1

" Pandoc
let g:pandoc#syntax#conceal#use = 0

" Terraform
let g:terraform_fmt_on_save = 1

" Wilder
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
call wilder#set_option('modes', ['/', '?', ':'])

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'sorter': wilder#python_difflib_sorter(),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))

" Switch
let g:switch_mapping = "-"
augroup my_switch_group
    autocmd!
    autocmd FileType terraform let b:switch_custom_definitions =
        \ [
        \   {
        \     '\(\s\+source\s\+=\)\s\+"git::ssh://\([^/]*\)/\([^/]*\)/\([^?]*\)\(?ref.*\)*"': '\1 "../../terraform-modules/\4" # \2/\3/\4\5',
        \     '\(\s\+source\s\+=\)\s\+".*/terraform-modules/[^ ]*\s*#\s\+\(.*\)': '\1 "git::ssh://\2"',
        \   },
        \   {
        \     '^\(\s*\w\+\s\+=\)\s\+false': '\1 true',
        \     '^\(\s*\w\+\s\+=\)\s\+true': '\1 false',
        \   },
        \ ]
augroup end

" Gutentags
let g:gutentags_project_root = ['.git', '.svn', '.root', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px']
" let g:gutentags_trace = 1
let g:gutentags_file_list_command = {
            \  'markers': {
                \  '.git': 'git ls-files',
                \  '.hg': 'hg files',
                \  }
            \  }

" Ag.vim
nnoremap <leader>a :Ag!<space>

" Fzf
nnoremap <leader>b :Telescope buffers<CR>

" Requirements.txt
let g:requirements#detect_filename_pattern = '\vrequire(ment)?s/?.*\.(txt|in)$'

" Tagbar
nnoremap <silent> <leader>tt :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

let g:tagbar_type_terraform = {
    \ 'ctagstype' : 'terraform',
    \ 'kinds' : [
        \ 'r:Resources',
        \ 'd:Datas',
        \ 'v:Variables',
        \ 'p:Providers',
        \ 'o:Outputs',
        \ 'm:Modules',
        \ 'f:TFVars'
    \ ],
    \ 'sort' : 1,
\ }

" Commentary
augroup commentstrings
    autocmd!
    autocmd FileType matlab set commentstring=%%s
    autocmd FileType ansible_template set commentstring=#%s
    autocmd FileType Jenkinsfile set commentstring=//%s
augroup END

" Vim-easy-align
nmap ga <Plug>(LiveEasyAlign)
xmap ga <Plug>(LiveEasyAlign)
xmap <Enter> <Plug>(LiveEasyAlign)

" Git mappings, fugitive and gitsigns
nnoremap <leader>gb  :Gitsigns blame_line<cr>
nnoremap <leader>gB  :Git blame<cr>
nnoremap <leader>gc  :Gcommit<cr>
nnoremap <leader>gd  :Gvdiff<cr>
nnoremap <leader>gm  :Gmove<space>
nnoremap <leader>gs  :Gstatus<cr>

" Vim-markdown
let g:markdown_mapping_switch_status = '<CR>'

" Lua
lua require("main")

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
