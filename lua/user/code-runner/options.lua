local home = vim.fn.expand("~")

local M = {}

M.codes_dir = home .. "/Codes"

M.bin_dir = M.codes_dir .. "/X"

M.timeout = 3

M.timing_command = "/usr/bin/time -f '\\%es\\t\\%Mkb' " .. "timeout -k"

-- needs to close the "
M.run_in_terminal_command = "alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c \""

return M
