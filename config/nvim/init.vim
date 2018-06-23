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
    call dein#add('junegunn/fzf', {'merged': 0})
    call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-commentary')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('idanarye/vim-merginal')
    call dein#add('junegunn/gv.vim')
    call dein#add('lambdalisue/gina.vim')
    call dein#add('airblade/vim-gitgutter')
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
    call dein#add('joshdick/onedark.vim')
    call dein#add('rakr/vim-one')
endif

if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

call dein#remote_plugins()

" }}}

" System settings {{{

let g:far#debug = 1
let g:far#source = 'agnvim'

set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
set undodir=~/.vim/undo//
set list
set complete=.,w,b,u,t,k
set completeopt=longest,menuone,preview
let mapleader = ' '
set mouse=a
set ignorecase
set smartcase

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
nnoremap <C-w>z :mksession! ~/.vim/session.vim<CR>:wincmd o<CR>
nnoremap <C-w>Z :source ~/.vim/session.vim<CR>

noremap Q !!$SHELL<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"}}}

" Themes {{{
set termguicolors
colorscheme onedark
let g:onedark_terminal_italics = 1

"}}}

" Folding {{{
set foldmethod=indent
set foldlevel=99
autocmd FileType vim setlocal foldmethod=marker
"}}}

" Plugins {{{
let g:splitjoin_trailing_comma = 1
let g:splitjoin_python_brackets_on_separate_lines = 1

" Required for operations modifying multiple buffers like rename.
set hidden

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

let g:LanguageClient_settingsPath = '/home/hagay/.config/pyls/settings.json'
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls', '-vv', '--log-file', '/home/hagay/.local/var/log/pyls/pyls.log'],
    \ }

nnoremap <F6> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.python3 = ['LanguageClient']
"}}}
