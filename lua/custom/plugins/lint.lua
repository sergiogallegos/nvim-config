return {
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      local ok, lint = pcall(require, "lint")
      if not ok then
        vim.notify("Failed to load nvim-lint", vim.log.levels.ERROR)
        return
      end

      lint.linters_by_ft = {
        python = { "flake8" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        go = { "golangci_lint" },
        c = { "clang_check" },
        cpp = { "clang_check" },
        sh = { "shellcheck" },
      }

      -- Auto-lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Manual linting
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Lint code" })
    end,
  },
}
