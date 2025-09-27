return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      local ok, conform = pcall(require, "conform")
      if not ok then
        vim.notify("Failed to load conform", vim.log.levels.ERROR)
        return
      end

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black", "isort" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          markdown = { "prettier" },
          go = { "gofmt", "goimports" },
          rust = { "rustfmt" },
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      -- Keymaps for formatting
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        conform.format({ async = true, lsp_fallback = true })
      end, { desc = "Format code" })
    end,
  },
}
