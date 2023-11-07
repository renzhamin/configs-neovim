require("user.keymaps.lsp.diagnostic")

vim.keymap.set('n', '<Leader>le', ':LspRestart<CR>')
vim.keymap.set('n', '<Leader>ld', ':LspStop<CR>')

vim.keymap.set('n', '<Leader>ltc', require("user.utils.completion").toggle_lsp,
    { desc = "toggle completion" })
