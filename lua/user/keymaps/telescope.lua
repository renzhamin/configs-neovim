local builtins = require("telescope.builtin")

local prefix = "<Leader>t"

local ks = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, prefix .. lhs, rhs, opts)
end

ks('n', 'f', builtins.find_files, { desc = "find files" })
ks('n', 'g', builtins.live_grep, { desc = "live grep" })
ks('n', 'b', builtins.builtin, { desc = "show builtins" })
