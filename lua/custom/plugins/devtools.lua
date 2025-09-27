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

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").run.stop()
      end, { desc = "Stop test" })

      vim.keymap.set("n", "<leader>td", function()
        require("neotest").run.run_last()
      end, { desc = "Run last test" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end, { desc = "Open test output" })

      vim.keymap.set("n", "<leader>tO", function()
        require("neotest").output.open({ enter = true, auto_close = false })
      end, { desc = "Open test output (persistent)" })

      vim.keymap.set("n", "<leader>tS", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
    end,
  },
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    event = "VeryLazy",
    config = function()
      local ok, sniprun = pcall(require, "sniprun")
      if not ok then
        vim.notify("Failed to load sniprun", vim.log.levels.ERROR)
        return
      end
      sniprun.setup({
        selected_interpreters = {},
        repl_enable = {},
        repl_disable = {},
        interpreter_options = {},
        display = {
          "Classic",
          "VirtualTextOk",
          "LongestFloatingLines",
        },
        live_display = { "VirtualTextOk" },
        display_options = {
          terminal_width = 45,
          notification_timeout = 5,
        },
        show_no_output = {
          "Classic",
          "TempFloatingWindow",
        },
        snipruncolors = {
          SniprunVirtualTextOk = { bg = "#66eeff", fg = "#000000", ctermbg = "Cyan", ctermfg = "Black" },
          SniprunFloatingWinOk = { fg = "#66eeff", ctermfg = "Cyan" },
          SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", ctermfg = "Black" },
          SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
        },
        live_mode_toggle = "off",
      })

      vim.keymap.set("n", "<leader>r", "<cmd>SnipRun<cr>", { desc = "Run code snippet" })
      vim.keymap.set("v", "<leader>r", "<cmd>SnipRun<cr>", { desc = "Run selected code" })
    end,
  },
}
