return {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    opts = require("user.plugins.treesitter"),
    config = function()
        require("nvim-treesitter.configs").
            setup(require("user.plugins.treesitter"))
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
        {
            url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
            name = "rainbow-delimiters",
            config = function()
                require("user.plugins.rainbow_delimiters")
            end
        },
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-context"
    }
}
