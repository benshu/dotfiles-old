" Neovim Configuration
" Author:  Hagay Ben Shushan
" Repository  : https://github.com/benshu/dotfiles/

" Plugins {{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
if dein#load_state(expand("$HOME/.config/nvim/repos"))
    call dein#begin(expand('~/.config/nvim/repos'))
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    let g:deoplete#enable_at_startup = 1

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('junegunn/fzf', {'merged': 0})
    call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-vinegar.git')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('idanarye/vim-merginal')
    call dein#add('junegunn/gv.vim')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('lambdalisue/gina.vim')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('will133/vim-dirdiff')
    call dein#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'build': 'bash install.sh'})
    call dein#add('w0rp/ale')
    call dein#add('michaeljsmith/vim-indent-object')
    call dein#add('brooth/far.vim')
    call dein#add('AndrewRadev/splitjoin.vim')
    call dein#add('hynek/vim-python-pep8-indent')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('benmills/vimux')
    call dein#add('alfredodeza/coveragepy.vim')
    call dein#add('chrisbra/Colorizer')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('wellle/tmux-complete.vim')
    call dein#add('dyng/ctrlsf.vim')

    call dein#add('joshdick/onedark.vim')
    call dein#add('rakr/vim-one')
    call dein#add('morhetz/gruvbox')

    call dein#add('Vigemus/iron.nvim')

endif

if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

call dein#remote_plugins()

" }}}

" System settings {{{

set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set backupdir=~/.cache/nvim/backups//
set directory=~/.cache/nvim/swaps//
set undodir=~/.cache/nvim/undo//
set list
set complete=.,w,b,u,t,k
set completeopt=longest,menuone,preview
let mapleader = ' '
set mouse=a
set ignorecase
set smartcase
set noshowmode
" Required for operations modifying multiple buffers like rename.
set hidden
set breakindent
set wildignore=*.pyc,__pycache__/**,.cache/,tags,.vscode/**,.ropeproject/**,.pytest_cache/**,.git/**,.flake8,.coverage,.coveragerc,cov-report/**,cov_annotate/**,coverage_html_report/**,htmlcov/**,.gitignore,.gitmodules,

map <silent> <esc> :noh<cr>

" }}}

" Mappings  {{{
" Setup the leader mapping dictionary for commenting the mappings
let g:lmap =  {}

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-P> :Files<CR>

" zoom into split
nnoremap <C-w>z :mksession! ~/.cache/nvim/session.vim<CR>:wincmd o<CR>
nnoremap <C-w>Z :source ~/.cache/nvim/session.vim<CR>

noremap Q !!$SHELL<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"}}}

" Themes {{{
set termguicolors
colorscheme gruvbox
set background=dark
"let g:onedark_terminal_italics = 1
"}}}

" Folding {{{
set foldmethod=indent
set foldlevel=99
autocmd FileType vim setlocal foldmethod=marker
"}}}

" FAR - Find and Replace {{{
let g:far#debug = 1
let g:far#source = 'rgnvim'
"}}}

" SplitJoin {{{
let g:splitjoin_trailing_comma = 1
let g:splitjoin_python_brackets_on_separate_lines = 1
"}}}

" Ale - Linting and fixing {{{
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠ '
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_autopep8_options = '--in-place --aggressive --aggressive --max-line-length=120'
let g:ale_linters = {
            \ 'python': ['flake8'],
            \ 'javascript': ['eslint']
            \ }
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \ 'javascript': ['eslint']
            \ }

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
vmap <F8> <Plug>(ale_fix)
"}}}

" LanguageClient {{{
let g:LanguageClient_settingsPath = '/home/hagay/.config/pyls/settings.json'
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls', '-vv', '--log-file', '/home/hagay/.local/var/log/pyls/pyls.log'],
    \ }

nnoremap <F6> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" }}}

" Deoplete - completion manager {{{

let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.python3 = ['LanguageClient']

" }}}

" Neosnippet - snippet manager {{{

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"}}}

" tmux-complete {{{
let g:tmuxcomplete#trigger = ''
" }}}
