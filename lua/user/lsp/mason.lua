local status_ok, mason, mason_lsp

status_ok, mason = pcall(require, "mason")
if not status_ok then
    print("Failed to require mason")
    return
end

mason.setup()

status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
    print("Failed to require mason-lspconfig")
    return
end

mason_lsp.setup()
