local opt = require("user.code-runner.options")


local M = {}

M.flags = [[-D LOCAL -D DBG_MACRO_NO_WARNING -D_GLIBCXX_DEBUG --std=c++20 -Wall -Wno-unused-variable -Wshadow -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -fsanitize=undefined -fno-sanitize-recover -fstack-protector]]

if vim.fn.has('win32') == 1 then
    M.flags = [[-D LOCAL -D DBG_MACRO_NO_WARNING -Wall -Wshadow -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -fno-sanitize-recover -fstack-protector]]
end

M.precompile_dbg_command = string.format("g++ -x c++-header %s %s/include/dbg.h", M.flags, opt.codes_dir)

M.compile_command = string.format("g++ -I %s/include %s -o %s/Program", opt.codes_dir, M.flags, opt.bin_dir)

M.get_run_command = function()
    return string.format("%s %s %s %s/Program", opt.timing_command, opt.timeout, opt.timeout, opt.bin_dir)
end

M.precompile_dbg = function()
    local output = vim.api.nvim_exec("! " .. M.precompile_dbg_command, true)
    if vim.v.shell_error ~= 0 then
        vim.notify(output)
    end
end

return M
