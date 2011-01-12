" colorscheme baycomb
colorscheme lucius
set guifont=Inconsolata:h18,Courier:h18
set antialias

" turn off toolbar
set guioptions-=T

syn on

" For File Browser
nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <silent> <D-e> :NERDTreeToggle<CR>

" BufExplorer
nnoremap <silent> <D-b> :BufExplorer<CR>

" Gundo Undo Visualization
nnoremap <F5> :GundoToggle<CR>

" make
nnoremap <silent> <D-m> :make<CR>

" save
noremap <silent> <D-s> :w<CR>

" turn off highlighting
nnoremap <silent> <D-n> :noh<CR>

" swap current buffer with last seen buffer
nnoremap <silent> <D-l> <C-^>

" MAKE IT EASY TO UPDATE/RELOAD .gvimrc
nnoremap <leader>s :source $HOME/.vimrc<CR>:source $HOME/.gvimrc<CR>
nnoremap <leader>g :e $HOME/.gvimrc<CR>

set completeopt=longest,menuone

" do not show the tabline
set showtabline=0

" load local gvimrc for extra love
if filereadable(expand("~/.lgvimrc"))
  source ~/.lgvimrc
endif
