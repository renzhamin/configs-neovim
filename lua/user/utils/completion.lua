local M = {}

local cmp = require("cmp")
local get_config = cmp.get_config


M.toggle = function(name, group_index)

    local new_sources = {}
    local target_source = nil

    for _, source in ipairs(get_config().sources) do
        if source.name ~= name then
            table.insert(new_sources, source)
        else
            target_source = source
        end
    end

    if not target_source then
        table.insert(new_sources, { name = name, group_index = group_index })
    end

    cmp.setup.filetype(vim.bo.filetype, { sources = new_sources })

end

M.toggle_lsp = function()
    M.toggle("nvim_lsp", 1)
end

return M
