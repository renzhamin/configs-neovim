return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPost", "BufNewFile" },
        config = require("user.lsp.setup"),
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "ray-x/lsp_signature.nvim",
            {
                'stevearc/conform.nvim',
                opts = {},
                config = function()
                    require("conform").setup({
                        format_on_save = {
                            timeout_ms = 500,
                            lsp_format = "fallback",
                        },
                        formatters_by_ft = {
                            lua = { "stylua" },
                            python = { "isort", "black" },
                            javascript = { "prettierd", "prettier", stop_after_first = true },
                            typescript = { "prettierd", "prettier", stop_after_first = true },
                        },
                    })
                end
            }
        },
    },
}
