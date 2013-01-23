set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

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

" set tags
set tags+=../tags                                                                                                   
set tags+=../../tags                                                                                                
set tags+=../../../tags                                                                                             
set tags+=../../../../tags                                                                                          

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
if v:version >= 703
    set undodir=/tmp/
    set undofile
endif
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

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.path_html = '~/vimwiki_html/'
"let wiki_1.template_default = 'def_template'
let wiki_1.template_default = 'default'
let wiki_1.template_path = '~/vimwiki/template/'
let wiki_1.template_ext = '.html'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'bash': 'sh', 'html': 'html'}
let wiki_1.css_name = 'css/style.css'

let g:vimwiki_list = [wiki_1]

let g:vimwiki_debug = 1
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,a'
let g:vimwiki_folding = 1
let g:vimwiki_hl_headers = 1
nmap <leader>tt <Plug>VimwikiToggleListItem

"tagbar
nmap <F8> :TagbarToggle<CR>


