local ks = vim.keymap.set
local lsp_buf = vim.lsp.buf

local function telescope(func_name)
    local ts = require("telescope.builtin")
    return ts[func_name]
end

local function lsp_keymaps(bufnr)
    local wk = require("which-key")

    wk.register({
        name = "LSP",
        g = {
            name = "go to",
        }
    }, {
        prefix = "<Leader>l",
        buffer = bufnr,
    })

    local desc = function(str)
        return { buffer = bufnr, desc = str }
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    ks('n', '<Leader>ltc',
        function()
            require("user.utils.completion").toggle_lsp()
        end, { desc = "toggle completion" })

    ks('n', '<Leader>lgD', lsp_buf.declaration, desc("declaration"))

    ks('n', '<Leader>lgd',
        telescope("lsp_definitions"), desc("definition"))

    ks('n', '<Leader>lgi',
        telescope("lsp_implementations"), desc("implementation"))

    ks('n', '<Leader>lgt',
        telescope("lsp_type_definitions"), desc("typedef"))

    ks('n', '<Leader>lR',
        telescope("lsp_references"), desc("references"))

    ks('n', '<Leader>lh', lsp_buf.hover, desc("hover"))
    ks('n', '<Leader>ls', lsp_buf.signature_help, desc("signature"))

    ks('n', '<Leader>lr', lsp_buf.rename, desc("rename"))

    ks({ 'n', 'v' }, '<Leader>lc', lsp_buf.code_action, desc("show code action"))
    ks({ 'n' }, '<Leader>lca',
        function() lsp_buf.code_action({ apply = true }) end, desc("apply code action"))

    ks('n', '<Leader>lf', function() lsp_buf.format { async = true } end, desc("format"))
end

return lsp_keymaps
