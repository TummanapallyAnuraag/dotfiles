set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'c.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'yegappan/taglist'
Plugin 'vim-airline/vim-airline'
"Plugin 'craigemery/vim-autotag'
Plugin 'preservim/nerdcommenter' 

"" Themes ""
Plugin 'sickill/vim-monokai'
Plugin 'jacoborus/tender.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if &term == "screen"
	set t_Co=256
endif
let Tlist_auto_open=1
let tlist_c_settings = 'c;f:function;s:struct'
let Tlist_Use_Right_Window   = 1
nnoremap <silent> <F8> :TlistToggle<CR>


set number
set cursorline
set cursorcolumn

"set tags=tags;/
set tags=./tags;,tags;
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

set foldmethod=syntax
set foldlevel=0
" set foldclose=all

set tabstop=4
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd l
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


set colorcolumn=87
highlight ColorColumn ctermbg=249

"let g:molokai_original = 1
"let g:rehash256 = 1
colorscheme monokai

filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

:map <C-z> <plug>NERDCommenterToggle


set pastetoggle=<F3>
