local ks = vim.keymap.set
local runner = require("user.code-runner")

local modes = { 'n', 'i' }

ks(modes, '<F9>', runner.run_with_file_input)
ks(modes, '<F11>', runner.run_with_file_input_output_stderr)
ks(modes, '<F12>', runner.run_with_file_input_output)
