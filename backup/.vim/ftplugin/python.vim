setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
map <F5> :w<Enter> :!python3 %<Enter>
imap <F5> <Esc>:w<Enter> :!python3 %<Enter>


"insert mode,  no remap,  map , --> , 
inoremap , ,<space>
inoremap == <space>==<space>
inoremap != <space>!=<space>
inoremap = <space>=<space>
inoremap + <space>+<space>
inoremap - <space>-<space>
inoremap * <space>*<space>
"inoremap / <space>/<space>
inoremap // //
inoremap ++ ++
inoremap -- --
inoremap ** <space>**<space>
inoremap += <space>+=<space>
inoremap -= <space>-=<space>
inoremap *= <space>*=<space>
inoremap /= <space>/=<space>
inoremap -> ->
