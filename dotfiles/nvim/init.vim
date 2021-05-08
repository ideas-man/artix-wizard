syntax on
syntax enable

set expandtab             " Use spaces instead of tabs.
set tabstop     =4        " Tab key indents by 4 spaces.
set softtabstop =4        " Tab key indents by 4 spaces.
set shiftwidth  =4        " >> indents by 4 spaces.
set shiftround            " >> indents to next multiple of 'shiftwidth'.

set hidden                " Switch between buffers without having to save first.
set splitbelow            " Open new windows below the current window.
set splitright            " Open new windows right of the current window.

set number
set relativenumber
set cursorline            " Find the current line quickly.
set scroll      =10

set report      =0        " Always report changed lines.
set wrapscan              " Searches wrap around end-of-file.
set noshowmode

set inccommand  =nosplit

set synmaxcol   =400      " Only highlight the first 400 columns.

set mouse       =a

set termguicolors

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set clipboard+=unnamedplus

set keymap=russian-jcukenwin
set iminsert=0
set spelllang=en_us,ru_yo

set timeoutlen=3000

set backup
set backupdir   -=.
set backupext    =-vimbackup
set updatecount =100
set undofile

call plug#begin($XDG_CACHE_HOME . '/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-capslock'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'raymond-w-ko/vim-niji'
Plug 'Yggdroot/indentLine'

" Handy unix command inside Vim (Rename, Move etc.)
Plug 'tpope/vim-eunuch'

" Git command inside vim
Plug 'tpope/vim-fugitive'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python autocomplete (source for deoplete)
" pip install pynvim
" pip install jedi
Plug 'zchee/deoplete-jedi'

" Python completion, goto definition etc.
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Python indent (follows the PEP8 style)
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" Code auto-format
" pip install yapf
"Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
" pip install autopep8
Plug 'Chiel92/vim-autoformat'

" Linting
" pip install flake8
Plug 'dense-analysis/ale'

" Yank highlight
Plug 'machakann/vim-highlightedyank'

call plug#end()

filetype plugin indent on

syntax on
syntax enable

" ###################### airline ######################
let g:airline_theme='serene'

" misc
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1

" ###################### indentLine ######################

let g:indentLine_char = '·'
let g:indentLine_color_gui = '#888888'

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" ###################### vim-lightline ######################

"function! LanguageStatus(...) abort
"    return &iminsert == 1 ? (a:0 == 1 ? a:1 : 'RU') : ''
"endfunction

"function! CapsLockStatus(...) abort
"    return CapsLockStatusline('CAPS')
"endfunction

"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'lang', 'caps', 'paste' ],
"      \             [ 'gitbranch', 'filename', 'readonly', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'lang': 'LanguageStatus',
"      \   'caps': 'CapsLockStatus',
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }

" ###################### deoplete ######################
let g:deoplete#enable_at_startup = 1
" Candidate list item number limit
call deoplete#custom#option('max_list', 30)

" The number of processes used for the deoplete parallel feature.
call deoplete#custom#option('num_processes', 16)

" The delay for completion after input, measured in milliseconds.
call deoplete#custom#option('auto_complete_delay', 1000)

" Enable deoplete auto-completion
call deoplete#custom#option('auto_complete', v:true)

" ###################### deoplete-jedi settings ###################### 
" Whether to show doc string
let g:deoplete#sources#jedi#show_docstring = 0

" For large package, set autocomplete wait time longer
let g:deoplete#sources#jedi#server_timeout = 500

" Ignore jedi errors during completion
let g:deoplete#sources#jedi#ignore_errors = 1

" ###################### yankhighlight ######################
"reverse highlight
hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight for 1 second
let g:highlightedyank_highlight_duration = 1000

" ###################### jedi-vim settings ###################### 
" Disable autocompletion, because I use deoplete for auto-completion
let g:jedi#completions_enabled = 0

" Whether to show function call signature
let g:jedi#show_call_signatures = '0'

" ###################### ale settings ######################
" linters for different filetypes
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'vim': ['vint'],
  \ 'cpp': ['clang'],
  \ 'c': ['clang']
\}

let g:ale_enabled = 1

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ###################### neoformat settings ######################
"let g:neoformat_enabled_python = ['black', 'yapf']
"let g:neoformat_cpp_clangformat = {
"  \ 'exe': 'clang-format',
"  \ 'args': ['--style="{IndentWidth: 4}"']
"\}
"let g:neoformat_c_clangformat = {
"  \ 'exe': 'clang-format',
"  \ 'args': ['--style="{IndentWidth: 4}"']
"\}

"let g:neoformat_enabled_cpp = ['clangformat']
"let g:neoformat_enabled_c = ['clangformat']
