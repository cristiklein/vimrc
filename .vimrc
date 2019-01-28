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
let g:syntastic_python_pylint_exec = '/usr/bin/pylint3'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

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

function SetOmniCompletion()
  set omnifunc=syntaxcomplete#Complete

  " Configure menu behavior
  " http://vim.wikia.com/wiki/VimTip1386
  set completeopt=longest,menuone
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
    \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  " Use Ctrl+Space for omni-completion
  " http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
  inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
  imap <C-@> <C-Space>

  " Popup menu hightLight Group
  highlight Pmenu ctermbg=13 guibg=LightGray
  highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
  highlight PmenuSbar ctermbg=7 guibg=DarkGray
  highlight PmenuThumb guibg=Black

  " Enable global scope search
  let OmniCpp_GlobalScopeSearch = 1
  " Show function parameters
  let OmniCpp_ShowPrototypeInAbbr = 1
  " Show access information in pop-up menu
  let OmniCpp_ShowAccess = 1
  " Auto complete after '.'
  let OmniCpp_MayCompleteDot = 1
  " Auto complete after '->'
  let OmniCpp_MayCompleteArrow = 1
  " Auto complete after '::'
  let OmniCpp_MayCompleteScope = 0
  " Don't select first item in pop-up menu
  let OmniCpp_SelectFirstItem = 0
endfunction

function SetKernelDevelopment()
  let g:syntastic_c_compiler_options='-nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/5/include -I./arch/x86/include -I./arch/x86/include/generated/uapi -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -DCC_HAVE_ASM_GOTO'
  setlocal noexpandtab tabstop=8 shiftwidth=8
  setlocal colorcolumn=81
  highlight ColorColumn ctermbg=Black ctermfg=DarkRed
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endfunction

function SetDefaultDevelopment()
  setlocal expandtab shiftwidth=4
  setlocal colorcolumn=80
  highlight ColorColumn ctermbg=Black ctermfg=DarkRed
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /^\t*\zs \+/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endfunction

function Set2SpaceDevelopment()
  setlocal expandtab shiftwidth=2
endfunction

function SetMakefileDevelopment()
  setlocal noexpandtab shiftwidth=8
  setlocal colorcolumn=80
  highlight ColorColumn ctermbg=Black ctermfg=DarkRed
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /^[ ]*\zs \+/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endfunction

if has("autocmd")
  " Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  au BufNewFile,BufRead * call SetDefaultDevelopment()
  au BufNewFile,BufRead *.js,*.tf,*.yaml,*.yml call Set2SpaceDevelopment()
  au BufNewFile,BufRead */linux/*.c call SetKernelDevelopment()
  au BufNewFile,BufRead Makefile call SetMakefileDevelopment()
endif

call SetOmniCompletion()
