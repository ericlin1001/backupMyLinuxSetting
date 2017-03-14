" Author: Ericlin
" Date:  Wed Mar  8 14:38:41 CST 2017
"
"ensure this is loaded only once!
if exists('did_AutoIBUS_loaded') | finish | endif
let did_AutoIBUS_loaded = 1



function! AutoIBUS_selectDefault()
	if exists('g:AutoIBUS_disable')
		return
	endif
	"echo "selectDefault"
	let l:a = system("/home/ailab/.bin/inputMethod/setEn.sh")
endfunction

function! AutoIBUS_saveAndSelectDefault()
	if exists('g:AutoIBUS_disable')
		return
	endif
	"echo "saveAndSelect"
	let l:a = system("/home/ailab/.bin/inputMethod/saveAndSetEn.sh")
endfunction

function! AutoIBUS_restoreAndSelect()
	if exists('g:AutoIBUS_disable')
		return
	endif
	"echo "restoreAndSelect"
	let l:a = system("/home/ailab/.bin/inputMethod/restoreInputMethod.sh")
endfunction

" define the current group
augroup AutoIBUS
	"ensure the autocmd load only once.
	if !exists("autocommands_loaded")
		let autocommands_loaded=1
	endif
	"autocmd {event} {files} {command}; means if event occurs to files,
	"execute the command.
	autocmd VimLeavePre * call AutoIBUS_selectDefault()
	autocmd InsertLeave * call AutoIBUS_saveAndSelectDefault()
	autocmd InsertEnter * call AutoIBUS_restoreAndSelect()
	augroup end
