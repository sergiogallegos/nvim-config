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
        -- c = { "clang_check" }, -- Disabled: clang_check not available
        -- cpp = { "clang_check" }, -- Disabled: clang_check not available
        sh = { "shellcheck" },
      }

      -- Auto-lint on save (with error handling)
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          local ok, _ = pcall(lint.try_lint)
          if not ok then
            -- Silently ignore linting errors to avoid disrupting workflow
          end
        end,
      })

      -- Manual linting
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Lint code" })
    end,
  },
}
