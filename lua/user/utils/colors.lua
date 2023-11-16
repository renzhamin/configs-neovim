local M = {}

local hl_normal = vim.api.nvim_get_hl(0, { name = "Normal" })

M.toggle_transparency = function()
    local cur_normal = vim.api.nvim_get_hl(0, { name = "Normal" })

    if cur_normal.bg then
        hl_normal = cur_normal
        vim.cmd("hi Normal guibg=none")
    else
        vim.api.nvim_set_hl(0, "Normal", hl_normal)
    end
end


M.cycle_contrast = function(direction)
    local constrasts = { "material", "mix", "original" }

    direction = direction or 1

    local value = vim.g.gruvbox_material_foreground or "material"
    local ind = 0

    for i, v in ipairs(constrasts) do
        if v == value then
            ind = i - 1
            break
        end
    end

    ind = (ind + direction + 3) % 3 + 1
    value = constrasts[ind]

    vim.g.gruvbox_material_foreground = value
    vim.cmd("colorscheme gruvbox-material")
end

return M
