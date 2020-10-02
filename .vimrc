" Install vim-plug first:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

" == GUI Setting {{{
if has('gui_running')
    set guifont=JetBrains\ Mono\ 10
    set guioptions=aeMrL
    set lines=59 columns=237
endif
" }}}

" == Plugin Install {{{
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'yggdroot/leaderf'
Plug 'lifepillar/vim-solarized8'
Plug 'easymotion/vim-easymotion'

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
set background=light
colorscheme solarized8
" }}}

" == Setting lightline {{{
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'component': {
    \   'lineinfo': ' %3l:%-2c',
    \ },
    \ 'colorscheme': 'solarized',
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

" == Setting leaderf {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
" }}}

" vim: fdm=marker:et:ts=4:sw=4:sts=4
