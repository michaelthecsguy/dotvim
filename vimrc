"This must be first, because it changes other options as a side effect
set nocompatible

"For Pathogen -- Plug-ins mgmt tool with update_bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic Configuration after initial VIM installation

colorscheme blackboard

"store lots of :cmdline history
set history=10000

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

"set grep to use ack instead of grep so that I can use copen and cc for quickfix list
set grepprg=ack

"to hide some auto-generated files such as .class .pyc files in java and
"python
"set wildignore=*.pyc, *pyo, *.class

"to prevents vi from making its annoying beeps when a command doesn't work
"Instead, it briefly flashes the screen
set vb t_vb=

"set tab, softtab
set ts=2 sts=2 sw=2 expandtab
"nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

syntax on         "turn on syntax highlighting

"Select the exuberant ctags (had to be downloaded and installed!)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"configure Tag List
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40

"Only do this part when compiled with support for autocommands
if has("autocmd")
  filetype plugin indent on

  "Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  "Customizations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  "Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

  "Automatically source my vimrc without typing it in mvim's terminal like
  ":write
  autocmd bufwritepost .vimrc source $MYVIMRC

  autocmd! BufEnter * :lcd %:p:h
endif " has("autocmd")

if has('gui_running')
  set guifont=Monaco_Console:h11
endif

command! Status echo "The initial installation for your VIM is success!"
