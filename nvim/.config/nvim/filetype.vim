
" File-type Detection
" ------------------------------------------------

if exists('did_load_filetypes')
	finish
endif

augroup filetypedetect

	autocmd BufNewFile,BufRead yarn.lock            setfiletype yaml
	autocmd BufNewFile,BufRead */.kube/config       setfiletype yaml
	autocmd BufNewFile,BufRead .tern-{project,port} setfiletype json
	autocmd BufNewFile,BufRead *.lock               setfiletype json
	autocmd BufNewFile,BufRead *.js.map             setfiletype json
	autocmd BufNewFile,BufRead .jsbeautifyrc        setfiletype json
	autocmd BufNewFile,BufRead .eslintrc            setfiletype json
	autocmd BufNewFile,BufRead .jscsrc              setfiletype json
	autocmd BufNewFile,BufRead .babelrc             setfiletype json
	autocmd BufNewFile,BufRead .watchmanconfig      setfiletype json

	autocmd BufNewFile,BufRead Tmuxfile,tmux/config setfiletype tmux

augroup END

" vim: set ts=2 sw=2 tw=80 noet :
