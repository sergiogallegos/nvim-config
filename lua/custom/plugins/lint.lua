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
        -- Python
        python = { "flake8" },
        
        -- JavaScript/TypeScript
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        
        -- Go
        go = { "golangci_lint" },
        
        -- C/C++
        c = { "clang_check", "clang_tidy" },
        cpp = { "clang_check", "clang_tidy" },
        
        -- Java
        java = { "checkstyle" },
        
        -- Rust
        rust = { "cargo" },
        
        -- SQL
        sql = { "sqlfluff" },
        
        -- Shell
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        zsh = { "shellcheck" },
        
        -- Zig
        zig = { "zig" },
        
        -- Lua
        lua = { "luacheck" },
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
