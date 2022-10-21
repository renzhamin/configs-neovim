local ks = vim.keymap.set


--Copying and Cutting to the system clipboard
ks('v', '<C-c>', '"+y')
ks('v', '<C-x>', '<C-c>gvd', { remap = true })

-- tnoremap <Esc> <C-\><C-n>

--Search and replace
ks('', '<Leader>sr', ':s///g' .. string.rep('<Left>', 3))

--move between windows
--[[ for _, k in pairs({ 'h', 'l', 'j', 'k' }) do ]]
--[[     -- map <C-k> to <C-w>k ]]
--[[     ks('n', '<C-' .. k .. '>', '<C-w>' .. k) ]]
--[[ end ]]

-- Quiting
ks('', '<Leader>q', ':q!<CR>')
ks('', '<Leader>Q', ':qa!<CR>')

-- Writing
ks('', '<Leader>w', ':w!<CR>')
ks('', '<Leader>W', ':wq!<CR>')

--Ctrl-Alt-k/j move current line up and down
ks('n', '<C-A-j>', ':m .+1<CR>==', { silent = true })
ks('i', '<C-A-j>', '<Esc>:m .+1<CR>==gi', { silent = true })

ks('n', '<C-A-k>', ':m .-2<CR>==', { silent = true })
ks('i', '<C-A-k>', '<Esc>:m .-2<CR>==gi', { silent = true })

ks('v', '<C-A-j>', ":m '>+1<CR>gv=gv", { silent = true })
ks('v', '<C-A-k>', ":m '<-2<CR>gv=gv", { silent = true })
---------------------------------------------------------


for _, c in ipairs({ 'a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O', '<Esc>' }) do
    --     exe 'nnoremap <silent>' . s:c . ' :noh<CR>' . s:c
    vim.keymap.set('n', c, ':noh<CR>' .. c, { silent = true })
end


-- useful when multiple filetypes are in buffer
ks('n', '<F5>', ':exe "set ft=".&ft<CR>', { silent = true })

-- indent whole file
ks('n', '<Leader>ii', 'gg=G<C-o>')
