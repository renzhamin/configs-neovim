local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local hi = function(...) vim.api.nvim_set_hl(0, ...) end

require("lazy").setup({
    spec = {
        {
            "sainnhe/gruvbox-material",
            priority = 1000,
            config = function()
                vim.g.gruvbox_material_better_performance = 1

                vim.cmd [[colorscheme gruvbox-material]]

                hi("CursorLineNr", { fg = "none" })
                hi("Search", { bg = "none", fg = "#8d93a1", underline = true })
            end
        },
        { import = "user.plugins" }
    },
    changed_detection = {
        enabled = false,
        notify = false
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true,      -- reset the runtime path to $VIMRUNTIME and your config directory
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
