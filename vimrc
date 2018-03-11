scriptencoding utf-8

"##################################
" VIM DEFAULTS 
"##################################
"reset to vim-defaults
set nocompatible      "use vim-defaults instead of vi-defaults easier, more
"user friendly

let mapleader=','
let maplocalleader= ' '

nmap <Leader>Z :set foldlevel=0<CR>
nmap <Leader>A :set foldlevel=1000<CR>

nmap <Leader>l :call ToggleRelativeAbsoluteNumber<CR>


""display settings
set sidescroll=4
set sidescrolloff=1
set background=dark     "enable for dark terminals
set nowrap              "dont wrap lines
set scrolloff=8         "8 lines above/below cursor when scrolling
set number              "show line numbers
set showmatch           "show matching bracket briefly jump
set showmode            "show mode in status bar insert/replace/...
set showcmd             "show typed command in status bar
set ruler               "show cursor position in status bar
set title               "show file in titlebar
set wildmenu            "completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        "use 2 lines for the status bar
set matchtime=2         "show matching bracket for 0.2 seconds
set matchpairs+=<:>     "specially for html

""editor settings
set esckeys             "map missed escape sequences enables keypad keys
set ignorecase          "case insensitive searching
set smartcase           "but become case sensitive if you type uppercase characters
set smartindent         "smart auto indenting
set smarttab            "smart tab handling for indenting
set magic               "change the way backslashes are used in search patterns
set bs=indent,eol,start "Allow backspacing over everything in insert mode

set tabstop=4           "number of spaces a tab counts for
set shiftwidth=4        "spaces for autoindents
set expandtab           "turn a tabs into spaces

set fileformat=unix     "file mode is unix
"set fileformats=unix,dos    "only detect unix file format, displays that ^M
"with dos files
"
""system settings
set lazyredraw          "no redraws in macros
set confirm             "get a dialog when :q, :w, or :wq fails
set viminfo='20,\"500   "remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              "remember undo after quitting
set history=1000
set backup

set mouse=v             "use mouse in visual mode not normal,insert,command,help mode

set encoding=utf8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if
" you
" " only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command

set number relativenumber

set cmdheight=1

set guifont=FiraCode_Nerd_Font:h11

set textwidth=80
"set colorcolumn=81

"color settings
syntax enable
syntax on
filetype plugin indent on
set hlsearch       "highlight search very useful!
set incsearch      "search incremently search while typing
let g:solarized_termtrans = 1
let g:solarized_termcolors=256

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
"if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    set undofile
    let &undodir = myUndoDir
"endif

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


"##################################
" VIM PLUGINS
"##################################

call plug#begin('~/.vim/bundle')
Plug 'kien/ctrlp.vim' 
Plug 'tacahiroy/ctrlp-funky'
Plug 'morhetz/gruvbox'
Plug 'nightsense/stellarized'
Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme'
Plug 'honza/vim-snippets'
Plug 'yggdroot/indentline'
Plug 'elzr/vim-json'
Plug 'python-mode/python-mode'
Plug 'luochen1990/rainbow'
Plug 'SirVer/ultisnips'
Plug 'junegunn/limelight.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'tweekmonster/braceless.vim'
Plug 'zirrostig/vim-schlepp'
Plug 'mnick/vim-pomodoro'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jmcantrell/vim-virtualenv'
Plug 'fisadev/vim-isort'
Plug 'salsifis/vim-transpose'
Plug 'vimez/vim-tmux'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install'  }
Plug 'Rykka/colorv.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bagrat/vim-workspace'
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'farmergreg/vim-lastplace'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'trevordmiller/nova-vim'
Plug 'crusoexia/vim-monokai'
Plug 'neovimhaskell/haskell-vim'
Plug 'jpalardy/vim-slime'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-speeddating'
Plug 'sjl/gundo.vim'
call plug#end()


colorscheme gruvbox

"monokai, onedark

"##################################
" VIM CUSTOM CONFIG 
"##################################
set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=/usr/local/opt/fzf

let g:rainbow_active = 1

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig


nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

autocmd FileType python BracelessEnable +indent


vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight


" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}


" Airline {{{

set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}


" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}


" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Use Ranger as a file explorer {{{

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>
" }}}


" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}


" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}


" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

let NERDTreeIgnore = ['\.pyc$']

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

function! ToggleLimeLight()
  if &so==9999
    set so=8
    :Limelight!

  else
    set so=9999
    :Limelight
  endif
endfunction

nmap <silent> gl :call ToggleLimeLight()<CR>
"xmap gl <Plug>(Limelight)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.3

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

au FileType gitcommit set tw=72 | set spell | set colorcolumn=50


function! TagTog()
    :TagbarToggle
endfunction



function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":noautocmd NERDTreeClose"
    set eventignore+=BufEnter
  else
    set eventignore-=BufEnter
    exe ":NERDTreeFind"
  endif
endfunction

nnoremap <silent><Leader>X :call NERDTreeToggleInCurDir()<CR>

if $TMUX == ''
    set clipboard+=unnamed
    set clipboard+=unnamedplus
endif

" use LocalLeader for movement between vim panes
nnoremap <silent><LocalLeader>h :wincmd h<CR>
nnoremap <silent><LocalLeader>j :wincmd j<CR>
nnoremap <silent><LocalLeader>k :wincmd k<CR>
nnoremap <silent><LocalLeader>l :wincmd l<CR>


autocmd FileType python setlocal completeopt-=preview

nnoremap <silent><Leader>js :%!python -m json.tool<CR>


let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 0
let g:pymode_rope = 1
let g:pymode_doc = 0

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 1
let g:pymode_syntax_all = 1

" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5

" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 0

" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "/tmp/pomodoro.log"

"autocmd VimEnter * call NERDTreeToggleInCurDir()
"
"autocmd VimEnter * wincmd l
"
"autocmd BufEnter * if &modifiable && filereadable(expand('%:p'))  && bufname('')!~"\ColorV" && (bufname('')=~"\.py" || bufname('')=~"\.kv")  | NERDTreeFind | wincmd p | endif


let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

