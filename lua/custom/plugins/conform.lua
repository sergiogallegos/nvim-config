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
          java = { "google-java-format" },
          yaml = { "yamlfmt" },
          toml = { "taplo" },
          sql = { "sqlfluff" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          zsh = { "shfmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters = {
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          black = {
            prepend_args = { "--line-length", "88" },
          },
          prettier = {
            prepend_args = { "--tab-width", "2", "--single-quote", "false" },
          },
          shfmt = {
            prepend_args = { "-i", "2" },
          },
        },
      })

      -- Keymaps for formatting
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        conform.format({ async = true, lsp_fallback = true })
      end, { desc = "Format code" })
    end,
  },
}
