"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Danny Guo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vi IMproved
set nocompatible

" space is easier to reach than backslash
let mapleader=" "

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug set-up
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" A foolish consistency is the hobgoblin of little minds
Plug 'editorconfig/editorconfig-vim'
" faster editing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-speeddating'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-repeat'
" languages
Plug 'sheerun/vim-polyglot'
" color scheme
Plug 'dguo/blood-moon', {'rtp': 'applications/vim'}
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'
" directory navigation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
" writing
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree (file system explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close vim if NERDTree is the only window still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
                                     \ && b:NERDTree.isTabTree()) | q | endif

" shortcut to open/close NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter (comment/uncomment code)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't add another comment to an already commented line
let NERDDefaultNesting=0
" // var x = y; rather than //var x = y;
let NERDSpaceDelims=1
let NERDCommentWholeLinesInVMode=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe (code completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
set pumheight=5 " limit the number of results shown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use a single leader instead of double leader
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_smartcase = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Skip autopairs unless the following character is whitespace
let g:AutoPairsOnlyWhitespace=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 0
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify for VCS change indicators
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown preview in browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0
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
set clipboard^=unnamed,unnamedplus " use the system clipboard
" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Automatically wrap lines for Markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80
" Extra information
set laststatus=2      " for airline plugin
set number            " show line numbers
set ruler             " show row and column at bottom right
set showcmd           " show info about the current command
set noshowmode        " don't show --INSERT-- at bottom; unneeded with airline
set title             " file name in title bar
set visualbell        " flash command on error
" File handling
set autochdir         " working directory should always be the same as the file
set confirm           " raise dialogue for unsaved changes when quitting
set hidden            " hide buffers with unsaved changes
" Mouse
set mouse=a           " enable mouse support
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
set fillchars=vert:\│ " try to make the vertical split a solid line
set termguicolors " turn on 24-bit ("true") colors
set background=dark
" Use silent so that Vim doesn't spew if it's not installed yet
silent! colorscheme blood-moon
set colorcolumn=80    " vertical stripe for line limit
set showmatch         " highlight matching parenthesis, bracket, or brace
syntax on
" Syntax highlighting for unique files
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead .babelrc set filetype=json
" Command-line
set wildmenu " show possible autocomplete matches in a horizontal menu
" Folding
set foldmethod=syntax
set foldlevel=99 " leave everything unfolded when the file is opened
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" escape clears search highlight
nnoremap <Leader>/ :noh<CR>
" move vertically by physical lines rather than logical lines
map j gj
map k gk
" navigate splits more easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
imap <C-j> <esc><C-W>j
imap <C-k> <esc><C-W>k
imap <C-h> <esc><C-W>h
imap <C-l> <esc><C-W>l
" new tab
nnoremap <C-t>     :tabnew<CR>
" previous tab
nnoremap H gT
" next tab
nnoremap L gt
" use leader and w to save
nnoremap <Leader>w :w<CR>
" use leader and q to quit
nnoremap <Leader>q :q<CR>
" Ctrl-P for fzf (assume we're in a git repo)
noremap <silent> <C-p> :GitFiles -co --exclude-standard<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trim whitespace on save without losing cursor position
" http://stackoverflow.com/a/1618401
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
