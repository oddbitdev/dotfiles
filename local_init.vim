set sidescroll=4
set sidescrolloff=1
set nowrap              "dont wrap lines
set scrolloff=8         "8 lines above/below cursor when scrolling
set showmatch           "show matching bracket briefly jump
set matchtime=2         "show matching bracket for 0.2 seconds
set ignorecase          "case insensitive searching
set smartcase           "but become case sensitive if you type uppercase characters
set smartindent         "smart auto indenting
set smarttab            "smart tab handling for indenting
set magic               "change the way backslashes are used in search patterns
set hidden              "remember undo after quitting
set history=1000
set backup
set number relativenumber
set cursorline

syntax on
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


let maplocalleader= ' '

nmap <Leader>Z :set foldlevel=0<CR>
nmap <Leader>A :set foldlevel=1000<CR>
set foldlevel=1000

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

set swapfile
set backupdir=~/tmp

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


set termguicolors
let g:arcadia_Sunset = 1
colorscheme vice

autocmd FileType python BracelessEnable +indent

let g:vim_isort_python_version = 'python3'

" denite

set path=.
set suffixesadd=.py

" reset winheight on window resize
"augroup deniteresize
"  autocmd!
"  autocmd VimResized,VimEnter * call denite#custom#option('default',
"        \'winheight', winheight(0) / 3)
"augroup end
"
"" Custom options for Denite
""   auto_resize             - Auto resize the Denite window height automatically.
""   prompt                  - Customize denite prompt
""   direction               - Specify Denite window direction as directly below current pane
""   winminheight            - Specify min height for Denite window
""   highlight_mode_insert   - Specify h1-CursorLine in insert mode
""   prompt_highlight        - Specify color of prompt
""   highlight_matched_char  - Matched characters highlight
""   highlight_matched_range - matched range highlight
"let s:denite_options = {'default' : {
"\ 'auto_resize': 1,
"\ 'prompt': 'λ:',
"\ 'direction': 'rightbelow',
"\ 'winminheight': '10',
"\ 'highlight_mode_insert': 'Visual',
"\ 'highlight_mode_normal': 'Visual',
"\ 'prompt_highlight': 'Function',
"\ 'highlight_matched_char': 'Function',
"\ 'highlight_matched_range': 'Normal'
"\ }}
"
"call denite#custom#option('default', {
"      \ 'prompt': '❯'
"      \ })
"
"call denite#custom#var('file_rec', 'command',
"      \ ['rg', '--files', '--glob', '!.git'])
"call denite#custom#var('grep', 'command', ['rg'])
"call denite#custom#var('grep', 'default_opts',
"      \ ['--hidden', '--vimgrep', '--smart-case'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
"      \'noremap')
"call denite#custom#map('normal', '<Esc>', '<NOP>',
"      \'noremap')
"call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
"      \'noremap')
"call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
"      \'noremap')
"call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
"\'noremap')



" Add custom menus
let s:menus = {}

let s:menus.code= {
	\ 'description': 'General code actions'
	\ }
let s:menus.code.command_candidates= [
	\ ['formatting', 'Formatting'],
	\ ]


let s:menus.tags = {
	\ 'description': 'tag actions'
	\ }
let s:menus.tags.command_candidates = [
	\ ['tagbar toggle', 'TagbarToggle'],
	\ ['tags in current file', "CtrlPFunky"],
	\ ['tags in project dir', "CtrlPTag"],
	\ ]

let s:menus.search = {
	\ 'description': 'search files and words'
	\ }
let s:menus.search.command_candidates = [
	\ ['search files and buffers', 'CtrlP'],
	\ ['search word under cursor', "execute 'Rg ' . expand('<cword>')"],
	\ ['search word in project files', "Rg"],
	\ ]

let s:menus.version_control = {
	\ 'description': 'git and local history commands'
	\ }
let s:menus.version_control.command_candidates = [
	\ ['git annotate', 'Gblame'],
	\ ['git diff in vertical split', 'Gvdiff'],
	\ ['git diff in horizontal split', 'Gsdiff'],
	\ ['git next hunk', 'execute "normal \<Plug>(signify-next-hunk)"'],
	\ ['git previous hunk', 'execute "normal \<Plug>(signify-prev-hunk)"'],
	\ ['local history', 'MundoToggle'],
	\ ]

call denite#custom#var('menu', 'menus', s:menus)


set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=~/.fzf

let g:rainbow_active = 1

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig


nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

vnoremap <up>    <Plug>SchleppUp
vnoremap <down>  <Plug>SchleppDown
vnoremap <left>  <Plug>SchleppLeft
vnoremap <right> <Plug>SchleppRight


" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Formatting
function! Formatting()
    if &filetype == 'python'
        Isort
        Black
    endif
    if &filetype == 'haskell'
        call LanguageClient#textDocument_formatting()
    endif
endfunction


" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

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
"nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
"
let g:NERDTreeHighlightCursorline=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Alignment {{{

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :EasyAlign =<CR>
" Align on commas
map <Leader>a, :EasyAlign ,<CR>
" Align on pipes
map <Leader>a<bar> :EasyAlign <bar><CR>
" Prompt for align character
map <leader>ap :EasyAlign
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

nnoremap <LocalLeader><Space> :Denite menu<CR>

autocmd FileType python setlocal completeopt-=preview

nnoremap <silent><Leader>js :%!python -m json.tool<CR>

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

"autocmd BufEnter * if &modifiable && filereadable(expand('%:p'))  && bufname('')!~"\ColorV" && (bufname('')=~"\.py" || bufname('')=~"\.kv")  | NERDTreeFind | wincmd p | endif


" Editing mappings {{{

" Utility function to delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :call DeleteTrailingWS()

" Delete trailing white space on save
augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
  autocmd BufWrite *.py :call DeleteTrailingWS()
augroup END

" }}}


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

let g:NERDTreeWinSize = 30

" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '❮'
let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry


" === UI === "
function! MyHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Customize NERDTree directory
hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" Highlight git change signs
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>w <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

