local ks = vim.keymap.set
local dg = vim.diagnostic

ks('n', '<Leader>de', function() dg.enable() end)
ks('n', '<Leader>dd', function() dg.disable() end)
ks('n', '<Leader>dbe', function() dg.enable(0) end)
ks('n', '<Leader>dbd', function() dg.disable(0) end)

ks('n', 'dg', dg.open_float)
ks('n', '[d', dg.goto_prev)
ks('n', ']d', dg.goto_next)
ks('n', '<Leader>dq', dg.setloclist)

ks('n', '<Leader>dve', function()
    dg.config({ virtual_text = true })
end)

ks('n', '<Leader>dvd', function()
    dg.config({ virtual_text = false })
end)
