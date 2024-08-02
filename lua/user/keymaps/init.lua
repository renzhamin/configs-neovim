require("user.keymaps.general")
require("user.keymaps.lsp")
require("user.keymaps.code-runner")
require("user.keymaps.custom")
require("user.keymaps.colors")
require("user.keymaps.telescope")


local wk = require("which-key")


wk.add({
    { "<Leader>;", group = "Harpoon" },
    { "<Leader>h", group = "Gitsigns" },
    { "<Leader>s", group = "Sed" },
    { "<Leader>t", group = "Telescope" },
})
