local status_ok, lspconfig, mason_lspconfig, handlers
status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to require lspconfig in setup.lua")
    return
end

status_ok, handlers = pcall(require, "user.lsp.handlers")
if not status_ok then
    print("Failed to require lsp.handlers")
    return
end

handlers.setup()

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

local function extend_opts(server_name)
    local settings_path = "user.lsp.settings." .. server_name

    local has_config, ext_opts = pcall(require, settings_path)

    if has_config then
        opts = vim.tbl_deep_extend("force", ext_opts, opts)
    end
    return opts
end

status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")


if not status_ok then
    print("Failed to require mason-lspconfig in setup.lua")
    return
end

mason_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup(extend_opts(server_name))
    end
}

-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
