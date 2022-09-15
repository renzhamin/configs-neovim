let g:LanguageServerName = "java"
let g:LanguageServerEnablerKey = "java.enabled"
let g:compile_cur_file="!javac % -d " . g:codesdir
let g:run_program="!/usr/bin/time -f '\\%es\\t\\%Mkb' " . "timeout -k 3 2 java %:t:r"
let g:run_program_in_term="!alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c \"" . g:run_program[1:] . ";read\""

map <silent><F8> :call coc#config('java.enabled', 1) \| CocRestart <CR>
