set sidescroll=4
set sidescrolloff=1
"set background=dark     "enable for dark terminals
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


colorscheme allomancer


let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

autocmd FileType python BracelessEnable +indent

let g:vim_isort_python_version = 'python3'


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'haskell': ['hie'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\   'haskell': ['brittany'],
\}

let g:ale_python_pylint_change_directory=1
let g:ale_python_pylint_executable = 'pylint'
let g:ale_python_pylint_options="--rcfile ~/.pylintrc"
let g:ale_python_pylint_use_global = 0

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_sign_column_always = 1

let g:airline#extensions#ale#enabled = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
        \   '%d⚠ %d⨉',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline=%{LinterStatus()}

" denite

set path=.
set suffixesadd=.py

" reset winheight on window resize
augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \'winheight', winheight(0) / 3)
augroup end

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
\'noremap')



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
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>

let g:NERDTreeHighlightCursorline=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeWinSize = 30

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

let g:syntastic_python_python_exec = 'python3'

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

