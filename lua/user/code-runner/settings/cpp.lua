local opt = require("user.code-runner.options")


local M = {}

local compile_command = string.format("g++ -I %s/include ${CPP_COMPILE_FLAGS} -o Program ", opt.codes_dir)

M.get_compile_command = function()
    local filename = vim.fn.expand("%")
    return compile_command .. filename
end

M.get_run_command = function()
    return string.format("%s %d %d ./Program", opt.timing_command, opt.timeout, opt.timeout)
    --     return "./Program"
end

return M
