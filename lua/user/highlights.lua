local hi = function(...) vim.api.nvim_set_hl(0, ...) end

hi("CursorLineNr", {fg="none"})
hi("Search", { bg="none", fg="#8d93a1", underline=true })
hi("snipLeadingSpaces", {fg = bg})
-- hi("HopNextKey", {fg="Violet"})
-- hi("HopNextKey1", {fg="cyan"})
-- hi("HopNextKey2", {fg="LightBlue"})

local bg_color = vim.api.nvim_get_hl_by_name("Normal", true).background
hi("VertSplit", {cterm = {}, fg=bg_color })
