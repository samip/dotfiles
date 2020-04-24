set nocompatible 
filetype on
syntax on
set softtabstop=4 expandtab
set hlsearch
set incsearch
set showcmd
" open new splits in right and below
set splitbelow
set splitright
" rebind split navigation to ctrl+j/k/l/h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" added nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'vim-syntastic/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'frazrepo/vim-rainbow'
Plugin 'ngmy/vim-rubocop'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
" close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :NERDTreeMirror<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
colorscheme gruvbox
set bg=dark
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
let &t_ut=''
