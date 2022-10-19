local get_runner = function()
    local ft = "user.code-runner.settings." .. vim.bo.filetype
    local ok, runner = pcall(require, ft)
    return ok, runner
end

local M = {}

M.run = function()
    local ok, runner = get_runner()

    if not ok then
        vim.notify("Not Implemented")
        return
    end

    M.compile()

    local run_command = runner.get_run_command()
    if (runner.get_run_command) then
        --         local output = vim.cmd("!" .. run_command)
        local output = vim.api.nvim_exec("!" .. run_command, true)
        print(output)
    end
end

M.compile = function()
    local ok, runner = get_runner()

    if not ok then
        vim.notify("Not Implemented")
        return
    end

    local compile_command = runner.get_compile_command()
    vim.cmd("!" .. compile_command)
end


return M
