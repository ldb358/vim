set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" git wrapper
Plugin 'tpope/vim-fugitive'
" airline status bar
Plugin 'bling/vim-airline'
"colot theme
Plugin 'jpo/vim-railscasts-theme'
"syntastic
Plugin 'scrooloose/syntastic'
"syntax checking
Plugin 'vim-flake8'
"Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'
"Nerdtree
Plugin 'scrooloose/nerdtree'
call vundle#end() " required
filetype plugin indent on " required

set t_Co=256

colorscheme railscasts
""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""
let g:airline_theme='powerlineish'
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_right_alt_sep = '<'
let g:airline_right_sep = '<'
let g:airline_left_alt_sep= '>'
let g:airline_left_sep = '>'

""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""
" Indent Guides
""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1 "enable on startup
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
set ts=2 sw=2 et
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235


set nobackup
set nowritebackup
set noswapfile
set incsearch
set scrolloff=2
set backspace=indent,eol,start
set autoindent
set copyindent
set relativenumber
set showmatch
set smarttab
set history=1000
set undolevels=1000
set nowrap
set tabstop=4
set shiftwidth=4
set noexpandtab


au  BufNewFile,BufRead *.yml set filetype=ansible
au  BufNewFile,BufRead *.py set expandtab

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

imap <C-d> <esc>:w
imap <C-c> x
imap <C-x> x
map <S-p> <esc>:put +<CR>

function Tab_Or_Complete()
    if col('.') > 1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"
