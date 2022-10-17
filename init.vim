let g:codesdir=$HOME . "/Codes"
let g:bindir = g:codesdir . "/X"
filetype off
filetype plugin indent on

"Colors for nonprogramming or config files
colo gruvbox
let ftToIgnore = ['cpp', 'python', 'java', 'typescript', 'javascript']
autocmd VimEnter * if index(ftToIgnore, &ft) < 0  | call Defaultcolor()


autocmd FileType * setlocal formatoptions-=cro

" set path+=**

" autoreload file if its changed
autocmd Focusgained * checktime

" Clears highlighting after these commands
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O', '<Esc>']
    exe 'nnoremap <silent>' . s:c . ' :noh<CR>' . s:c
endfor

"Keymapings


"Copying and Cutting to the system clipboard
vmap <C-c> "+y
vmap <C-x> <C-c>gvd

let mapleader=','
tnoremap <Leader><Esc> <C-\><C-n>
" tnoremap <Esc> <C-\><C-n>

"Search and replace
map <Leader>sr :s///g<Left><Left><Left>

"move between windows
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <Leader>Q :qa!<CR>
map <Leader>q :q!<CR>
map <Leader>w :w!<CR>
map <Leader>W :wq!<CR>

"Ctrl-Alt-k/j move current line up and down
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv


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


snoremap ;; <C-j>

map <silent> <F5> :exe "set ft=".&ft <CR>

map<silent> <Leader>ii gg=G<C-o>

fu! SetIO()
    exe ":vs".g:codesdir."/Input.txt"|exe ":sp".g:codesdir."/Output.txt"
endfu

map <silent> <Leader>io :call SetIO()<CR><C-h><A-\>



map <Leader>de :lua vim.diagnostic.enable()<CR>
map <Leader>dd :lua vim.diagnostic.disable()<CR>

map <Leader>ld :LspStop<CR>
map <Leader>le :LspStart<CR>


" Hop

" hi HopNextKey1 guifg=Cyan
" hi HopNextKey2 guifg=LightBlue
" hi HopNextKey guifg=Violet

map <Leader><Leader> <CMD>HopWord<CR>
map <Leader>j <CMD>HopChar1<CR>


"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
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
imap <F12> <Esc> :call Compile_Generic(0) <CR>
map <F12> :call Compile_Generic(0) <CR>

"Input Only
imap<F9> <Esc> :call Compile_Generic(2) <CR>
map <F9> :call Compile_Generic(2) <CR>

lua require'hop'.setup()



"Lua snip 
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
"" -1 for jumping backwards.
" inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
" 
" snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" 
"" For changing choices in choiceNodes (not strictly necessary for a basic setup).
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
