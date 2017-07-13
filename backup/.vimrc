execute pathogen#infect()
" For my phone's wireless keyboard.
" 
imap !! <Esc> 
map !! <Esc> 
imap <F1> <Esc> 
map <F1> <Esc> 
map ]] <C-]>
" Ctrl-C to escape.




"to view all set options
":set all  or :browse set

syntax on
"<F5>`make`
map <F5> <Esc>make<CR>
"imap <F5> <Esc>make<CR>
"Using make command.
"map make :w<Enter> :!clear<Enter> :make<Enter>
map make :w<Enter> :!clear<Enter> :!make<Enter>
" map mm make

"[I
"[<Tab> jump to function in headers.
"Ctrl+6 jump back

" Process erros
" :copen try enter
" :cclose 
" :cw toggles the mini-window
" :cn next error
" :cp previous error.
map <F9> :cw<Enter>
map <F10> :cn<Enter>

"<F7> toggle functions list
map <F3> :TlistToggle<CR>

"<F8> Toggle between Header/Source files (.h/.cpp)
map <F8> :A<CR> 

"<F6> switch between windows
map <F6> <C-W><C-W>

"<Ctrl-F12> build tags
map <C-F12> :!ctags -f .tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

map tags <C-F12> <CR>

"other useful hot-keys.
map == mtgg=GG'tzz
map // 0i//<Esc>
map d/ 02x

"cc:copy to tmp, tp:paste.
map cc :w! /tmp/vimtmp<Enter>
map tp :r /tmp/vimtmp<Enter>


"highlight matching search strings
set hlsearch
set ignorecase
"do incremental searches
set incsearch 
"autowrite, if needed, like make
"set autowrite


"Using the clipboard as the default register(vim --version|grep clipboard to
"check supporting
set clipboard=unnamed

set tabstop=4
set softtabstop=4  
set shiftwidth=4  
set autoindent  
"turn on c-style indent.
set cindent  
set smarttab
set number  

"AutoCmd BufNewFile,BufRead *.py
"\setlocal smarttab
"\setlocal expandtab
filetype plugin indent on


let g:ctags_path="/usr/bin/ctags"  
let g:ctags_statusline=1  
let g:ctags_title=1  
let g:generate_tags=1  
let g:ctags_regenerate=1  
let Tlist_File_Fold_Auto_Close=1  


" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp,./.tags,../.tags,../../.tags,../../../.tags,../../../../.tags

set tags=.tags;

" Configure path to include some paths
set path+=./include/,/usr/include/mpich/,/usr/include/c++/4.8/,

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"let g:AutoIBUS_disable=1 "disable autoibus


" Remapping Caps_Lock to Escape, when entering VIM.
function! MapCapslockToEscape()
	let l:a=system("/usr/bin/xmodmap -e \"clear Lock\" -e \"keycode 0x42 = Escape\"")
endfunction

function! ResetMapCapslock()
	let l:a=system('xmodmap -e "clear Lock" -e "keycode 0x42 = Caps_Lock"')
endfunction

"au VimEnter * call MapCapslockToEscape()
"au VimLeave * call ResetMapCapslock()

map fuck :%s/(DEMO VERSION!)//g<CR>
imap fuck <Esc>fucka

" set default register as system clipboard.
set clipboard+=unnamedplus
"set paste
" go=guioptions, a=autoselect.
set go+=a


" javacomplete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
" autocmd vimenter * NERDTree
map nerd :NERDTree<CR>

" sudo write
map sudow :w !sudo tee %<CR><CR>L<CR><CR>

" switch header/source files.
map <F7> :A<CR>
set laststatus=2

" verticall center the line in the window: zz
" <C-D> based on 'scroll', which equals to the half of height of window
"
" half-page scroll
map ,j <C-D>zz
map ,k <C-U>zz

" jump base on cursor position, used to jump back the prevous position.
" Ctrl-I : to newer cursor
" Ctrl-O : to older curosr
" '' : jump between the last position.
"
" Base on tags, used to track the call stack of function.
" Ctrl-] : to the tag
" Ctrl-T : to the older tag

" about the movement in text
" 1. word
"	w: begining of next word, W: based on white space.
" 2. back 
"	b: prvous beginning of wor, B: based on white space
" 3. ending
"	e: end of word, E: base on white space
"
" round the window:
" H: the higher line.
" M: middle line.
" L: the lower line. 
"
