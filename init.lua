vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

local create_autocmd     = vim.api.nvim_create_autocmd

create_autocmd("FocusGained", {
    pattern = "*",
    command = "checktime"
})

create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:ver100"
})

require("user.lazy")

local opt = vim.opt
local options = require("user.options").vim_options


for k, v in pairs(options) do
    opt[k] = v
end

require("user")
