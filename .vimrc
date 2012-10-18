set nocompatible

" Enable filetype plugin
filetype plugin on
filetype indent on
"set shellslash
"set grepprg=grep\ -nH\ $*

" set syntax
syntax on
" set <tab>
set tabstop=4
set shiftwidth=4
set expandtab

" 为了vim fcitx，设置下延迟时间为最短值
set ttm=100

" set txtbrowser
"let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
"au BufRead,BufNewFile *.txt setlocal ft=txt

" set csupport
let g:C_AuthorName="zhanglei"
let g:C_Email="zhangleibruce@gmail.com"
let g:C_Company="zlb.me"

" set taglist
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

set t_Co=256
"set background=dark
colorscheme desert256
"设置背景为透明
hi Normal ctermbg=None
hi NonText ctermbg=None

" set hjkl in insert mode
"imap <A-h> <Left>
"imap <A-j> <Down>
"imap <A-k> <Up>
"imap <A-l> <Right>
"imap <A-f> <PageDown>
"
" set for code_complete
let g:completekey="<C-j>"
autocmd BufReadPost,BufNewFile *.c,*.cc,*.cpp,*.h,*.cxx call CodeCompleteStart()

let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_FormatDependency_pdf='pdf'
let g:Tex_CompileRule_pdf='xelatex --src-specials -interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi='echo nothing'
" this is the list of patterns which will be ignored from the compiler output.
" This is a handy way of specifying which warnings/errors to ignore. This is a
" list of patterns seperated by '?'
let g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'There were undefined references'."\n".
	\'Citation %.%# undefined'."\n".
    \'Font Warning' 


" the 'ignore level' of the 'efm'. A value of 4 says that the first 4 kinds of
" warnings in the list above will be ignored. Use the command TCLevel to set a
" level dynamically.
let g:Tex_IgnoreLevel = 8

" set proto file
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au! BufNewFile,BufRead *.hsc setfiletype haskell
  au! BufNewFile,BufRead *.as setfiletype haskell
  au! BufNewFile,BufRead *.pappy setfiletype haskell
  au! BufNewFile,BufRead *.las setfiletype haskell
augroup end

" display the current mode and partially-typed commands in the status line
set showmode
set showcmd
set cino=g0
" undo
set undodir=/tmp/
set undofile
" minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" vim-powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

"CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" vimwiki
let g:vimwiki_camel_case = 0
let g:vimwiki_hl_cb_checked = 1

call pathogen#infect() 
call pathogen#helptags()

