return {
    {
        "mrcjkb/rustaceanvim",
        version = "^9",
        lazy = false, -- rustaceanvim handles filetype loading itself.
        dependencies = { "hrsh7th/cmp-nvim-lsp", "mfussenegger/nvim-dap", "mason-org/mason.nvim" },
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    -- Project rust-analyzer.json settings may override these defaults.
                    default_settings = {
                        ["rust-analyzer"] = { check = { command = "clippy" } },
                    },
                },
                tools = { code_actions = { ui_select_fallback = true } },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        event = { "BufReadPost Cargo.toml", "BufNewFile Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { completion = { cmp = { enabled = true } } },
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Debug: continue",
            },
            {
                "<F9>",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Debug: breakpoint",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "Debug: step over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "Debug: step into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "Debug: step out",
            },
        },
    },
}
