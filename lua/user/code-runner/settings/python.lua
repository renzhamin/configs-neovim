local M = {}

M.get_run_command = function()
    return "python " .. vim.fn.expand("%:p")
end


return M
