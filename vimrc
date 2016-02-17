scriptencoding utf-8

"reset to vim-defaults
set nocompatible      "use vim-defaults instead of vi-defaults easier, more user friendly

let mapleader=','
let maplocalleader= ' '

nmap <Leader>Z :set foldlevel=0<CR>
nmap <Leader>A :set foldlevel=1000<CR>

nmap <Leader>l :call ToggleRelativeAbsoluteNumber<CR>


"display settings
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
"set matchpairs+=<:>     "specially for html

"editor settings
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
"set fileformats=unix,dos    "only detect unix file format, displays that ^M with dos files

"system settings
set lazyredraw          "no redraws in macros
set confirm             "get a dialog when :q, :w, or :wq fails
set viminfo='20,\"500   "remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              "remember undo after quitting
set history=1000
set backup

set mouse=v             "use mouse in visual mode not normal,insert,command,help mode

set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
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
set more                        " to show pages using `more` in command outpouts

set textwidth=80
set colorcolumn=81

"color settings
syntax enable
syntax on
set hlsearch       "highlight search very useful!
set incsearch      "search incremently search while typing



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


" NEOBUNDLE {{{ ===============================================================

set nocompatible             " No to the total compatibility with the ancient vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif


" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

" Unite sources
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':
            \['file_mru', 'directory_mru']}}

NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'Rykka/colorv.vim'

NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'davidhalter/jedi-vim.git'

NeoBundle 'luochen1990/rainbow'

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'
" Snippets for Ultisnips
NeoBundle 'honza/vim-snippets'

NeoBundle 'ctrlpvim/ctrlp.vim.git'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'Yggdroot/indentLine'

NeoBundle 'bling/vim-airline'

NeoBundle 'terryma/vim-multiple-cursors.git'

NeoBundle 'easymotion/vim-easymotion'

NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}

NeoBundle 'vim-scripts/Conque-Shell.git'

NeoBundle 'junegunn/limelight.vim.git'

NeoBundle 'scrooloose/nerdtree.git'

NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'python-rope/rope.git'

NeoBundle 'junegunn/vim-easy-align.git'

NeoBundle 'ivanov/vim-ipython.git'

NeoBundle 'jpalardy/vim-slime.git'

NeoBundle 'unblevable/quick-scope'

NeoBundle 'drmikehenry/vim-fontsize.git'

NeoBundle 'vim-scripts/vim-auto-save.git'

NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}

NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer

" toggle comments
NeoBundle 'tpope/vim-commentary'

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" }}}

NeoBundle 'jmcantrell/vim-virtualenv'


NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}

NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}


NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}

" easily window resizing
NeoBundle 'jimsei/winresizer'

" Tmux {{{

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

" }}}

" API Web {{{

NeoBundle 'mattn/webapi-vim'

" }}}



" END BUNDLES }}}

call neobundle#end()

" Auto install the Plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}




 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck


colorscheme Monokai

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

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


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

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


" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}




" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
    au FileType xquery setlocal commentstring=(:\ %s\ :)
augroup END

" }}}


" Gundo {{{ ------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}


" Neobundle {{{

let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

" }}}


" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}


nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" }}}


" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'

let g:winresizer_finish_with_escape = 1
"let g:winresizer_keycode_finish = 27

" }}}

" PYTHON {{{

au FileType python setlocal foldlevel=1000

" }}}

" Folding {{{

set foldmethod=syntax

" Toggle folding

nnoremap \ za
vnoremap \ za

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

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}


let NERDTreeIgnore = ['\.pyc$']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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

let g:ctrlp_cmd = 'CtrlPBuffer'

nnoremap <silent><Leader>a :Unite -silent -no-quit grep:.<CR><C-R><C-w><CR>
nnoremap <silent><Leader>s :Unite -silent -no-quit grep:.<CR>

nnoremap <silent><Leader># :call TagTog() <CR>

function! TagTog()
    :noautocmd TagbarToggle
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
"nnoremap <silent><Leader>E :call EnableNT()<CR>


autocmd BufEnter * if &modifiable && bufname('')!~"\ColorV" && (bufname('')=~"\.py" || bufname('')=~"\.kv")  | NERDTreeFind | wincmd p | endif
autocmd VimEnter * wincmd l

"autocmd VimEnter * call NERDTreeToggleInCurDir()



nnoremap <silent><Leader>h :/<C-R><C-w><CR>
nnoremap <silent><Leader>H :nohl<CR>



call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 200,
    \ 'prompt' : '>>> ',
    \ 'enable_start_insert' : 0,
    \ 'enable_short_source_names' : 0,
    \ 'marked_icon' : '✓',
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
\ }

call unite#custom#profile('default', 'context', default_context)

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '



let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")


let g:slime_python_ipython = 1

let g:slime_target = "tmux"

let g:slime_paste_file = "$HOME/.slime_paste"

let g:slime_paste_file = tempname()


if $TMUX == ''
    set clipboard+=unnamed
    set clipboard+=unnamedplus
endif

" use LocalLeader for movement between vim panes
nnoremap <silent><LocalLeader>h :wincmd h<CR>
nnoremap <silent><LocalLeader>j :wincmd j<CR>
nnoremap <silent><LocalLeader>k :wincmd k<CR>
nnoremap <silent><LocalLeader>l :wincmd l<CR>



function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')



" PythonMode {{{ -------------------------------------------------------------


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

" }}}


autocmd FileType python setlocal completeopt-=preview


nnoremap <silent><Leader>js :%!python -m json.tool<CR>

nnoremap <silent><Leader>p :call OpenPythonRelatedFiles()<CR>

function! OpenPythonRelatedFiles()
    n **/*.kv
    n **/*.py
endfunction


function! GoToOrOpenDefs()
    try
        exe "<C-c><g>"
    catch /.*/
        exe ":Unite -silent -no-quit grep:.<CR><C-R><C-w><CR>"
    endtry
    return 0
endfunction


nnoremap <silent><Leader>@ :CtrlPBufTagAll<CR>

call ToggleRelativeAbsoluteNumber()
call ToggleRelativeAbsoluteNumber()


" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gt <Plug>(EasyAlign)

let g:easy_align_bypass_fold = 1



let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification


let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
