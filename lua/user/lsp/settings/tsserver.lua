local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local status_ok, handlers = pcall(require, "user.lsp.handlers")
if not status_ok then
    print("Failed to require lsp.handlers")
    return
end

local on_attach = function (client, bufnr)
    handlers.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
end

return {
    on_attach = on_attach,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        }
    }
}
