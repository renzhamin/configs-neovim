let g:LanguageServerName = "pyright"
let g:LanguageServerEnablerKey = "pyright.enable"

fu! PY3(...)
    exe "w"
    cd `=g:codesdir`
    if a:0 == 0
        !python3 % &>Output.txt<Input.txt 
    elseif a:1 == 0
        !python3 % >Output.txt<Input.txt 
    elseif a:1 == 1
        !python3 % <Input.txt 
    elseif a:1 == 2
        !gnome-terminal -- bash -c "python3 %;read"
    elseif a:1 == 3
        !python3 %
    endif
    cd -
endfu

imap <F12> <Esc> :call PY3(0) <CR>
map <F12> <Esc> :call PY3(0) <CR>
map <F10> :call PY3(2) <CR>
imap <F10> <Esc> :call PY3(2) <CR>
map <F11> :call PY3() <CR>
imap <F11> <Esc> :call PY3() <CR>
map <F9>  :call PY3(1) <CR>
imap <F9> <Esc> :call PY3(1) <CR>
map <F7>  :call PY3(3) <CR>
imap <F7> <Esc> :call PY3(3) <CR>
