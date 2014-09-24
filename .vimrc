" 	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" and run
" 	:PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
"Plugin 'vim-pandoc/vim-pandoc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
