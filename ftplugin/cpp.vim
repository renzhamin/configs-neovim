let g:LanguageServerName = "clangd"
let g:LanguageServerEnablerKey = "clangd.enabled"
let g:cppversion="20"
let g:compile_command="!g++ -I " . g:codesdir .  "/include " . "-D LOCAL -D DBG_MACRO_NO_WARNING -fsanitize=undefined -o Program % --std=c++"
let g:timeout = "3"

map<Leader>lid :call coc#config("clangd.arguments", ["--header-insertion=never"]) \| CocRestart <CR>
map<Leader>lie :call coc#config("clangd.argmuents", ["--header-insertion=iwyu"]) \| CocRestart <CR>


fu! GetCompileCommand()
    return g:compile_command . g:cppversion
endfu

fu! GetRunProgramCommand()
    return g:timing_command . g:timeout . " " . g:timeout . " ./Program"
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


map <Leader><F12> :w \| !make &&./Program <CR>
