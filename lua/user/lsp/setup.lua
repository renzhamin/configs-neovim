local function setup()
    local handlers = require("user.lsp.handlers")

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


    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason.setup()
    mason_lspconfig.setup()
    mason_lspconfig.setup_handlers({
        function(server_name)
            lspconfig[server_name].setup(get_options(server_name))
        end
    })
end

return setup
