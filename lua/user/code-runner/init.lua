local opt = require("user.code-runner.options")

local get_runner = function()
    local ft = "user.code-runner.settings." .. vim.bo.filetype
    local ok, runner = pcall(require, ft)
    return ok, runner
end

local M = {}

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

local run = function(suffix)
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


    if not runner.get_run_command then
        return
    end

    local run_command = runner.get_run_command() .. suffix

    vim.api.nvim_set_current_dir(opt.bin_dir)

    output = output .. vim.api.nvim_exec("!" .. run_command, true)
    vim.notify(output)

    vim.cmd("silent cd -")
end

local runner_factory = function(suffix)
    local redirection = suffix or " "
    return function(suffix)
        run(redirection)
    end
end

M.run = runner_factory()
M.run_with_file_output = runner_factory(" > Output.txt")
M.run_with_file_input = runner_factory(" < Input.txt")
M.run_with_file_input_output = runner_factory(" < Input.txt > Output.txt")
M.run_with_file_input_output_append = runner_factory(" < Input.txt >> Output.txt")
M.run_with_file_input_output_stderr = runner_factory(" < Input.txt &> Output.txt")


return M
