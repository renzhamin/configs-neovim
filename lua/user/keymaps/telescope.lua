local builtins = require("telescope.builtin")

local prefix = "<Leader>t"

local ks = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, prefix .. lhs, rhs, opts)
end

ks('n', 'f', builtins.find_files)
ks('n', 'lg', builtins.live_grep)
ks('n', 'b', builtins.builtin)
