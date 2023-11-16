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


require("lazy").setup({
    spec = {
        {
            "sainnhe/gruvbox-material",
            config = false,
            --[[ priority = 1000, ]]
            --[[ config = function() ]]
            --[[     local hi = function(...) vim.api.nvim_set_hl(0, ...) end ]]
            --[[     vim.g.gruvbox_material_better_performance = 1 ]]
            --[[]]
            --[[     vim.cmd("colorscheme gruvbox-material") ]]
            --[[]]
            --[[     hi("CursorLineNr", { fg = "none" }) ]]
            --[[     hi("Search", { bg = "none", fg = "#8d93a1", underline = true }) ]]
            --[[ end, ]]
        },
        {
            "rebelot/kanagawa.nvim",
            priority = 1000,
            config = function()
                require('kanagawa').setup({
                    compile = true,
                    colors = {
                        theme = {
                            all = {
                                ui = {
                                    bg_gutter = "none",
                                }
                            }
                        }
                    },
                    overrides = function()
                        return {
                            Search = { bg = "none", underline = true },
                        }
                    end,
                    theme = "wave",
                })

                require("kanagawa").load("wave")
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
