return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        config = function()
            require("nvim-tree").setup({
                view = {
                    relativenumber = true,
                    width = {
                        max = "40%"
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                diagnostics = {
                    enable = true,
                },
                filters = {
                    custom = { "^.git$" }
                }
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
        event = "VeryLazy",
        opts = require("user.config.comment")
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
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
            ts.setup(require("user.config.telescope"))
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
        event = "VeryLazy",
        config = function()
            require("yanky").setup()
            require("user.keymaps.yanky")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            exclude = {
                filetypes = {
                    "help",
                    "lazy",
                    "mason",
                    "NvimTree",
                },
            },
        },
        main = "ibl",
    }
}
