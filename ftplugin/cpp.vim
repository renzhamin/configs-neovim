let g:LanguageServerName = "clangd"
let g:LanguageServerEnablerKey = "clangd.enabled"
let g:cppversion="20"
let g:compile_command="!g++ -D LOCAL -D DBG_MACRO_NO_WARNING -fsanitize=undefined -o Program % --std=c++"
let g:compile_cur_file=g:compile_command . g:cppversion
let g:timeout = "3"
let g:run_program="!/usr/bin/time -f '\\%es\\t\\%Mkb' " . "timeout -k " . g:timeout . " " . g:timeout . " ./Program"
let g:run_program_in_term="!alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c \"" . g:run_program[1:] . ";read\""



"IO+stderr
imap <F11> <Esc> :call Compile_Generic() <CR>
map <F11> :call Compile_Generic() <CR>
"Input+terminal
imap <F10> <Esc> :call Compile_Generic(1) <CR>
map <F10> :call Compile_Generic(1) <CR>
"Input+Append
imap <F7> <Esc> :call Compile_Generic(3) <CR>
map <F7> :call Compile_Generic(3) <CR>


map <Leader>m :w \| !make &&./Program <CR>
