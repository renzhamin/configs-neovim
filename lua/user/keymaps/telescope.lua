local builtins = require("telescope.builtin")

local prefix = "<Leader>t"

local ks = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, prefix .. lhs, rhs, opts)
end

ks('n', 'f', builtins.find_files, { desc = "find files" })
ks('n', 'sf', builtins.grep_string, { desc = "fuzzy search" })
ks('n', 'lg', builtins.live_grep, { desc = "live grep" })
ks('n', 'a', builtins.builtin, { desc = "builtins" })
ks('n', 'b', builtins.buffers, { desc = "buffers" })
ks('n', 'r', builtins.registers, { desc = "registers" })
