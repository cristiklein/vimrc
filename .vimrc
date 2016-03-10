call pathogen#infect()
"set background=dark
syntax on

set nocompatible
filetype indent plugin on
set expandtab
set smarttab
set autoindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=1

"To enable Just puppet-lint and disable the parser uncomment next line
"let g:syntastic_puppet_checkers=['puppetlint']
"
let g:vim_markdown_folding_disabled=1

"Auto-detect indenting
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=4
autocmd BufReadPost * :DetectIndent

"Highlight all search pattern matches
set hlsearch

"Easily work with long lines
set wrap lbr " Wrap long lines between words
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

" Show last line, even if partial
set display=lastline

" Use X clipboard for better integration
set clipboard=unnamedplus

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
