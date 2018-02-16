
" http://chrisstrelioff.ws/sandbox/2016/09/21/vim_and_vundle_on_ubuntu_16_04.html
" ~/.vimrc
"

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

set tabstop=3
