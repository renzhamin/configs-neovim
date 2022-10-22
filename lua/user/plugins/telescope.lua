local config = {
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
