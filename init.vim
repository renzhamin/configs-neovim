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

let g:timing_command = "!/usr/bin/time -f '\\%es\\t\\%Mkb' " . "timeout -k " 
let g:run_in_term_command = "!alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c \"" 

" Generic Compilation
fu! Compile_Generic(...)
    exe "w"
    
    cd `=g:bindir`

    let compile_cur_file = GetCompileCommand()
    exe compile_cur_file
    
    if v:shell_error != 0
        cd -
        return
    endif

    let run_program = GetRunProgramCommand()
    let run_program_in_term = GetRunProgramInTermCommand()

    if a:0 == 0
        exe run_program . "<Input.txt &> Output.txt"
    elseif a:1 == 0
        exe run_program . "<Input.txt > Output.txt"
    elseif a:1 == 1
        exe run_program_in_term
    elseif a:1 == 2
        exe run_program . "<Input.txt"
    elseif a:1 == 3
        exe run_program . "<Input.txt >> Output.txt"
    endif
    
    if index( [124,125,137], v:shell_error ) >= 0
        silent exe "!echo 'TLE' > Output.txt"
    endif
    cd -
endfu

"IO
" imap <F12> <Esc> :call Compile_Generic(0) <CR>
" map <F12> :call Compile_Generic(0) <CR>

"Input Only
" imap<F9> <Esc> :call Compile_Generic(2) <CR>
" map <F9> :call Compile_Generic(2) <CR>

lua require'hop'.setup()
