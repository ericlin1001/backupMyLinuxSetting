"to view all set options
":set all  or :browse set

syntax on
"<F5>`make`
map <F5> make
imap <F5> <Esc>make
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
map <F7> :TlistToggle<CR>

"<F8> Toggle between Header/Source files (.h/.cpp)
map <F8> :A<CR> 

"<F6> switch between windows
map <F6> <C-W><C-W>

"<Ctrl-F12> build tags
map <C-F12> :!ctags -f .tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

map tags <C-F12> <CR>

"other useful hot-keys.
map == gg=GG
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
set tags+=~/.vim/tags/cpp,./.tags,

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
