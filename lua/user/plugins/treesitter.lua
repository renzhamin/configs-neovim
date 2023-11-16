return {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    opts = require("user.config.treesitter"),
    config = function()
        require("nvim-treesitter.configs").
            setup(require("user.config.treesitter"))
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
        {
            url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
            name = "rainbow-delimiters",
            config = function()
                require("user.config.rainbow_delimiters")
            end
        },
        "JoosepAlviste/nvim-ts-context-commentstring",
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
