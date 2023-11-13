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


local general = {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        config = function()
            require("nvim-tree").setup({
                view = {
                    relativenumber = true,
                },
            })
        end,
        init = function()
            if vim.fn.argc(-1) == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("nvim-tree")
                end
            end
        end,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

    "sainnhe/gruvbox-material",

    {
        "numToStr/Comment.nvim",
        opts = require("user.plugins.comment")
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        lazy = true,
        keys = require("user.keymaps.telescope"),
        config = function()
            local ts = require("telescope")
            ts.setup(require("user.plugins.telescope"))
            ts.load_extension('fzf')
            ts.load_extension('yank_history')
        end,
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
    },


    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                plugins = {
                    marks = false,
                    registers = false,
                }
            }
        end
    },

    {
        "zbirenbaum/copilot.lua",
        lazy = true
    },

    {
        "ThePrimeagen/harpoon",
        lazy = true,
        keys = require("user.keymaps.harpoon")
    },

    {
        "stevearc/aerial.nvim",
        lazy = true,
        opts = {
            layout = {
                max_width = .3
            }

        },
        keys = {
            {
                '<M-a>',
                function()
                    require("aerial").toggle({ direction = "left" })
                end,
                desc = { "Aerial view" }
            }
        }
    },

    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup()
            require("user.keymaps.yanky")
        end
    },
}

local treesitter = require("user.lazy.treesitter")
local cmp = require("user.lazy.completion")
local lsp = require("user.lazy.lsp")
local dap = require("user.lazy.dap")
local gs = require("user.lazy.gitsigns")

local all_plugins = { general, treesitter, cmp, lsp, dap, gs }

local plugins = {}

for _, p in ipairs(all_plugins) do
    table.insert(plugins, p)
end

require("lazy").setup(plugins, {
    changed_detection = {
        enabled = false
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
