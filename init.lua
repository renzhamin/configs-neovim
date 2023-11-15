vim.g.mapleader = ','

local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("FocusGained", {
    pattern = "*",
    command = "checktime"
})

create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:ver100"
})

require("user.lazy")
require("user")
