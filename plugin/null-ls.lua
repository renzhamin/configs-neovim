local status_ok, null_ls

status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("Failed to require null-ls")
    return
end


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
