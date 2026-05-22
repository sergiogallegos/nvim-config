-- Formatting - single formatting layer, with LSP fallback.
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>=",
                function()
                    require("conform").format { async = true, lsp_fallback = true }
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
                    python = { "isort", "black" },
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
                        timeout_ms = 800,
                        lsp_fallback = true,
                    }
                end,
            }
        end,
    },
}
