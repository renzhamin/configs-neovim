local ks = vim.keymap.set
local lsp_buf = vim.lsp.buf

local function lsp_keymaps(bufnr)
    local bufopts = { buffer = bufnr }

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    ks('n', '<Leader>gD', lsp_buf.declaration, bufopts)
    ks('n', '<Leader>gd', lsp_buf.definition, bufopts)
    ks('n', 'K', lsp_buf.hover, bufopts)
    ks('n', '<Leader>gi', lsp_buf.implementation, bufopts)
    ks('n', '<C-k>', lsp_buf.signature_help, bufopts)
    --     ks('n', '<Leader>wa', lsp_buf.add_workspace_folder, bufopts)
    --     ks('n', '<Leader>wr', lsp_buf.remove_workspace_folder, bufopts)
    --     ks('n', '<Leader>wl', function()
    --         print(vim.inspect(lsp_buf.list_workspace_folders()))
    --     end, bufopts)
    ks('n', '<Leader>D', lsp_buf.type_definition, bufopts)
    ks('n', '<Leader>rn', lsp_buf.rename, bufopts)
    ks({ 'n', 'v' }, '<Leader>ca', lsp_buf.code_action, bufopts)
    ks({ 'n' }, '<Leader>qf', function()
        lsp_buf.code_action({ apply = true })
    end, bufopts)
    ks('n', '<Leader>gr', lsp_buf.references, bufopts)
    ks('n', '<Leader>fm', function() lsp_buf.format { async = true } end, bufopts)
end

return lsp_keymaps
