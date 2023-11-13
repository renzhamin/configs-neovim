local prefix = "<Leader>t"

local ks = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, prefix .. lhs, rhs, opts)
end

local function setup()
    local builtins = require("telescope.builtin")
    ks('n', 't', builtins.find_files, { desc = "find files" })
    ks('n', 'f', builtins.grep_string, { desc = "fuzzy search" })
    ks('n', 'g', builtins.live_grep, { desc = "live grep" })
    ks('n', 'a', builtins.builtin, { desc = "builtins" })
    ks('n', 'b', builtins.buffers, { desc = "buffers" })
    ks('n', 'r', builtins.registers, { desc = "registers" })
    ks('n', 'y', ':Telescope yank_history<CR>', { desc = "yank history" })
end

return setup
