local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local M = {}

-- disable formatting for these language servers
M.dont_format = {
    "tsserver",
    "jsonls",
}

-- null-ls builtin sources
M.sources = {
    "prettierd",
}

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
