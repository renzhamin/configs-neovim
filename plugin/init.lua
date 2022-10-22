local opt = vim.opt
local options = require("user.options").vim_options


for k, v in pairs(options) do
    opt[k] = v
end

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("user")

require("which-key").setup {
    plugins = {
        marks = false,
        registers = false,
    }
}
