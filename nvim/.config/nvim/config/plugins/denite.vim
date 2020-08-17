	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> d
	  \ denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
	endfunction

	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction

	" Change file/rec command.
	call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	" For ripgrep
	" Note: It is slower than ag
	call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git'])
	" For Pt(the platinum searcher)
	" NOTE: It also supports windows.
	call denite#custom#var('file/rec', 'command',
	\ ['pt', '--follow', '--nocolor', '--nogroup',
	\  (has('win32') ? '-g:' : '-g='), ''])
	" For python script scantree.py
	" Read bellow on this file to learn more about scantree.py
	call denite#custom#var('file/rec', 'command',
	\ ['scantree.py', '--path', ':directory'])

	" Change matchers.
	call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
	call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/cpsm'])

	" Change sorters.
	call denite#custom#source(
	\ 'file/rec', 'sorters', ['sorter/sublime'])

	" Change default action.
	call denite#custom#kind('file', 'default_action', 'split')

	" Add custom menus
	let s:menus = {}

	let s:menus.zsh = {
		\ 'description': 'Edit your import zsh configuration'
		\ }
	let s:menus.zsh.file_candidates = [
		\ ['zshrc', '~/.config/zsh/.zshrc'],
		\ ['zshenv', '~/.zshenv'],
		\ ]

	let s:menus.my_commands = {
		\ 'description': 'Example commands'
		\ }
	let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
		\ ]

	call denite#custom#var('menu', 'menus', s:menus)

	" Ag command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['ag'],
		\ 'default_opts': ['-i', '--vimgrep'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': [],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

	" Ack command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['ack'],
		\ 'default_opts': [
		\   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
		\   '--nopager', '--nocolor', '--nogroup', '--column'
		\ ],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--match'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

	" Ripgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

	" Pt command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['pt'],
		\ 'default_opts': [
		\   '-i', '--nogroup', '--nocolor', '--smart-case'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': [],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

	" jvgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['jvgrep'],
		\ 'default_opts': ['-i'],
		\ 'recursive_opts': ['-R'],
		\ 'pattern_opt': [],
		\ 'separator': [],
		\ 'final_opts': [],
		\ })

	" Specify multiple paths in grep source
	"call denite#start([{'name': 'grep',
	"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

	" Define alias
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])

	call denite#custom#alias('source', 'file/rec/py', 'file/rec')
	call denite#custom#var('file/rec/py', 'command',
	\ ['scantree.py', '--path', ':directory'])

	" Change ignore_globs
	call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

	" Custom action
	" Note: lambda function is not supported in Vim8.
	call denite#custom#action('file', 'test',
	      \ {context -> execute('let g:foo = 1')})
	call denite#custom#action('file', 'test2',
	      \ {context -> denite#do_action(
	      \  context, 'open', context['targets'])})
	" Source specific action
	call denite#custom#action('source/file', 'test',
	      \ {context -> execute('let g:bar = 1')})

" denite.nvim
" -----------

" INTERFACE
call denite#custom#option('default', {
	\ 'prompt': 'λ:',
	\ 'empty': 0,
	\ 'winheight': 16,
	\ 'source_names': 'short',
	\ 'vertical_preview': 1,
	\ 'auto-accel': 1,
	\ 'auto-resume': 1,
	\ })

call denite#custom#option('list', {})
call denite#custom#option('mpc', { 'mode': 'normal', 'winheight': 20 })

" MATCHERS
" Default is 'matcher/fuzzy'
call denite#custom#source('tag', 'matchers', ['matcher/substring'])
" call denite#custom#source('file/rec', 'matchers', ['matcher/fruzzy'])

if has('nvim') && &runtimepath =~# '\/cpsm'
	call denite#custom#source(
		\ 'buffer,file_mru,file_old,file/rec,grep,mpc,line,neoyank',
		\ 'matchers', ['matcher/cpsm', 'matcher/fuzzy'])
endif

" SORTERS
" Default is 'sorter/rank'
call denite#custom#source('z', 'sorters', ['sorter_z'])

" CONVERTERS
" Default is none
call denite#custom#source(
	\ 'buffer,file_mru,file_old',
	\ 'converters', ['converter_relative_word'])

" FIND and GREP COMMANDS
if executable('ag')
	" The Silver Searcher
	call denite#custom#var('file/rec', 'command',
		\ ['ag', '-U', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])

	" Setup ignore patterns in your .agignore file!
	" https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'default_opts',
		\ [ '--skip-vcs-ignores', '--vimgrep', '--smart-case', '--hidden' ])

elseif executable('ack')
	" Ack command
	call denite#custom#var('grep', 'command', ['ack'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--match'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'default_opts',
			\ ['--ackrc', $HOME.'/.config/ackrc', '-H',
			\ '--nopager', '--nocolor', '--nogroup', '--column'])

elseif executable('rg')
	" Ripgrep
  call denite#custom#var('file/rec', 'command',
       \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
       \ ['-i', '--vimgrep', '--no-heading'])
endif

" KEY MAPPINGS
let insert_mode_mappings = [
	\  ['jj', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
	\  ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
	\  ['<Up>', '<denite:assign_previous_text>', 'noremap'],
	\  ['<Down>', '<denite:assign_next_text>', 'noremap'],
	\  ['<C-Y>', '<denite:redraw>', 'noremap'],
	\  ['<BS>', '<denite:smart_delete_char_before_caret>', 'noremap'],
	\  ['<C-h>', '<denite:smart_delete_char_before_caret>', 'noremap'],
	\ ]

let normal_mode_mappings = [
	\   ["'", '<denite:toggle_select_down>', 'noremap'],
	\   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
	\   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
	\   ['gg', '<denite:move_to_first_line>', 'noremap'],
	\   ['st', '<denite:do_action:tabopen>', 'noremap'],
	\   ['sg', '<denite:do_action:vsplit>', 'noremap'],
	\   ['sv', '<denite:do_action:split>', 'noremap'],
	\   ['sc', '<denite:quit>', 'noremap'],
	\   ['r', '<denite:redraw>', 'noremap'],
	\ ]

for m in insert_mode_mappings
	call denite#custom#map('insert', m[0], m[1], m[2])
endfor
for m in normal_mode_mappings
	call denite#custom#map('normal', m[0], m[1], m[2])
endfor

" vim: set ts=2 sw=2 tw=80 noet :
