set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'c.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
"Plugin 'craigemery/vim-autotag'
Plugin 'preservim/nerdcommenter' 
Plugin 'mg979/vim-visual-multi'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'pboettch/vim-highlight-cursor-words'
Plugin 'junegunn/vim-easy-align'
Plugin 'frazrepo/vim-rainbow'
Plugin 'mhinz/vim-startify'
Plugin 'skyl/vim-config-python-ide'
Plugin 'mileszs/ack.vim'

"" Themes ""
Plugin 'sickill/vim-monokai'
Plugin 'jacoborus/tender.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'dracula/dracula-theme'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'mhinz/vim-janah'
Plugin 'sjl/badwolf'
Plugin 'lifepillar/vim-solarized8'
Plugin 'arcticicestudio/nord-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if &term == "screen"
	set t_Co=256
endif

nmap <F8> :TagbarToggle<CR>

set number
set cursorline
set cursorcolumn
set hls

"set tags=tags;/
set tags=./tags;,tags;
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

set foldmethod=syntax
set foldlevel=0
" set foldclose=all

set tabstop=4 shiftwidth=4 expandtab
" set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd l
" map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


set colorcolumn=80
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


let g:airline_section_b = ''
let g:airline_section_y = ''

" tabs to buffers: https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

" Change some of the default VIM Diff color scheme
hi DiffAdd    ctermbg=black ctermfg=green   cterm=reverse
hi DiffChange ctermbg=black ctermfg=magenta cterm=reverse
hi DiffDelete ctermbg=black ctermfg=darkred cterm=reverse
hi DiffText   ctermbg=black ctermfg=cyan    cterm=reverse

" Turn on highlight search and set some highlight cursor word plugin options:
"   word underneach cursor highlight to be of Search type
"   delay to be 30 ms
"set hls
let g:HiCursorWords_linkStyle='Todo'
let g:HiCursorWords_delay = 30

" Click on a buffer to switch to it. Yes, with the mouse.
" A bunch of other mouse behavior works too - you can click to move the insertion point, 
" drag to select text or resize splits, and use the scroll wheel.
set mouse+=a
set ttymouse=xterm2

" In visual mode, show highlighted character count
set showcmd

set pastetoggle=<F3>

" HELP - 1) vipga= 2) gaip=
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>



