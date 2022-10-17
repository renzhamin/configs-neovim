local status_ok, null_ls

status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("Failed to require null-ls")
    return
end

local M = {}

M.sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
}


M.on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        require("user.formatting").format_on_save(bufnr)
    end
end


return M
