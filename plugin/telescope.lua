local action_layout = require("telescope.actions.layout")

require("telescope").setup {

    pickers = {

        find_files = {
            layout_config = {
                preview_width = .5,
            },

            previewer = false,
        },

        live_grep = {
            layout_config = {
                preview_width = .6,
            },
            theme = "ivy",
        },

    },

    defaults = {

        layout_config = {
            preview_cutoff = 50,
        },

        mappings = {
            n = {
                ["<M-p>"] = action_layout.toggle_preview
            },
            i = {
                ["<M-p>"] = action_layout.toggle_preview,
            },
        },

    }
}

vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
