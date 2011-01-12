" set up pathogen for script bundling goodness
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"load ftplugins and indent files
filetype plugin indent on

set nobackup
set noswapfile

set ts=2
set sw=2

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Y yanks to end of line, not just yy
map Y y$

" longer history
set history=1000

" make tab completion in command mode work like shell
set wildmenu
set wildmode=list:longest

" sets the title when run in terminal
" set title

" keeps three lines before/after cursor when scrolling
set scrolloff=3

" shorten messages
set shortmess=atIO

" no tabs in my files boy-o
set expandtab

" search for tags file in parent directories
set tags=tags;/

" sets the shell
"set sh=/bin/bash

" turn on syntax highlighting
syn on

" set default foldmethod
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" For File Browser
nnoremap <silent> <leader>b :Exp<CR>

" BufExplorer
nnoremap <silent> B :BufExplorer<CR>

" automatically reload on external file change
set autoread

" allow unsaved hidden buffers
set hidden

" MAKE IT EASY TO UPDATE/RELOAD .vimrc
nnoremap <leader>s :source $HOME/.vimrc<CR>
nnoremap <leader>v :e $HOME/.vimrc<CR>

" quickfix commands
nnoremap <silent> <leader>m :make! "%"<CR>
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>h :cp<CR>
nnoremap <silent> <leader>l :cl<CR>
nnoremap <silent> <leader>o :cope<CR>
nnoremap <silent> <leader>p :cclose<CR>

" sets the pipe command for make, only show last line
"set shellpipe=2>&1\|\ tee\ %s\ \|\ tail\ -1

" save
noremap <silent> <C-s> :w<CR>

" turn off highlighting
nnoremap <silent> <C-n> :noh<CR>

" move up and down
nnoremap <silent> <C-down> <C-F>
nnoremap <silent> <C-up> <C-B>

" map arrow keys for more natural movement
noremap <silent> <down> gj
noremap <silent> <up> gk

" open Explorer
nnoremap <silent> <C-e> :Exp<CR>

" switch to alternate file
nnoremap <silent> <C-a> :A<CR>

" show matching brackets
set showmatch
set matchtime=2

" bufexplorer - show relative paths
let g:bufExplorerShowRelativePath = 1

" rails.vim
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
"" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
"" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')

" don't show current mode on last line
set nosmd

" console color scheme
colorscheme desert256

" NERD Tree stuff
" change directory to wherever the root is
let NERDTreeChDirMode=2

" make autotag less chatty
let g:autotagVerbosityLevel=-1

" find the current file in the NERD Tree
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Make CommandT only take up 20 lines
let g:CommandTMaxHeight = 20

" fugitive key bindings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gn :Gblame<CR>
nnoremap <silent> <leader>gq :Gread<CR>
nnoremap <silent> <leader>ga :Git add %<CR>
nnoremap <silent> <leader>gr :Git reset HEAD %<CR>

" better tcomment map
noremap <silent> <leader>x :TComment<CR>

" generate ctags for the project
nnoremap <silent> <leader>ct :call GenerateProjectCTags("Ruby & Javascript", "--languages=Ruby,js --exclude public/webyp")<CR>
let g:projectCTagsAutogenerateTags = 1

" Use neocomplcache. 
" let g:neocomplcache_enable_at_startup = 1
" disable auto complete
" let g:neocomplcache_disable_auto_complete = 1
" tab completion
inoremap <Tab> <C-n>


" ==========================
" === AUTOCOMMAND GROUPS ===
" ==========================

" ruby types
augroup RUBY
  au!
  au BufNewFile,BufRead *.rbw,*.gem,*.gemspec,*.rjs setf ruby
  au BufNewFile,BufRead *.{rd,rdoc} setf rdoc
augroup END

" Objective-C
augroup OBJC
  au!
  au BufRead,BufNewFile *.m set filetype=objc
  au BufRead,BufNewFile *.m set indentexpr=
  au BufRead,BufNewFile *.h set filetype=objc
  au FileType objc set makeprg=/usr/bin/xcodebuild\ -buildstyle\ Development
augroup END

" Text and Text-like files
augroup TEXT
  au!
  au BufNewFile,BufRead *.txt set filetype=text
  " linebreak
  au BufNewFile,BufRead *.txt,*.tex,README setlocal lbr
  " don't want the status bar on text files by default
  au BufEnter *.txt,*.tex,README setlocal laststatus=1
  au BufLeave *.txt,*.tex,README setlocal laststatus=2
augroup END

" actionscript autocommands
augroup ACTIONSCRIPT
  au!
  au BufNewFile,BufRead *.as set filetype=actionscript
augroup END

" rubycomplete.vim
augroup RUBYCOMPLETE
  au!
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  "au FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  " au FileType ruby,eruby let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  " au FileType ruby,eruby let g:SuperTabContextDefaultCompletionType = "<c-x><c-]>"
augroup END

" rspec types
" Override to the Rails plugin behavior
augroup RSPEC
  au!
  au BufNewFile,BufRead *_spec\.rb comp rspec
  au BufNewFile,BufRead *_spec\.rb set filetype=rspec
augroup END

" jspec
augroup JSPEC
  au!
  " only matching 'it' and 'end' for now
  au BufNewFile,BufRead *_spec\.js let b:match_words = '\<it\>:\<end\>'
augroup END

" load local vimrc for extra goodness

if filereadable(expand("~/.lvimrc"))
  source ~/.lvimrc
endif
