"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Danny Guo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vi IMproved
set nocompatible
" space is easier to reach than backslash
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug set-up
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" light as air status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" A foolish consistency is the hobgoblin of little minds
Plug 'neomake/neomake'
Plug 'jaawerth/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
" faster editing
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-speeddating'
" languages
Plug 'sheerun/vim-polyglot'
" precision colors for machines and people
Plug 'altercation/vim-colors-solarized'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" directory navigation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" writing
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/goyo.vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline (status line)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_section_z = '%4l/%L %3c'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake (linting)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_python_enabled_makers = ['pylint']
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
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>s <Plug>(easymotion-f)
map <Leader>S <Plug>(easymotion-F)
map <Leader>w <Plug>(easymotion-w)
map <Leader>W <Plug>(easymotion-W)
map <Leader>b <Plug>(easymotion-b)
map <Leader>B <Plug>(easymotion-B)
map <Leader>e <Plug>(easymotion-e)
map <Leader>E <Plug>(easymotion-E)
map <Leader>gE <Plug>(easymotion-gE)
map <Leader>ge <Plug>(easymotion-ge)
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
" Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
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
set fillchars=vert:\│ " try to make the vertical split a solid line
set termguicolors " turn on 24-bit ("true") colors
set background=dark
" Precision colors for machines and people
" Use silent so that Vim doesn't spew if it's not installed yet
silent! colorscheme solarized
" Fix incorrect background colors with Solarized in Terminator
" https://github.com/Anthony25/gnome-terminal-colors-solarized
" #conflicting-background-colors-in-vim
if system("uname") == "Linux\n"
    set t_Co=16
endif
set cursorline        " highlight the line that the cursor is in
set colorcolumn=80    " vertical stripe for line limit
set showmatch         " highlight matching parenthesis, bracket, or brace
syntax on
set encoding=utf-8
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
" Ctrl-P for fzf (assume we're in a git repo)
noremap <silent> <C-p> :GitFiles -co --exclude-standard<CR>
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
