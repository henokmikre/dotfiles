"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See http://stackoverflow.com/a/23496813/871793.
" To install plugins, first get Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Then run: vim +PluginInstall +qall
if !empty(glob("~/.vim/bundle/Vundle.vim"))
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim

  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  """"" Put your plugins here.
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'PProvost/vim-ps1'
  Plugin 'toyamarinyon/vim-swift'
  Plugin 'groenewege/vim-less'
  Plugin 'gregsexton/MatchTag'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'nelsyeung/twig.vim'
  Plugin 'hdima/python-syntax'
  Plugin 'evidens/vim-twig'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-abolish'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'embear/vim-localvimrc'
  Plugin 'martinda/Jenkinsfile-vim-syntax'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

  " disable the folding
  let g:vim_markdown_folding_disabled=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

set backspace=eol,indent,start
set autoindent
set history=900

" Stop Vim from beeping all the time.
set vb

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set ruler
set background=dark

" Tell you if you are in insert mode.
set showmode

" Match parenthesis, i.e. ) with (  and } with {.
set showmatch

" Ignore case when doing searches.
set ignorecase

" Tell you how many lines have been changed.
set report=0

" Uncomment to insert spaces instead of a tab when tab is pressed.
set expandtab

" Turn off visual bell
" SO 5933568
set t_vb=

" Splits
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste
" :help paste recommends F10 and F11, but this is hard on Mac keyboard.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :set paste<CR>
map <F6> :set nopaste<CR>
imap <F5> <C-O>:set paste<CR>
imap <F6> <nop>
set pastetoggle=<F6>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Drupal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Drupal command group, set the correct filetypes for Drupal files.
augroup drupal
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.info set filetype=php
  autocmd BufRead,BufNewFile *.engine set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
" @see https://wiki.python.org/moin/Vim.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  augroup python
    autocmd FileType python call SetPythonOptions()
  augroup END
endif

" @see https://stackoverflow.com/a/1413352/871793.
function SetPythonOptions()
  setlocal ts=2
  setlocal sw=2
  setlocal sts=2
endfunction

" Text files
augroup txt
  autocmd BufRead,BufNewFile *.txt set filetype=conf
augroup END

" Markdown (override modula2)
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove unwanted spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing whitespace on write.
" NOTE: this will be not be cool when you WANT trailing whitepace.
"autocmd BufWritePre * :%s/\s\+$//e
:nmap ,, :%s/\s\+$//e<CR>
