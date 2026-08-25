return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            config = function()
                local function set_select_mapping(key, object)
                    vim.keymap.set({ "x", "o" }, key, function()
                        require "nvim-treesitter-textobjects.select".select_textobject(object, "textobjects")
                    end)
                end

                set_select_mapping("am", "@function.outer")
                set_select_mapping("im", "@function.inner")
                set_select_mapping("ac", "@class.outer")
                set_select_mapping("ic", "@class.inner")

                local function set_norm_mapping(key, fn)
                    vim.keymap.set({ "n", "x", "o" }, key, fn)
                end
                local function set_goto_mapping(key, object)
                    set_norm_mapping("]" .. key, function()
                        require("nvim-treesitter-textobjects.move").goto_next_start(object, "textobjects")
                    end)
                    set_norm_mapping("]" .. key:upper(), function()
                        require("nvim-treesitter-textobjects.move").goto_next_end(object, "textobjects")
                    end)
                    set_norm_mapping("[" .. key, function()
                        require("nvim-treesitter-textobjects.move").goto_previous_start(object, "textobjects")
                    end)
                    set_norm_mapping("]" .. key:upper(), function()
                        require("nvim-treesitter-textobjects.move").goto_previous_end(object, "textobjects")
                    end)
                end

                set_goto_mapping('m', '@function.outer')
            end,
        },
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
        {
            url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
            name = "rainbow-delimiters",
            config = function()
                require("user.config.rainbow_delimiters")
            end
        },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            config = function()
                vim.g.skip_ts_context_commentstring_module = true
                require('ts_context_commentstring').setup()
            end
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            keys = {
                {
                    '[-',
                    function()
                        require("treesitter-context").go_to_context()
                    end,
                    mode = 'n',
                    desc = "go to context"
                }
            }
        }
    }
}
