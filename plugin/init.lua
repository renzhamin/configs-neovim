local opt = vim.opt
local options = require("user.options")


for k, v in pairs(options) do
    opt[k] = v
end

require("user.plugins")
