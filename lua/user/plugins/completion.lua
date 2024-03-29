return {
    "hrsh7th/nvim-cmp",
    version = false,
    lazy = true,
    event = "InsertEnter",
    config = require("user.completion"),
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    }
}
