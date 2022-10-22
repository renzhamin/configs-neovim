local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("FocusGained", {
    pattern = "*",
    command = "checktime"
})

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
        vim.opt.guicursor = "a:ver100"
    end
})
