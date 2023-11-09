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
        opts = {
            view = {
                relativenumber = true,
            },

        },
    },
    "nvim-lua/plenary.nvim",

    "sainnhe/gruvbox-material",

    "numToStr/Comment.nvim",

    -- snippet engine
    "L3MON4D3/LuaSnip",

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


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

    "ThePrimeagen/harpoon",

    {
        "stevearc/aerial.nvim",
        lazy = true,
        opts = {
            layout = {
                max_width = .3
            }

        }
    },

    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup()
            require("user.keymaps.yanky")
        end
    }
}

local treesitter = require("user.lazy.treesitter")
local cmp = require("user.lazy.cmp")
local lsp = require("user.lazy.lsp")
local dap = require("user.lazy.dap")

local all_plugins = { general, treesitter, cmp, lsp, dap }

local plugins = {}

for _, p in ipairs(all_plugins) do
    table.insert(plugins, p)
end


require("lazy").setup(plugins)
