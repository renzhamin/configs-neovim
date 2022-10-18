require("user.keymaps.lsp.diagnostic")

vim.keymap.set('n', '<Leader>le', ':LspStart<CR>')
vim.keymap.set('n', '<Leader>ld', ':LspStop<CR>')
