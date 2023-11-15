return {
    "lewis6991/gitsigns.nvim",
    keys = {
        {
            '<Leader>hh',
            function()
                require("gitsigns").toggle_signs()
            end,
            mode = 'n',
            desc = "toggle git signs"
        }
    },
    config = function()
        require('gitsigns').setup {
            signcolumn = false,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']h', function()
                    if vim.wo.diff then return ']h' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                map('n', '[h', function()
                    if vim.wo.diff then return '[h' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                map('n', '<leader>hs', gs.stage_hunk, { desc = "stage hunk" })
                map('n', '<leader>hr', gs.reset_hunk, { desc = "reset hunk" })
                map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    { desc = "stage hunk" }
                )
                map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                    { desc = "reset hunk" })
                map('n', '<leader>hS', gs.stage_buffer, { desc = "stage buffer" })
                map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "undo stage hunk" })
                map('n', '<leader>hR', gs.reset_buffer, { desc = "reset buffer" })
                map('n', '<leader>hp', gs.preview_hunk, { desc = "preview hunk" })
                map('n', '<leader>hB', function() gs.blame_line { full = true } end, { desc = "blame full" })
                map('n', '<leader>hb', gs.toggle_current_line_blame, { desc = "toggle blame" })
                map('n', '<leader>hd', gs.diffthis, { desc = "diffthis" })
                map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "diffthis~" })
                map('n', '<leader>htd', gs.toggle_deleted, { desc = "toggle deleted" })

                -- Text object
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end
}
