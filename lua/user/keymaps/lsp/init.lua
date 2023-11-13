require("user.keymaps.lsp.diagnostic")

vim.keymap.set('n', '<Leader>le', ':LspRestart<CR>')
vim.keymap.set('n', '<Leader>ld', ':LspStop<CR>')
