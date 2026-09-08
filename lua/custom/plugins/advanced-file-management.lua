return {
    {
        "stevearc/oil.nvim",
        lazy = false, -- Also handle `nvim .` and directory arguments.
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "-",
                function()
                    require("oil").open()
                end,
                desc = "Open parent directory",
            },
            {
                "<leader>e",
                function()
                    require("oil").open()
                end,
                desc = "Open file explorer",
            },
        },
        opts = {
            columns = { "icon" },
            view_options = { show_hidden = true },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-l>"] = false,
                ["<C-p>"] = false,
                ["gV"] = "actions.select_vsplit",
                ["gS"] = "actions.select_split",
                ["gp"] = "actions.preview",
                ["gR"] = "actions.refresh",
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,
            lsp_file_methods = { autosave_changes = false },
        },
    },
}
