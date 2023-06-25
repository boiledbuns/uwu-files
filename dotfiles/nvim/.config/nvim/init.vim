set nocompatible 
set encoding=UTF-8

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'preservim/nerdtree'
    Plug 'kien/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " lsp plugins
    " Plug 'neovim/nvim-lspconfig'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"    Plug 'prabirshrestha/vim-lsp'
"    " language servers: https://github.com/mattn/vim-lsp-settings#supported-languages
"    Plug 'mattn/vim-lsp-settings'
    " https://github.com/nvim-telescope/telescope.nvim
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " minimap 
    " Plug 'severin-lemaignan/vim-minimap'
    Plug 'wfxr/minimap.vim'
    Plug 'liuchengxu/vim-which-key'

    Plug 'airblade/vim-gitgutter'
call plug#end()

set number 
set relativenumber
set nowrap
set autoindent
set expandtab
set signcolumn=yes

" r of columns a tab is shown as
set tabstop=4 
" # of space for each indent
set shiftwidth=4
set cmdheight=1
set updatetime=50

" functionality
syntax on
set hidden

set ignorecase
set smartcase 
set nohlsearch
" set hlsearch
set incsearch

set scrolloff=999

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

if (has("termguicolors"))
    set termguicolors
endif

colorscheme dracula

let mapleader =" "
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" nnoremap <leader>tn :NERDTreeToggle<CR>

nnoremap <leader>tn :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <leader>tm :MinimapToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>fw :w<CR>
" nnoremap <leader>h :h 
nnoremap <silent> <leader>bq :bd<CR>
nnoremap <silent> <leader>bl :bd<CR>

nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ww :hide<CR>
nnoremap <leader>bw :bd<CR>

nnoremap <leader><Up> <C-w><Up>
nnoremap <leader><Down> <C-w><Down>
nnoremap <leader>h :bprevious <CR>
nnoremap <leader>l :bnext <CR>

nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-h> <C-w><Left>
nnoremap <C-l> <C-w><Right>

nnoremap <leader><leader> :
nnoremap <leader>hrr :source $MYVIMRC<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let NERDTreeShowHidden=1

command! Reload source $MYVIMRC
command! EditVimrc :e $MYVIMRC

" https://github.com/neoclide/coc.nvim
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> gh :call ShowDocumentation()<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-references)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:minimap_auto_start = 1
let g:minimap_highlight_range = 1
let g:minimap_highlight_search = 1
