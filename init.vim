let g:mapleader = ','
let g:codesdir = $HOME . "/Codes"
let g:bindir = g:codesdir . "/X"
filetype off
filetype plugin indent on

"Colors for nonprogramming or config files
let ftToIgnore = ['cpp', 'python', 'java', 'typescript', 'javascript']
autocmd VimEnter * if index(ftToIgnore, &ft) < 0  | call Defaultcolor()


autocmd FileType * setlocal formatoptions-=cro

" set path+=**

" autoreload file if its changed
autocmd Focusgained * checktime
autocmd VimLeave * set guicursor=a:ver100

let &winminwidth=0
let &winminheight=0

let g:MainWindowSize = 76

fu Ftog()
    if winwidth(0) > g:MainWindowSize
        exe "vert res" . g:MainWindowSize  | hi VertSplit guifg=#444444
    else
        vert res 200 | hi VertSplit guifg=bg
    endif
endfu

" hi VertSplit guifg=bg

map <silent> <A-f> :MaximizerToggle <CR>
map <silent> <A-\> :call Ftog()<CR>


fu! SetIO()
    exe ":vs".g:codesdir."/Input.txt"|exe ":sp".g:codesdir."/Output.txt"
endfu

map <silent> <Leader>io :call SetIO()<CR><C-h><A-\>

" Hop

" hi HopNextKey1 guifg=Cyan
" hi HopNextKey2 guifg=LightBlue
" hi HopNextKey guifg=Violet

map <Leader><Leader> <CMD>HopWord<CR>
map <Leader>j <CMD>HopChar1<CR>


"Emmet
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<A-.>'

" Copy/Paste Output/Input
fu UpdateInput()
    exe "silent !xclip -o -sel clip > " . g:bindir . "/Input.txt"
endfu

fu CopyOutput()
    exe "silent !xclip -sel clip " . g:bindir . "/Output.txt"
endfu

map<silent><F4> :call UpdateInput() <CR>
map<silent><F3> :call CopyOutput() <CR>


"IO
" imap <F12> <Esc> :call Compile_Generic(0) <CR>
" map <F12> :call Compile_Generic(0) <CR>

"Input Only
" imap<F9> <Esc> :call Compile_Generic(2) <CR>
" map <F9> :call Compile_Generic(2) <CR>

lua require'hop'.setup()
