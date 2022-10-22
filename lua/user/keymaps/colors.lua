local ks = vim.keymap.set
local fns = require("user.utils.colors")


ks('n', '<Leader>ctt', fns.toggle_transparency, { desc = "toggle transparency" })
ks('n', '<Leader>ccc', fns.cycle_contrast, { desc = "cycle contrast" })
