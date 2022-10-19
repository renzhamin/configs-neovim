local get_runner = function()
    local ft = "user.code-runner.settings." .. vim.bo.filetype
    local ok, runner = pcall(require, ft)
    return ok, runner
end

local M = {}

M.run = function(suffix)
    local ok, runner, output

    ok, runner = get_runner()

    if not ok then
        vim.notify("Not Implemented")
        return
    end

    ok, output = M.compile()

    if not ok then
        vim.notify(output)
        return
    end

    local redirection = suffix or ""

    local run_command = runner.get_run_command() .. redirection
    if (runner.get_run_command) then
        output = output .. vim.api.nvim_exec("!" .. run_command, true)
        vim.notify(output)
    end
end

M.compile = function()
    local ok, runner = get_runner()

    if not ok then
        vim.notify("Not Implemented")
        return
    end

    local compile_command = runner.get_compile_command()
    local output = vim.api.nvim_exec("!" .. compile_command, true)

    ok = vim.v.shell_error == 0

    return ok, output
end


return M
