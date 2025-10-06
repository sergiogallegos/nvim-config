-- Testing Framework - From sergiogallegos/nvim-config
return {
  -- Neotest - Testing framework
  {
    "nvim-neotest/neotest",
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
      require("neotest").setup({
        adapters = {
          require("neotest-go")({
            experimental = {
              test_table = true,
            },
            args = { "-count=1", "-timeout=60s" },
          }),
          require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
          }),
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
          open = false,
        },
        summary = {
          open = "botright vsplit | vertical resize 50",
        },
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
      set("n", "<leader>ts", function() require("neotest").run.stop() end, { desc = "Stop test" })
      set("n", "<leader>td", function() require("neotest").run.run_last() end, { desc = "Run last test" })
      set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = "Open test output" })
      set("n", "<leader>tS", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
      set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Test nearest" })
      set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Test last" })
    end,
  },
  
  -- Neotest Go
  {
    "nvim-neotest/neotest-go",
    dependencies = { "nvim-neotest/neotest" },
  },
  
  -- Neotest Python
  {
    "nvim-neotest/neotest-python",
    dependencies = { "nvim-neotest/neotest" },
  },
  
  -- Neotest Jest
  {
    "nvim-neotest/neotest-jest",
    dependencies = { "nvim-neotest/neotest" },
  },
}
