local ks = vim.keymap.set
local dg = vim.diagnostic

ks('n', '<Leader>de', function() dg.enable() end, { desc = "enable" })
ks('n', '<Leader>dd', function() dg.disable() end, { desc = "disable" })
ks('n', '<Leader>dbe', function() dg.enable(0) end, { desc = "enable [buffer]" })
ks('n', '<Leader>dbd', function() dg.disable(0) end, { desc = "disable [buffer]" })

ks('n', '<Leader>dg', dg.open_float, { desc = "show diagnostic in current Line" })
ks('n', '<Leader>da',
    function ()
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
