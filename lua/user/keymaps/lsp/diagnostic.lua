local ks = vim.keymap.set
local dg = vim.diagnostic

ks('n', '<Leader>dt',
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end, { desc = "toggle" })

ks('n', '<Leader>dbt',
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = 0 })
    end, { desc = "toggle [buffer]" })

ks('n', '<Leader>da',
    function()
        require("telescope.builtin").diagnostics()
    end, { desc = "show all diagnostic" })

ks('n', '[d', dg.goto_prev, { desc = "previous diagnostic" })
ks('n', ']d', dg.goto_next, { desc = "next diagnostic" })
ks('n', '<Leader>dq', dg.setloclist)

ks('n', '<Leader>dve', function()
    dg.config({ virtual_text = true })
end, { desc = "enable vtext" })

ks('n', '<Leader>dvd', function()
    dg.config({ virtual_text = false })
end, { desc = "disable vtext" })
