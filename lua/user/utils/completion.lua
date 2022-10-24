local M = {}

local cmp = require("cmp")
local get_config = cmp.get_config


M.toggle = function(name, args)

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
        target_source = args
        target_source.name = name
        table.insert(new_sources, target_source)
    end

    cmp.setup.filetype(vim.bo.filetype, { sources = new_sources })

end

M.toggle_lsp = function()
    M.toggle("nvim_lsp", { priority = 15, keyword_length = 4, max_item_count = 4 })
end

return M
