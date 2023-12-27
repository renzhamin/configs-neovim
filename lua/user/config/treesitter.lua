local config = {
    -- A list of parser names, or "all"
    ensure_installed = { "lua" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    --[[ ignore_install = { "javascript" }, ]]
    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
    indent = {
        enable = true
    },
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'ti',
            node_incremental = 'ti',
            scope_incremental = 'ts',
            node_decremental = 'td',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['ii'] = '@conditional.inner',
                ['ai'] = '@conditional.outer',
                ['as'] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
        },
        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']f'] = '@function.outer',
                [']c'] = '@class.outer',
                [']s'] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
                [']l'] = '@loop.outer',
            },
            goto_next_end = {
                [']F'] = '@function.outer',
                [']C'] = '@class.outer',
                [']S'] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
            },
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[c'] = '@class.outer',
                ['[s'] = { query = "@scope", query_group = "locals", desc = "Previous scope start" },
                ['[l'] = '@loop.outer',
            },
            goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[C'] = '@class.outer',
                ['[S'] = { query = "@scope", query_group = "locals", desc = "Previous scope end" },
            },
            goto_next = {
                ["]i"] = "@conditional.outer",
            },
            goto_previous = {
                ["[i"] = "@conditional.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
    },
}

return config
