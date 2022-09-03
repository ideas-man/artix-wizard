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

" fuzzy search
Plug 'junegunn/fzf.vim'

" start page
Plug 'mhinz/vim-startify'

" syntax highlight
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter'

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

" ###################### yankhighlight ######################
"reverse highlight
hi HighlightedyankRegion cterm=reverse gui=reverse

" set highlight for 1 second
let g:highlightedyank_highlight_duration = 1000

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

