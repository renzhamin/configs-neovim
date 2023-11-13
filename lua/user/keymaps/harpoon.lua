local function setup()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")
    local term = require("harpoon.term")

    local prefix = "<Leader>;"

    local ks = function(mode, lhs, rhs, opts)
        vim.keymap.set(mode, prefix .. lhs, rhs, opts)
    end

    ks('n', 'a', mark.add_file, { desc = "add current file" })
    ks('n', 'r', mark.rm_file, { desc = "remove current file" })
    ks('n', 'q', ui.toggle_quick_menu, { desc = "quick menu" })

    ks('n', ',', ui.nav_next, { desc = "next marked file" })
    ks('n', '.', ui.nav_prev, { desc = "previous marked file" })

    ks('n', ';', function() ui.nav_file(1) end,
        { desc = "go to mark 1" })

    for i = 1, 9, 1
    do
        ks('n', i, function() ui.nav_file(i) end,
            { desc = "go to mark " .. i })
    end

    ks('n', "'", function() term.gotoTerminal(1) end,
        { desc = "go to terminal 1" })

    for i, c in ipairs({ '<F1>', '<F2>', '<F3>', '<F4>' }) do
        ks('n', c, function() term.gotoTerminal(i) end,
            { desc = "go to terminal" .. i })
    end
end

return setup
