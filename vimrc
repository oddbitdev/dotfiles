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
Plug 'simnalamburt/vim-mundo'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neomake/neomake'
Plug 'Shougo/denite.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'chriskempson/base16-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell'  }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell'  }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell'  }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell'  }
Plug 'alx741/vim-hindent'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'"
call plug#end()


if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


colorscheme base16-gruvbox-dark-medium


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


" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" }}}

" Alignment {{{

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align
" }}}

" Tags {{{

map <leader>tt :TagbarToggle<CR>

set tags=tags;/
set cst
set csverb

" }}}


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

let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'

" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5

" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 0

" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "/tmp/pomodoro.log"


" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>


"autocmd VimEnter * call NERDTreeToggleInCurDir()
"
"autocmd VimEnter * wincmd l
"
"autocmd BufEnter * if &modifiable && filereadable(expand('%:p'))  && bufname('')!~"\ColorV" && (bufname('')=~"\.py" || bufname('')=~"\.kv")  | NERDTreeFind | wincmd p | endif

" EasyMotion {{{
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}

" Editing mappings {{{

" Utility function to delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" }}}



" Tags {{{

set tags+=codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update --force<CR>:call system("git-hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

set csprg=hscope
set csto=1 " search codex tags first

nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()

" }}}

" Hoogle {{{
" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

" }}}

" Formatting {{{
" Use hindent instead of par for haskell buffers
autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1

" Delete trailing white space on save
augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END

" }}}

"Completion, Syntax check, Lint & Refactor {{{

augroup haskell
  autocmd!
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

" Provide (neco-ghc) omnicompletion
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Disable hlint-refactor-vim's default keybindings
let g:hlintRefactor#disableDefaultKeybindings = 1

" hlint-refactor-vim keybindings
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :Neomake ghcmod<CR>

" open the neomake error window automatically when an error is found
let g:neomake_open_list = 2

" Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'
" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Haskell Lint
nmap <silent> <leader>hl :Neomake hlint<CR>

" Options for Haskell Syntax Check
let g:neomake_haskell_ghc_mod_args = '-g-Wall'

" }}}

" Haskell syntax {{{
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords/"
" }}}

" Point Conversion {{{

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

" }}}

