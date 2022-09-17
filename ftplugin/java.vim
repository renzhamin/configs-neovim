let g:LanguageServerName = "java"
let g:LanguageServerEnablerKey = "java.enabled"
let g:timeout = "5"

fu! GetCompileCommand()
    return "!javac % -d " . g:bindir
endfu

fu! GetRunProgramCommand()
    return g:timing_command . g:timeout . " " . g:timeout . " java %:t:r"
endfu

fu! GetRunProgramInTermCommand()
    let run_program = GetRunProgramCommand()
    return g:run_in_term_command . run_program[1:] . ";read\""
endfu


"IO+stderr
imap <F11> <Esc> :call Compile_Generic() <CR>
map <F11> :call Compile_Generic() <CR>
"Input+terminal
imap <F10> <Esc> :call Compile_Generic(1) <CR>
map <F10> :call Compile_Generic(1) <CR>
"Input+Append
imap <F7> <Esc> :call Compile_Generic(3) <CR>
map <F7> :call Compile_Generic(3) <CR>

map <silent><F8> :call coc#config('java.enabled', 1) \| CocRestart <CR>
