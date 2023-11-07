local ks = vim.keymap.set
local silent = { silent = true }

ks('', '<M-e>', ':NvimTreeToggle<CR>')

-- Copying to the system clipboard
ks('v', '<C-c>', '"+y')

ks('t', '<Esc>', '<C-\\><C-n>')

-- Sed
ks('', '<Leader>sr', ':s///g<Left><Left><Left>', { desc = "search and replace" })
ks('', '<Leader>sR', ':%s///g<Left><Left><Left>', { desc = "search and replace %" })
ks('', '<leader>sw', ':s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>', { desc = "replace current word" })
ks('', '<leader>sW', ':%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>', { desc = "replace current word %" })
ks('', '<leader>sc', ':s/<C-r><C-0>/<C-r><C-0>/g<Left><Left><Left>', { desc = "replace current clipboard" })
ks('', '<leader>sC', ':%s/<C-r><C-0>/<C-r><C-0>/g<Left><Left><Left>', { desc = "replace current clipboard %" })
ks('', '<leader>ss', 'y:s/<C-r><C-0>/<C-r><C-0>/g<Left><Left><Left>', { desc = "replace current selection" })
ks('', '<leader>sS', 'y:s/<C-r><C-0>/<C-r><C-0>/g<Left><Left><Left>', { desc = "replace current selection %" })


-- Quiting
ks('', '<Leader>q', ':q!<CR>', silent)
ks('', '<Leader>Q', ':qa!<CR>', silent)

-- Writing
ks('', '<Leader>w', ':w!<CR>')
ks('', '<Leader>W', ':wq!<CR>')

-- Ctrl-Alt-k/j move current line up and down
ks('n', '<C-A-j>', ':m .+1<CR>==', silent)
ks('i', '<C-A-j>', '<Esc>:m .+1<CR>==gi', silent)

ks('n', '<C-A-k>', ':m .-2<CR>==', silent)
ks('i', '<C-A-k>', '<Esc>:m .-2<CR>==gi', silent)

ks('v', '<C-A-j>', ":m '>+1<CR>gv=gv", silent)
ks('v', '<C-A-k>', ":m '<-2<CR>gv=gv", silent)
---------------------------------------------------------


-- Clear highlighting after these keypresses
for _, c in ipairs({ 'a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O', '<Esc>' }) do
    ks('n', c, ':noh<CR>' .. c, silent)
end


-- useful when multiple filetypes are in buffer
ks('n', '<F5>', ':exe "set ft=".&ft<CR>', silent)

-- indent whole file
ks('n', '<Leader>ii', 'gg=G<C-o>')
