
" General Settings
"---------------------------------------------------------
" General {{{
set mouse=nv                 " Disable mouse in command-line mode
set mousehide                " Hide mouse while typing
set modeline                 " automatically setting options from modelines
set report=0                 " Report on lines changes for any amount of lines change
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions+=j         " Remove comment leader when joining lines

" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix

set clipboard& clipboard+=unnamedplus

" }}}
" Wildmenu {{{
" --------
set wildmode=longest:full
set wildoptions=pum,tagfile
set wildignorecase
set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
set wildignore+=__pycache__,*.egg-info,.pytest_cache

" }}}
" Vim Directories {{{
" ---------------
set undofile swapfile nobackup
set directory=$VARPATH/swap//,$VARPATH,~/tmp,/var/tmp,/tmp
set undodir=$VARPATH/undo//,$VARPATH,~/tmp,/var/tmp,/tmp
set backupdir=$VARPATH/backup/,$VARPATH,~/tmp,/var/tmp,/tmp
set viewdir=$VARPATH/view/
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" History saving
set history=2000
if has('nvim')
	"  ShaDa/viminfo:
	"   ' - Maximum number of previously edited files marks
	"   < - Maximum number of lines saved for each register
	"   @ - Maximum number of items in the input-line history to be
	"   s - Maximum size of an item contents in KiB
	"   h - Disable the effect of 'hlsearch' when loading the shada
	set shada='300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$VARPATH/viminfo
endif

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set expandtab       " Don't expand tabs to spaces.
set tabstop=4       " The number of spaces a tab is
set softtabstop=4   " While performing editing operations
set shiftwidth=4    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

" }}}
" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set updatetime=1000 " Idle time to write swap and trigger CursorHold

" Time out on key codes
set ttimeoutlen=10

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

" }}}
" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,usetab    " Jump to the first open window in any tab
set switchbuf+=vsplit           " Switch buffer behavior to vsplit
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set completeopt=menu,menuone         " Show menu even for one item
set completeopt+=noselect       " Do not select a match in the menu
set completeopt+=noinsert
set inccommand=nosplit

" }}}
" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTIcF   " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number              " Show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
set winheight=4         " Minimum height for active window
set winminheight=2      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit
set display=lastline
set conceallevel=2 concealcursor=niv " For snippet_complete marker

set pumblend=20
set winblend=20

" }}}
" Folds {{{
" -----

" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
autocmd MyAutoCmd TextChangedI,TextChanged *
	\ if &l:foldenable && &l:foldmethod !=# 'manual' |
	\   let b:foldmethod_save = &l:foldmethod |
	\   let &l:foldmethod = 'manual' |
	\ endif

autocmd MyAutoCmd BufWritePost *
	\ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
	\   let &l:foldmethod = b:foldmethod_save |
	\   execute 'normal! zx' |
	\ endif

if has('folding')
	set foldenable
	set foldmethod=syntax
	set foldlevelstart=99
	set foldtext=FoldText()
endif

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
	" Get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let foldLevelStr = repeat('+--', v:foldlevel)
	let lineCount = line('$')
	let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
	let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

" }}}

" Netrw {{{
" --------
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
