" Make Vim more useful
set nocompatible              " be iMproved

"
"                       _ _              _             _
"__   ___   _ _ __   __| | | ___   _ __ | |_   _  __ _(_)_ __
"\ \ / / | | | '_ \ / _` | |/ _ \ | '_ \| | | | |/ _` | | '_ \
" \ V /| |_| | | | | (_| | |  __/ | |_) | | |_| | (_| | | | | |
"  \_/  \__,_|_| |_|\__,_|_|\___| | .__/|_|\__,_|\__, |_|_| |_|
"                                 |_|            |___/
"
" {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug '907th/vim-auto-save'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'brauner/vimtux'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Raimondi/delimitMate'
"Themes
Plug 'mhartington/oceanic-next'
Plug 'git://github.com/altercation/vim-colors-solarized.git'
Plug 'tomasr/molokai'
Plug 'https://github.com/sickill/vim-monokai'
Plug 'jellybeans.vim'
Plug 'https://github.com/digitaltoad/vim-pug'
"Plugin 'https://github.com/terryma/vim-multiple-cursors'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
call plug#end()
" }}}

"__     _____ __  __            _   _   _
"\ \   / /_ _|  \/  |  ___  ___| |_| |_(_)_ __   __ _ ___
" \ \ / / | || |\/| | / __|/ _ \ __| __| | '_ \ / _` / __|
"  \ V /  | || |  | | \__ \  __/ |_| |_| | | | | (_| \__ \
"   \_/  |___|_|  |_| |___/\___|\__|\__|_|_| |_|\__, |___/
"                                               |___/
" {{{
filetype plugin indent on

" enable truecolor in vim

set termguicolors

if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" Prevent delay when esc. from insert mode (Should be os x only)
set timeoutlen=1000 ttimeoutlen=0

set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,*.png,*.jpg

"syntax enable
"set background=dark
"let g:solarized_termtrans=256


"clang formatter
map <C-K> :pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>

set grepprg=grep\ -nH\ $* " For latex-suite
let g:tex_flavor='latex'
"
" Python breakpoints shortcuts
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>
set iskeyword+=:
"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = 'python' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
"
" Synatstic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec='python3'


" Setup autosave plugin, off by default, enable with :AutoSaveToggle
let g:auto_save = 0
let g:auto_save_in_insert_mode = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
" Set indentation to expand to 4 spaces
set shiftwidth=4
" Expand tabs to spaces
set expandtab

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
set ttymouse=xterm2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" execute the current line of text as a shell command

if has("gui_running")
    set guifont="Source\ Code\ Pro\ for\ Powerline\ Medium:h16"
    set linespace=1
endif
colorscheme OceanicNext
"}}}
" ____  _             _         ____       _   _   _
"|  _ \| |_   _  __ _(_)_ __   / ___|  ___| |_| |_(_)_ __   __ _ ___
"| |_) | | | | |/ _` | | '_ \  \___ \ / _ \ __| __| | '_ \ / _` / __|
"|  __/| | |_| | (_| | | | | |  ___) |  __/ |_| |_| | | | | (_| \__ \
"|_|   |_|\__,_|\__, |_|_| |_| |____/ \___|\__|\__|_|_| |_|\__, |___/
"               |___/                                      |___/
" {{{
vmap <C-c>r <Plug>SendSelectionToTmux
nmap <leader>r <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore
let g:ctrlp_working_path_mode= 'ra'

"clang formatter for c files
" map <C-K> :pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>
" imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>
let g:NERDTreeIgnore = ['__pycache__'] " Ignore files in .gitignore
map <silent> - :NERDTreeToggle<CR>
" Nerd commenter
"
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" Python breakpoints shortcuts
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
set iskeyword+=:

" YCM settings
"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
"
" Synatstic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec='python'
" Disable line too long errors in syntastic
let g:syntastic_python_flake8_args='--ignore=E501'

set runtimepath^=~/.vim/bundle/ctrlp.vim

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Enable folding
set foldmethod=marker
set foldlevel=99

" Simply fold settings
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=indent
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_theme = "oceanicnext"

"Multi cursors config
"
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" }}}
"  _____                 _   _
" |  ___|   _ _ __   ___| |_(_) ___  _ __  ___
" | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" |  _|| |_| | | | | (__| |_| | (_) | | | \__ \
" |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

" {{{
" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Function to close all buffers but those open in a window
"
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" }}}
"
"  _  __            ____  _           _ _
" | |/ /___ _   _  | __ )(_)_ __   __| (_)_ __   __ _ ___
" | ' // _ \ | | | |  _ \| | '_ \ / _` | | '_ \ / _` / __|
" | . \  __/ |_| | | |_) | | | | | (_| | | | | | (_| \__ \
" |_|\_\___|\__, | |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
          " |___/                               |___/

" {{{
"
nnoremap ; :
" Copy to ubuntu clipboard
vnoremap <C-c> "+y<CR>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" Enable folding with the spacebar
nnoremap <space> za
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Run line under cursor as shell command and paste output to buffer
noremap Q !!$SHELL<CR>

nnoremap <leader>T :CtrlPTag<CR>
nnoremap <leader>t :CtrlPTagBufAll<CR>
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>
" }}}
