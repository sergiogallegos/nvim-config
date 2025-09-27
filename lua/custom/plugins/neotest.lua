return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    event = "VeryLazy",
    config = function()
      local ok, neotest = pcall(require, "neotest")
      if not ok then
        vim.notify("Failed to load neotest", vim.log.levels.ERROR)
        return
      end

      local adapters = {}
      
      -- Add adapters with error handling
      local go_ok, neotest_go = pcall(require, "neotest-go")
      if go_ok then
        table.insert(adapters, neotest_go)
      end
      
      local python_ok, neotest_python = pcall(require, "neotest-python")
      if python_ok then
        table.insert(adapters, neotest_python)
      end
      
      local jest_ok, neotest_jest = pcall(require, "neotest-jest")
      if jest_ok then
        table.insert(adapters, neotest_jest)
      end

      neotest.setup({
        adapters = adapters,
      })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Test file" })

      vim.keymap.set("n", "<leader>tn", function()
        require("neotest").run.run()
      end, { desc = "Test nearest" })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Test summary" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, { desc = "Test output" })
    end,
  },
}
