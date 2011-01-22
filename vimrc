filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic Configuration after initial VIM installation
" set list for showing whitespaces and set nolist to hide the whitespace indicator 
set hidden

"show line number
set number
set noautoindent
set smartindent

"inserts spaces instead of actual tabs
"set expandtab

"auto set working directory to current
set autochdir

"wildmenu to get an over view of the files in current directory when I go :e
"and then TAB
set wildmode=list:longest

"to hide some auto-generated files such as .class .pyc files in java and
"python
"set wildignore=*.pyc, *pyo, *.class

set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
syntax on
command! Status echo "The initial installation for your VIM is success!"

if has("autocmd")
  filetype plugin indent on
  autocmd! BufEnter * :lcd %:p:h
endif " has("autocmd")
