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

    vim.cmd("silent w!")

    local output = vim.api.nvim_exec("!" .. compile_command, true) or " "

    ok = vim.v.shell_error == 0

    return ok, output
end

local run = function(suffix)
    local ok, runner

    ok, runner = get_runner()

    if not ok then
        vim.notify("Not Implemented")
        return
    end

    local output = " "

    if runner.get_compile_command then
        ok, output = M.compile()

        if not ok then
            vim.notify(output)
            return
        end
    else
        vim.cmd("silent w!")
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

local run_factory = function(suffix)
    local redirection = suffix or " "
    return function()
        run(redirection)
    end
end

M.run = run_factory()
M.run_with_file_output = run_factory(" > Output.txt")
M.run_with_file_input = run_factory(" < Input.txt")
M.run_with_file_input_output = run_factory(" < Input.txt > Output.txt")
M.run_with_file_input_output_append = run_factory(" < Input.txt >> Output.txt")
M.run_with_file_input_output_stderr = run_factory(" < Input.txt &> Output.txt")


return M
