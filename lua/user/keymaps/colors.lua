local ks = vim.keymap.set


local toggle_transparency = function()
    local cur_value = vim.g.gruvbox_material_transparent_background or 0

    if cur_value == 0 then
        vim.g.gruvbox_material_transparent_background = 2
    else
        vim.g.gruvbox_material_transparent_background = 0
    end

    vim.cmd("colorscheme gruvbox-material")
end


local cycle_contrast = function(direction)
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


ks('n', '<Leader>ctt', toggle_transparency)
ks('n', '<Leader>ccc', cycle_contrast)
