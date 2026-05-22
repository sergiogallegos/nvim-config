return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("trouble").setup()

            vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
            vim.keymap.set("n", "<leader>D", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace diagnostics" })
            vim.keymap.set(
                "n",
                "<leader>d",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                { desc = "Document diagnostics" }
            )
            vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list" })
            vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list" })
            vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", { desc = "LSP references" })
        end,
    },
}
