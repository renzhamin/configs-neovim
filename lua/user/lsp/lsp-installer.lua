local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print("Failed to load nvim-lsp-installer")
    return
end

lsp_installer.setup()


local lspconfig = require("lspconfig")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    flags = {debounce_text_changes = 5000,}
}

local function extend_opts(servername)
    local settings_path = "user.lsp.settings." .. servername

    local has_config, ext_opts = pcall(require, settings_path)

    if has_config then
        opts = vim.tbl_deep_extend("force", ext_opts, opts)
    end
    return opts
end

lspconfig.clangd.setup(extend_opts("clangd"))
lspconfig.sumneko_lua.setup(extend_opts("sumneko_lua"))
lspconfig.tsserver.setup(extend_opts("tsserver"))
lspconfig.jsonls.setup(extend_opts("jsonls"))

-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
