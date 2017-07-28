" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" Vundle stuff
set nocompatible
filetype off
call vundle#rc()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin '2072/PHP-Indenting-for-VIm'
call vundle#end()
filetype plugin indent on     " required! 


set encoding=utf-8

"
let python_highlight_all=1

syntax on

set tabstop=4
set autoindent
set shiftwidth=4

" Empty space at the bottom of gVim windows
" When using a window manager configured to ignore window size hints, gVim will fill the non-functional area with the GTK theme background color. 
" The solution is to adjust how much space gVim reserves at the bottom of the window. 
set guiheadroom=0

" Traverse line breaks with arrow keys
" By default, pressing ← at the beginning of a line, or pressing → at the end of a line, will not let the cursor traverse to the previous, or following, line. 
"set whichwrap=b,s,<,>,[,]

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Python Autoindent
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ map <F5> :w<CR>:!python %<CR>

" html, javascript, css
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2





