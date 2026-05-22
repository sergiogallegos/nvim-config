-- Testing Framework - From sergiogallegos/nvim-config
return {
    -- Neotest - Testing framework
    {
        "nvim-neotest/neotest",
        keys = {
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand "%")
                end,
                desc = "Test file",
            },
            {
                "<leader>ts",
                function()
                    require("neotest").run.stop()
                end,
                desc = "Stop test",
            },
            {
                "<leader>td",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Run last test",
            },
            {
                "<leader>to",
                function()
                    require("neotest").output.open { enter = true, auto_close = true }
                end,
                desc = "Open test output",
            },
            {
                "<leader>tS",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "Toggle test summary",
            },
            {
                "<leader>tn",
                function()
                    require("neotest").run.run()
                end,
                desc = "Test nearest",
            },
            {
                "<leader>tl",
                function()
                    require("neotest").run.run_last()
                end,
                desc = "Test last",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/nvim-nio",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
        },
        config = function()
            require("neotest").setup {
                adapters = {
                    require "neotest-go" {
                        experimental = {
                            test_table = true,
                        },
                        args = { "-count=1", "-timeout=60s" },
                    },
                    require "neotest-python" {
                        dap = { justMyCode = false },
                        args = { "--log-level", "DEBUG" },
                        runner = "pytest",
                    },
                    require "neotest-jest" {
                        jestCommand = "npm test --",
                        jestConfigFile = "jest.config.js",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    },
                },
                status = { virtual_text = true },
                output = { open_on_run = true },
                quickfix = {
                    open = false,
                },
                summary = {
                    open = "botright vsplit | vertical resize 50",
                },
            }
        end,
    },
}
