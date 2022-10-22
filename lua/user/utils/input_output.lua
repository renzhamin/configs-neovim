local M = {}

M.show_sidebar = function()
    local main_win_size = require("user.options").custom_options.main_win_size or 76
    vim.cmd("vert res" .. main_win_size)
    vim.cmd("hi VertSplit guifg=#444444")
end

M.hide_sidebar = function()
    vim.cmd("vert res 200")
    vim.cmd("hi VertSplit guifg=bg")
end

M.set_input_output_in_sidebar = function()
    local bin_dir = require("user.code-runner.options").bin_dir
    local current_win = vim.api.nvim_get_current_win()

    local input_file = bin_dir .. "/Input.txt"
    local output_file = bin_dir .. "/Output.txt"

    vim.cmd("vsp " .. input_file)
    vim.cmd("sp " .. output_file)

    vim.api.nvim_set_current_win(current_win)

    M.hide_sidebar()
end

M.toggle_sidebar = function()
    local main_win_size = require("user.options").custom_options.main_win_size or 76

    if vim.fn.winwidth(0) > main_win_size then
        if vim.bo.filetype == "cpp" and vim.fn.bufwinnr("Output.txt") == -1 then
            M.set_input_output_in_sidebar()
        end
        M.show_sidebar()
    else
        M.hide_sidebar()
    end
end

M.populate_input_file = function()
    local bin_dir = require("user.code-runner.options").bin_dir
    vim.cmd("silent !xclip -sel clip -o > " .. bin_dir .. "/Input.txt")
end

M.copy_output_file = function()
    local bin_dir = require("user.code-runner.options").bin_dir
    vim.cmd("silent !xclip -sel clip " .. bin_dir .. "/Output.txt")
end

return M
