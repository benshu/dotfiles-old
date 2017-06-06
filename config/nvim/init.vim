" Neovim init.vim
" Author:  Hagay Ben Shushan
" repo  : https://github.com/benshu/dotfiles/
"

" Setup Plugins ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/

if dein#load_state(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
    call dein#begin(expand('~/.config/nvim'))
    call dein#add('Shougo/dein.vim')
    " call dein#add('Konfekt/FastFold')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/unite.vim')
    call dein#add('mileszs/ack.vim')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('haya14busa/dein-command.vim')
    call dein#add('honza/vim-snippets')
    call dein#add('itmammoth/doorboy.vim')
    call dein#add('junegunn/vim-easy-align')
    " call dein#add('tweekmonster/braceless.vim')
    " call dein#add('majutsushi/tagbar')
    call dein#add('neomake/neomake')
    call dein#add('scrooloose/nerdtree')
    call dein#add('terryma/vim-multiple-cursors')
    "call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
    call dein#add('terryma/vim-expand-region')
    call dein#add('tmux-plugins/vim-tmux')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('idanarye/vim-merginal')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('tpope/vim-dispatch')
    call dein#add('tyru/open-browser.vim')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
    call dein#add('hynek/vim-python-pep8-indent')
    call dein#add('AndrewRadev/splitjoin.vim')
    call dein#add('milkypostman/vim-togglelist')
    call dein#add('jpalardy/vim-slime.git')
    call dein#add('junegunn/gv.vim')
    call dein#add('junegunn/vim-peekaboo')
    call dein#add('junegunn/goyo.vim')
    call dein#add('wellle/tmux-complete.vim')
    call dein#add('michaeljsmith/vim-indent-object')
    call dein#add('junegunn/fzf', { 'merged': 0, 'build': './install --all' })
    call dein#add('junegunn/fzf.vim')


    " On evaluation
    call dein#add('alfredodeza/coveragepy.vim')
    call dein#add('elzr/vim-json', {'on_ft': 'json'})
    call dein#add('henrik/vim-indexed-search')
    call dein#add('janko-m/vim-test', {'on_ft': 'python'})
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('sbdchd/neoformat')
    call dein#add('junegunn/limelight.vim')
    call dein#add('junegunn/rainbow_parentheses.vim')

    " Themes
    call dein#add('mhartington/oceanic-next')
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('justinmk/molokai')
    call dein#add('joshdick/onedark.vim')

    "" these need to be added last
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

filetype plugin indent on
" }}}

" DEPRECATION HELL
"
"
" call dein#add('ctrlpvim/ctrlp.vim')
" nnoremap <leader>T :CtrlPTag<CR>
" nnoremap <leader>t :CtrlPTag<CR>
" nnoremap <leader>t :CtrlPTagBufAll<CR>
" System Settings  ----------------------------------------------------------{{{
" Neovim Settings
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set clipboard+=unnamedplus
" Currently needed for neovim paste issue
set pastetoggle=<f6>
set noshowmode
filetype on
set number
set relativenumber
set cursorline
set tabstop=4 shiftwidth=4 expandtab
set conceallevel=0
" block select not limited by shortest line
set virtualedit=block
set wildmenu
set laststatus=2
set wrap linebreak nolist
set wildmode=full
set updatetime=500
" Define completion types for vim autocomplete
set complete=.,w,b,u,t,k
let mapleader = ','
set undofile
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
if exists("&undodir")
    set undodir=~/.vim/undo//
endif
set noswapfile
" Add the g flag to search/replace by default
set gdefault
" Don’t add empty newlines at the end of files
set noeol
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Respect modeline in files
set modeline
set modelines=4
" Ignore case of searches
set ignorecase
" Ignore case in wildmenu
set wildignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Lazy redrawing for faster responsivness
set lazyredraw
set inccommand=split
set shortmess+=atI
" }}}

" System mappings  ----------------------------------------------------------{{{
let g:lmap =  {}
vnoremap // y/<C-R>"<CR>
" Map Y to more logical yank to end of line
map Y y$
" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
" noremap  <silent> k gk
" noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
inoremap jk <esc>
inoremap kj <esc>
noremap H ^
noremap L g_
nnoremap ; :
nnoremap <leader>c :bd<CR>
" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>
noremap <leader>TM :TableModeToggle<CR>
inoremap <c-f> <c-x><c-f>
" Copy to system clipboard
vnoremap <C-c> "*y<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nnoremap <leader>d "_d
let g:lmap.d = { 'name' : 'Empty delete' }
vnoremap <leader>d "_d
vnoremap <c-/> :TComment<cr>
map <silent> <esc> :noh<cr>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Run line under cursor as shell command and paste output to buffer
noremap Q !!$SHELL<CR>
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>
" Quick way to save file
nnoremap <leader>w :w<CR>
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"command abbrevs we can use `:E<space>` (and similar) to edit a file in the
"same dir as current file
cabbrev E <c-r>="e "  . expand("%:h") . "/"<cr><c-r>=<SID>Eatchar(' ')<cr>
cabbrev Sp <c-r>="sp " . expand("%:h") . "/"<cr><c-r>=<SID>Eatchar(' ')<cr>
cabbrev SP <c-r>="sp " . expand("%:h") . "/"<cr><c-r>=<SID>Eatchar(' ')<cr>
cabbrev Vs <c-r>="vs " . expand("%:h") . "/"<cr><c-r>=<SID>Eatchar(' ')<cr>
cabbrev VS <c-r>="vs " . expand("%:h") . "/"<cr><c-r>=<SID>Eatchar(' ')<cr>
function! s:Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
"}}}

" Themes, Commands, etc  ----------------------------------------------------{{{
" Theme
syntax on
" set background=dark
colorscheme onedark
let g:onedark_terminal_italics = 1

" rainbow_parentheses settings
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
au VimEnter * RainbowParentheses

" ,f to format code
noremap <leader>f :Autoformat<CR>
let g:lmap.f = { 'name' : 'Format file' }

let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 0,
            \ 'stdin': 0,
            \ 'no_append': 0,
            \ }

let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_only_msg_on_error = 1

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
"}}}

" Python --------------------------------------------------------------------{{{

" let $NVIM_PYTHON_LOG_FILE="nvimpy.log"
" let $NVIM_PYTHON_LOG_LEVEL='DEBUG'
let g:jedi#auto_vim_configuration       = 0
let g:jedi#documentation_command        = "<leader>k"
let g:deoplete#sources#jedi#python_path = "python3"
let g:jedi#goto_assignments_command     = "<leader>pa"
let g:jedi#goto_definitions_command     = "<leader>pd"
let g:jedi#documentation_command        = "<leader>pk"
let g:jedi#usages_command               = "<leader>pu"
let g:jedi#rename_command               = "<leader>pr"
let g:jedi#use_splits_not_buffers = "right"
" Python breakpoints shortcuts
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>bu oimport pudb; pu.db;<esc>
au FileType python map <silent> <leader>Bu Oimport pudb; pu.db;<esc>

" splitjoin settings

let g:splitjoin_trailing_comma = 1
let g:splitjoin_python_brackets_on_separate_lines = 1

" Dispatch settings

let g:tmux_session = "left"
let g:tmux_window = "test"

au FileType python map <silent> <leader>pt :Dispatch docker exec -it worker pytest -s /backend/%<CR>
" Set vim togglelist to use Copen as quickfix window
let g:toggle_list_copen_command="Copen"

" Execute python file with python3
noremap <leader>p :Dispatch! python3 %<CR>

" Use braceless plugin for python-aware indenting
" autocmd FileType python BracelessEnable +indent
"
" let g:braceless_cont_call = 1
" let g:braceless_cont_block = 1
" let g:braceless_line_continuation = 0

" }}}

" Linting -------------------------------------------------------------------{{{

let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
" let g:neomake_open_list = 2
let g:neomake_list_height = 5

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠ '
" hi ALEErrorSign guifg=#ec5f67 ctermfg=203 guibg=#343d46 ctermbg=237
" hi ALEWarningSign guifg=#fac863 ctermfg=221 guibg=#343d46 ctermbg=237
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
" E501 is line length of 80 characters
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--ignore=E501', '--max-line-length=120'], }
hi NeomakeError gui=undercurl
autocmd! BufWritePost * Neomake
"}}}

" Fold, gets it's own section  ----------------------------------------------{{{
set foldlevel=99
" Space to toggle folds.
nnoremap <tab> za
vnoremap <tab> za

autocmd FileType python set foldmethod=indent
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
" }}}

" Git -----------------------------------------------------------------------{{{
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>
" }}}

" NERDTree ------------------------------------------------------------------{{{
map <silent> - :NERDTreeToggle<CR>
map <silent> <leader>nf :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['__pycache__'] " Ignore files in .gitignore
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let NERDTreeMapJumpFirstChild = ''
let g:WebDevIconsOS = 'Linux'
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:DevIconsEnableFoldersOpenClose = 1
"}}}

" Snipppets -----------------------------------------------------------------{{{

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#expand_word_boundary = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

"}}}

" Deoplete ------------------------------------------------------------------{{{
" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1
set splitbelow
" set completeopt+=noselect

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
endfunction

call deoplete#custom#set('buffer', 'mark', 'buf')
call deoplete#custom#set('omni', 'mark', 'O')
call deoplete#custom#set('file', 'mark', 'f')
function! Preview_func()
    if &pvw
        setlocal nonumber norelativenumber
    endif
endfunction
autocmd WinEnter * call Preview_func()

"}}}

" Denite --------------------------------------------------------------------{{{
"
call denite#custom#option('default', 'prompt', '❯')
call denite#custom#source(
            \ 'file_rec', 'vars', {
            \   'command': [
            \      'rg', '--follow','--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png'
            \] })
call denite#custom#source('file_rec', 'sorters', ['sorter_rank'])

nnoremap <silent> <c-p> :Denite file_rec<CR>
hi deniteMatched guibg=None
hi deniteMatchedChar guibg=None

nnoremap <silent> <leader>h :Denite  help<CR>
nnoremap <silent> <leader>u :call dein#update()<CR>
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
            \   '*.pyc', '*.swp', '*.swn', '*.swl', '*.swo'])

" Git from unite...ERMERGERD ------------------------------------------------{{{
let s:menus = {} " Useful when building interfaces at appropriate places
let s:menus.git = {
            \ 'description' : 'Fugitive interface',
            \}
let s:menus.git.command_candidates = [
            \[' git status', 'Gstatus'],
            \[' git diff', 'Gvdiff'],
            \[' git commit', 'Gcommit'],
            \[' git stage/add', 'Gwrite'],
            \[' git checkout', 'Gread'],
            \[' git rm', 'Gremove'],
            \[' git cd', 'Gcd'],
            \[' git push', 'exe "Git! push " input("remote/branch: ")'],
            \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
            \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
            \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
            \[' git fetch', 'Gfetch'],
            \[' git merge', 'Gmerge'],
            \[' git browse', 'Gbrowse'],
            \[' git head', 'Gedit HEAD^'],
            \[' git parent', 'edit %:h'],
            \[' git log commit buffers', 'Glog --'],
            \[' git log current file', 'Glog -- %'],
            \[' git log last n commits', 'exe "Glog -" input("num: ")'],
            \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
            \[' git log until date', 'exe "Glog --until=" input("day: ")'],
            \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
            \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
            \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
            \[' git mv', 'exe "Gmove " input("destination: ")'],
            \[' git grep',  'exe "Ggrep " input("string: ")'],
            \[' git prompt', 'exe "Git! " input("command: ")'],
            \] " Append ' --' after log to get commit info commit buffers
call denite#custom#var('menu', 'menus', s:menus)
nnoremap <silent> <Leader>g :Denite menu:git <CR>
"}}}
"}}}

" Searching (Ack, rg, FZF) -------------------------------------------------------{{{

if executable('rg')
    " let g:ackprg = 'ag --vimgrep'
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ack! ' . input('Ack!/')<CR>
nnoremap <silent> <leader>. :AckIn

nnoremap <silent> K :call SearchWordWithAck()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAck()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAck()
    execute 'Ack!' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAck() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ack!' selection
endfunction

function! SearchWithAckInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AckIn call SearchWithAckInDirectory(<f-args>)

" }}}

" Navigate between vim buffers and tmux panels ------------------------------{{{
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
vmap <C-c>r <Plug>SendSelectionToTmux
nmap <leader>r <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"}}}

" vim-airline ---------------------------------------------------------------{{{
" let g:airline#extensions#tabline#buffer_nr_format = '%s '
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#neomake#error_symbol='✖ :'
let g:airline#extensions#neomake#warning_symbol='⚠ :'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme='onedark'
set hidden
" cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
" nmap <leader>t :term<cr>
" tmap <leader>. <C-\><C-n>:bprevious<CR>
tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" let g:airline_section_z = airline#section#create(['circleci'])

let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}

"}}}
"
"Functions ---------------------------------------------------------------{{{
"
"toggle a markdown notes file in a fixed window on the right with f12
nnoremap <F12> :NotesToggle<cr>
command! -nargs=0 NotesToggle call <sid>toggleNotes()
function! s:toggleNotes() abort
    let winnr = bufwinnr("~/notes.md")
    if winnr > 0
        exec winnr . "wincmd c"
        return
    endif

    botright 100vs ~/notes.md
    setl wfw
    setl nonu

    "hack to make nerdtree et al not split the window
    "setl previewwindow

    "for some reason this doesnt get run automatically and the cursor
    "position doesn't get set
    doautocmd bufreadpost %

    "normal zMzO
endfunction
" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

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
command! -nargs=0 Wipe call Wipeout()
"}}}
