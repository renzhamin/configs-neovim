filetype off
filetype plugin indent on

" let ftToIgnore = ['cpp', 'python', 'java', 'typescript', 'javascript']
" autocmd VimEnter * if index(ftToIgnore, &ft) < 0  | call Defaultcolor()


" set path+=**

" autoreload file if its changed
autocmd Focusgained * checktime
autocmd VimLeave * set guicursor=a:ver100


" hi VertSplit guifg=bg
