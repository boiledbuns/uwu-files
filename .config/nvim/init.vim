set nocompatible 
set encoding=UTF-8

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'preservim/nerdtree'
    Plug 'kien/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
call plug#end()

set number 
set nowrap

syntax on
set hlsearch
set incsearch
set ignorecase
set smartcase 

set autoindent
set expandtab
" # of columns a tab is shown as
set tabstop=4 
" # of space for each indent
set shiftwidth=4

if (has("termguicolors"))
    set termguicolors
endif

colorscheme dracula

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader><Up> <C-w><Up>
nnoremap <leader><Down> <C-w><Down>
nnoremap <leader><Left> :tabprevious <CR>
nnoremap <leader><Right> :tabnext <CR>

nnoremap <C-Up> <C-w><Up>
nnoremap <C-Down> <C-w><Down>
nnoremap <C-Left> <C-w><Left>
noremap <C-Right> <C-w><Right>

nnoremap <leader><leader> :

let NERDTreeShowHidden=1


