local status_ok, null_ls

status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("Failed to require null-ls")
    return
end


local sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
}

local formatting = require("user.formatting")

local formatters = formatting.sources


for _,source in ipairs(formatters) do
    table.insert(sources, null_ls.builtins.formatting[source])
end


null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            formatting.format_on_save(bufnr)
        end
    end,
})
