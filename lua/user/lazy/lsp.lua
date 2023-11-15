return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = require("user.lsp.setup"),
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "ray-x/lsp_signature.nvim",
            {
                "nvimtools/none-ls.nvim",
                config = function()
                    local null_ls = require("null-ls")
                    local args = require("user.plugins.null-ls")
                    local format_sources = require("user.formatting").sources

                    args.sources = args.sources or {}

                    for _, source in ipairs(format_sources) do
                        table.insert(args.sources, null_ls.builtins.formatting[source.name].with({
                            filetypes = source.filetypes,
                            disabled_filetypes = source.disabled_filetypes,
                            extra_args = source.extra_args,
                        }))
                    end
                    null_ls.setup(args)
                end
            },
        },
    },
}
