local ks = vim.keymap.set
local lsp_buf = vim.lsp.buf
local ts = require("telescope.builtin")
local wk = require("which-key")


local function lsp_keymaps(bufnr)
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

    ks('n', '<Leader>ltc', require("user.utils.completion").toggle_lsp,
        { desc = "toggle completion" })

    ks('n', '<Leader>lgD', lsp_buf.declaration, desc("declaration"))
    ks('n', '<Leader>lgd', ts.lsp_definitions, desc("definition"))
    ks('n', '<Leader>lgi', ts.lsp_implementations, desc("implementation"))
    ks('n', '<Leader>lgt', ts.lsp_type_definitions, desc("typedef"))
    ks('n', '<Leader>lR', ts.lsp_references, desc("references"))

    ks('n', '<Leader>lh', lsp_buf.hover, desc("hover"))
    ks('n', '<Leader>ls', lsp_buf.signature_help, desc("signature"))

    ks('n', '<Leader>lr', lsp_buf.rename, desc("rename"))

    ks({ 'n', 'v' }, '<Leader>lc', lsp_buf.code_action, desc("show code action"))
    ks({ 'n' }, '<Leader>lca',
        function() lsp_buf.code_action({ apply = true }) end, desc("apply code action"))

    ks('n', '<Leader>lf', function() lsp_buf.format { async = true } end, desc("format"))
end

return lsp_keymaps
