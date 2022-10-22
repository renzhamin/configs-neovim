local action_layout = require("telescope.actions.layout")

local config = {

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

config = vim.tbl_deep_extend("force", config, require("user.plugins.telescope"))

require("telescope").setup(config)
