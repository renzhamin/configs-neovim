local home = vim.fn.expand("~")

local M = {}

M.codes_dir = home .. "/Codes"

M.bin_dir = M.codes_dir .. "/X"

M.timeout = 3

M.timing_command = "/usr/bin/time -f '\\%es\\t\\%Mkb' " .. "timeout -k"


return M
