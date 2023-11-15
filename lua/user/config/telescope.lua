local action_layout = require("telescope.actions.layout")

local config = {

    defaults = {

        dynamic_preview_title = true,

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

    },

    pickers = {

        builtin = {
            layout_config = {
                preview_width = .7,
            },
            theme = "ivy",
        },

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

        lsp_references = {
            layout_config = {
                preview_width = .65,
            },
            theme = "ivy",
        },

        diagnostics = {
            previewer = false,
        }
    }
}

return config
