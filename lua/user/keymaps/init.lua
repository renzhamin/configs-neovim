vim.g.mapleader = ','

require("user.keymaps.general")
require("user.keymaps.lsp")
require("user.keymaps.code-runner")
require("user.keymaps.custom")
require("user.keymaps.colors")
require("user.keymaps.telescope")
require("user.keymaps.harpoon")


local wk = require("which-key")

wk.register({
    ["<Leader>"] = {
        s = {
            name = "Sed"
        },
        t = {
            name = "Telescope",
        },
        h = {
            name = "Harpoon"
        },
    }
})
