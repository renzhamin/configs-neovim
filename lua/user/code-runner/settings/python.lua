local M = {}

local compile_command = string.format("python3 ")

M.get_run_command = function()
    local filename = vim.fn.expand("%:p")
    return compile_command .. filename
end

return M
