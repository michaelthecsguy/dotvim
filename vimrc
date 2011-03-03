"This must be first, because it changes other options as a side effect
set nocompatible

"For Pathogen -- Plug-ins mgmt tool with update_bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic Configuration after initial VIM installation

colorscheme blackboard

"store lots of :cmdline history
set history=1000

"set list for showing whitespaces and set nolist to hide the whitespace indicator 
set showcmd      "show incomplete cmds down at the bottom of VIM
set showmode     "show current mode down at the bottom of VIM

set incsearch    "find the next match as we type the search
set hlsearch     "highlight searches by default

set hidden       "hide buffers when not displayed

set nowrap       "tell vim not wrap lines
set linebreak    "wrap lines at convenient points
set number       "show line number
set noautoindent
set smartindent

"inserts spaces instead of actual tabs
"set expandtab

set autochdir    "auto set working directory to current

"wildmenu to get an over view of the files in current directory when I go :e
"and then TAB
set wildmode=list:longest

"set grep to use ack instead of grep so that I can use copen for quickfix list
set grepprg=ack

"to hide some auto-generated files such as .class .pyc files in java and
"python
"set wildignore=*.pyc, *pyo, *.class

"to prevents vi from making its annoying beeps when a command doesn't work
"Instead, it briefly flashes the screen
set vb t_vb=

"set tab, softtab
set ts=2 sts=2 sw=2 expandtab
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

syntax on         "turn on syntax highlighting

if has("autocmd")
  filetype plugin indent on
  autocmd! BufEnter * :lcd %:p:h
endif " has("autocmd")

if has('gui_running')
  set guifont=Monaco_Console:h11
endif

command! Status echo "The initial installation for your VIM is success!"
