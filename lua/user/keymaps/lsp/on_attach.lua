local ks = vim.keymap.set
local lsp_buf = vim.lsp.buf
local ts = require("telescope.builtin")


local function lsp_keymaps(bufnr)
    local desc = function(str)
        return { buffer = bufnr, desc = str }
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    ks('n', '<Leader>lD', lsp_buf.declaration, desc("declaration"))
    ks('n', '<Leader>ld', lsp_buf.definition, desc("definition"))
    ks('n', '<Leader>lh', lsp_buf.hover, desc("hover"))
    ks('n', '<Leader>li', lsp_buf.implementation, desc("implementation"))
    ks('n', '<Leader>ls', lsp_buf.signature_help, desc("signature"))
    --     ks('n', '<Leader>wa', lsp_buf.add_workspace_folder, bufopts)
    --     ks('n', '<Leader>wr', lsp_buf.remove_workspace_folder, bufopts)
    --     ks('n', '<Leader>wl', function()
    --         print(vim.inspect(lsp_buf.list_workspace_folders()))
    --     end, bufopts)
    ks('n', '<Leader>lt', lsp_buf.type_definition, desc("typedef"))
    ks('n', '<Leader>lR', lsp_buf.rename, desc("rename"))
    ks({ 'n', 'v' }, '<Leader>lc', lsp_buf.code_action, desc("show code action"))
    ks({ 'n' }, '<Leader>lca', function()
        lsp_buf.code_action({ apply = true })
    end, desc("apply code action"))
    ks('n', '<Leader>lr', ts.lsp_references, desc("references"))
    ks('n', '<Leader>lf', function() lsp_buf.format { async = true } end, desc("format"))
end

return lsp_keymaps
