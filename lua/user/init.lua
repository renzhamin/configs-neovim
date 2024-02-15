local opt = vim.opt
local options = require("user.options").vim_options

for k, v in pairs(options) do
    opt[k] = v
end

vim.filetype.add({
    filename = {
        [".env"] = "conf",
    },
    pattern = {
        ["%.env%.[%w_.-]+"] = "conf",
    },
})

require("user.keymaps")
