"This must be first, because it changes other options as a side effect
set nocompatible

"For Pathogen -- Plug-ins mgmt tool with update_bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic Configuration after initial VIM installation

colorscheme blackboard

"store lots of :cmdline history
set history=1000000

"to prevents vi from making its annoying beeps when a command doesn't work
"Instead, it briefly flashes the screen
set vb t_vb=
set autochdir    "auto set working directory to current

"set list for showing whitespaces and set nolist to hide the whitespace indicator 

set showcmd      "show incomplete cmds down at the bottom of VIM
set showmode     "show current mode down at the bottom of VIM
set incsearch    "find the next match as we type the search
set hlsearch     "highlight searches by default
set hidden       "hide buffers when not displayed
set nowrap       "tell vim not wrap lines
set linebreak    "wrap lines at convenient points
set number       "show line number
set ruler        "show the cursor position all the time
set cursorline
set nojoinspaces
set noautoindent
set smartindent

"inserts spaces instead of actual tabs
"set expandtab

"set tab, softtab
set ts=2 sts=2 sw=2 expandtab
"nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"wildmenu to get an over view of the files in current directory when I go :e
"and then TAB
set wildmode=list:longest

"set grep to use ack instead of grep so that I can use copen and cc for quickfix list
set grepprg=ack

"to hide some auto-generated files such as .class .pyc files in java and
"python
"set wildignore=*.pyc, *pyo, *.class

syntax on         "turn on syntax highlighting

"Select the exuberant ctags (had to be downloaded and installed!)
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"configure Tag List
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40

"********Key Mappings********
"Adding TextMate’s key mappings for shifting text left and right (< and >)
"Auto Indent short cut key is = after vjjjj selecting the code block
"Auto Format short cut key is =G where G is from the end and gg is from the top 

"nmap (normal mode mapping) and vmap (visual mode mapping)
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has('gui_running')
  syntax on
  set hlsearch

  "for Mac
  set guifont=Monaco:h11
endif

"Only do this part when vim/mvim is compiled with support for autocommands
if has("autocmd")
  filetype plugin indent on

  "Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

  "Customizations based on house-style (arbitrary)
  autocmd FileType html,css,scss,ruby,pml,yaml,coffee,vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  "Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
  
  "Automatically to strip trailing whitespaces when a file is saved
  autocmd BufWritePre *.py,*.rb,*.yaml,*.feature,*.js :call <SID>StripTrailingWhitespaces()
  
  "Automatically source my vimrc when using :w
  autocmd BufWritePost .vimrc source $MYVIMRC

  autocmd! BufEnter * :lcd %:p:h
endif " has("autocmd")

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

command! Status echo "The initial installation for your VIM is success!"
