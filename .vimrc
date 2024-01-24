" Load good vim defaults
source $VIMRUNTIME/vimrc_example.vim

" Most stuff is configured using packs

" Allow copy-pasting between other applications
" https://stackoverflow.com/a/30691754/1202136
set clipboard^=unnamed,unnamedplus

" https://vi.stackexchange.com/a/5844
set autoindent

" Easily work with long lines
set wrap lbr " Wrap long lines between words
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

" Never used these, never needed these
set nobackup nowritebackup noundofile
