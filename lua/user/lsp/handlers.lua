local M = {}

M.setup = function()
    vim.diagnostic.config(require("user.lsp.diagnostic"))
end

local function lsp_highlight_document()
    -- Set autocommands conditional on server_capabilities
    vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
end

local formatting = require("user.formatting")
local lsp_keymaps = require("user.keymaps.lsp.on_attach")

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    if client.server_capabilities.documentHighlight then
        lsp_highlight_document()
    end

    for _, server in ipairs(formatting.dont_format) do
        if server == client.name then
            client.server_capabilities.documentFormattingProvider = false
            break
        end
    end


    if client.server_capabilities.documentFormattingProvider then
        formatting.format_on_save(bufnr)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
