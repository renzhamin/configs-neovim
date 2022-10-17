local status_ok, lspconfig, mason, mason_lspconfig, handlers

status_ok, handlers = pcall(require, "user.lsp.handlers")
if not status_ok then
    print("Failed to require lsp.handlers")
    return
end

handlers.setup()


local function get_options(server_name)
    local settings_path = "user.lsp.settings." .. server_name

    local has_config, ext_opts = pcall(require, settings_path)

    local opts = {}

    if has_config then
        opts = vim.tbl_deep_extend("force", opts, ext_opts)
    end

    opts.basic_setup = opts.basic_setup or handlers.on_attach
    opts.capabilities = opts.capabilities or handlers.capabilities

    opts.on_attach = function(client, bufnr)
        opts.basic_setup(client, bufnr)
        if opts.extra_setup then
            opts.extra_setup(client, bufnr)
        end
    end

    return opts
end

status_ok, mason = pcall(require, "mason")
if not status_ok then
    print("Failed to require mason")
    return
end


status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    print("Failed to require mason-lspconfig in setup.lua")
    return
end

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("Failed to require lspconfig in setup.lua")
    return
end

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup(get_options(server_name))
    end
}
-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
