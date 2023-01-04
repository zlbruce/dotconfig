" Install vim-plug first:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

" == Win32 Setting {{{
if has('win32')
    let $LANG="zh_CN.UTF-8"
    set langmenu=zh_cn.utf-8
    set encoding=utf8
    autocmd GUIEnter * simalt ~x
endif
" }}}

" == GUI Setting {{{
if has('gui_running') || exists("g:GuiLoaded")
    set guifont=JetBrains\ Mono:h11
    "set guioptions=aeMrL
    set guioptions=aMrL
    set lines=59 columns=237
endif
" }}}

" == Plugin Install {{{
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'yggdroot/leaderf'
"Plug 'voldikss/LeaderF-everything'
"Plug 'lifepillar/vim-solarized8'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'azabiong/vim-highlighter'

call plug#end()
" }}}

" == Setting table {{{
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
" }}}

" == Setting theme{{{
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set background=dark
colorscheme onedark
" }}}

" == Setting lightline {{{
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'component': {
    \   'lineinfo': ' %3l:%-2c',
    \ },
    \ 'colorscheme': 'onedark',
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction
" }}}

" == Setting nerdtree {{{
nnoremap <F9> :NERDTreeFind<CR>
" }}}

" == Setting leaderf {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupColorscheme = 'onedark'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
"let g:Lf_EverythingEsPath = 'D:\ES\es.exe'

noremap <F7> :<C-U><C-R>=printf("Leaderf gtags")<CR><CR>
noremap <F8> :<C-U><C-R>=printf("Leaderf bufTag")<CR><CR>
noremap F :<C-U><C-R>=printf("Leaderf! rg --match-path -e %s ", expand("<cword>"))<CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf! gtags -s %s", expand("<cword>"))<CR><CR>
noremap <space><space> :<C-U><C-R>=printf("Leaderf --recall")<CR><CR>
" }}}

" vim: fdm=marker:et:ts=4:sw=4:sts=4

