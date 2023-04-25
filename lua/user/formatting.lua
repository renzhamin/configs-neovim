local M = {}

-- disable formatting for these language servers
M.dont_format = {
    "tsserver",
}

-- null-ls builtin formatting sources
M.sources = {
    {
        name = "prettierd",
        disabled_filetypes = { "json", "jsonc" },
        extra_args = {
            "--no-semi",
            "--tab-width=4",
            "--config-precedence=prefer-file"
        }
    }
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end
    })
end


return M
