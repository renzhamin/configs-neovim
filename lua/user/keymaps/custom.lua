local ks = vim.keymap.set


local function toggle_sidebar()
    local main_win_size = require("user.options").custom_options.main_win_size or 76

    if vim.fn.winwidth(0) > main_win_size then
        vim.cmd("vert res" .. main_win_size)
        vim.cmd("hi VertSplit guifg=#444444")
    else
        vim.cmd("vert res 200")
        vim.cmd("hi VertSplit guifg=bg")
    end
end

local function set_input_output_in_sidebar()
    local codes_dir = require("user.code-runner.options").codes_dir
    local current_win = vim.api.nvim_get_current_win()

    local input_file = codes_dir .. "/Input.txt"
    local output_file = codes_dir .. "/Output.txt"

    vim.cmd("vsp " .. input_file)
    vim.cmd("sp " .. output_file)

    vim.api.nvim_set_current_win(current_win)
    toggle_sidebar()
end

local function populate_input_file()
    local bin_dir = require("user.code-runner.options").bin_dir
    vim.cmd("silent !xclip -sel clip -o > " .. bin_dir .. "/Input.txt")
end

local function copy_output_file()
    local bin_dir = require("user.code-runner.options").bin_dir
    vim.cmd("silent !xclip -sel clip " .. bin_dir .. "/Output.txt")
end

ks('n', '<A-\\>', toggle_sidebar)
ks('n', '<Leader>io', set_input_output_in_sidebar)

ks({ 'n', 'i' }, '<F4>', populate_input_file)
ks('n', '<F3>', copy_output_file)
