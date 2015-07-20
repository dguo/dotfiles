"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Danny Guo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" space is easier to reach than backslash
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle set-up
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " Vi IMproved
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle; required
Plugin 'gmarik/Vundle.vim'
" Actual plugins
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'thinca/vim-quickrun'
Plugin 'wting/rust.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline (status line)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic (syntax/style checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slows down vim start-up
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
" PEP 8
let g:syntastic_python_checkers=['pylint']
" jslint is too aggressive
let g:syntastic_javascript_checkers=['jshint']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree (file system explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close vim if NERDTree is the only window still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
                                     \ && b:NERDTreeType == "primary") | q
" shortcut to open/close NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter (comment/uncomment code)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't add another comment to an already commented line
let NERDDefaultNesting=0
" // var x = y; rather than //var x = 3;
let NERDSpaceDelims=1
let NERDCommentWholeLinesInVMode=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe (code completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Audio
set noerrorbells      " don't beep
" Indenting
filetype plugin indent on   " indenting intelligence based on file type
set autoindent              " copy indent to new line
" Editing
set backspace=indent,eol,start " can erase past chars, autoindent, and newlines
" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Extra information
set laststatus=2      " for airline plugin
set number            " show line numbers
set ruler             " show row and column at bottom right
set showcmd           " show info about the current command
set noshowmode        " don't show --INSERT-- at bottom; unneeded with airline
set title             " file name in title bar
set visualbell        " flash command on error
" File handling
set confirm           " raise dialogue for unsaved changes when quitting
set hidden            " hide buffers with unsaved changes
" Rendering
set ttyfast           " more chars sent to screen for redrawing
" Search
set hlsearch          " highlight search matches
set ignorecase        " case insensitive
set incsearch         " incremental search highlighting
set smartcase         " only case insensitive when the search is all lowercase
" Scrolling
set scrolloff=5       " number of context lines above/below the cursor
" Spacing
set expandtab         " tabs are expanded into spaces
set tabstop=4         " number of spaces for tab
set shiftwidth=4      " number of spaces for indentation
set softtabstop=4     " number of spaces for tab in insert mode
" Visuals
set background=dark
colorscheme solarized " precision colors for machines and people
set colorcolumn=80    " vertical stripe for line limit
set showmatch         " highlight matching parenthesis, bracket, or brace
syntax on
set encoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enter to clear search highlight
nnoremap <CR> :noh<CR>
" move vertically by physical lines rather than logical lines
map j gj
map k gk
" move faster with ctrl
map <C-j> 5j
map <C-k> 5k
map <C-h> 3h
map <C-l> 3l
" use S (normally equivalent to cc) to save
nnoremap S :w<CR>
" use Q (normally goes into ex mode) to quit
nnoremap Q :q<CR>
" don't need to use shift to enter command
noremap : ;
noremap ; :
" gm moves to middle of current physical line
" http://www.vim.wikia.com/wiki/A_better_gm_command
function! s:Gm()
    execute 'normal! ^'
    let first_col = virtcol('.')
    execute 'normal! g_'
    let last_col  = virtcol('.')
    execute 'normal! ' . (first_col + last_col) / 2 . '|'
endfunction
nnoremap <silent> gm :call <SID>Gm()<CR>
onoremap <silent> gm :call <SID>Gm()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

