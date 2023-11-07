local ks = vim.keymap.set

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

ks('n', '<Leader>ha', mark.add_file, { desc = "add current file" })
ks('n', '<Leader>hr', mark.rm_file, { desc = "remove current file" })
ks('n', '<Leader>hq', ui.toggle_quick_menu, { desc = "quick menu" })

ks('n', '<Leader>hn', ui.nav_next, { desc = "next marked file" })
ks('n', '<Leader>hp', ui.nav_prev, { desc = "previos marked file" })

for i = 1, 9, 1
do
    ks('n', '<Leader>h' .. i, function() ui.nav_file(i) end)
end
