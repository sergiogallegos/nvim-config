-- Formatting - single formatting layer, with LSP fallback.
return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = { "prettier", "stylua", "codelldb" },
            auto_update = false,
            run_on_start = true,
            start_delay = 3000,
            integrations = {
                ["mason-lspconfig"] = false,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>=",
                function()
                    require("conform").format { async = true, lsp_format = "fallback" }
                end,
                mode = { "n", "v" },
                desc = "Format",
            },
        },
        config = function()
            require("conform").setup {
                formatters_by_ft = {
                    lua = { "stylua" },
                    rust = { "rustfmt" },
                    python = { "ruff_organize_imports", "ruff_format" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    jsonc = { "prettier" },
                    yaml = { "prettier" },
                    toml = { "taplo" },
                    markdown = { "prettier" },
                },
                format_on_save = function(bufnr)
                    local disabled = {
                        c = true,
                        cpp = true,
                    }
                    if disabled[vim.bo[bufnr].filetype] then
                        return
                    end

                    return {
                        timeout_ms = 1500,
                        lsp_format = "fallback",
                    }
                end,
            }
        end,
    },
}
