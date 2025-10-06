-- Code Execution - From sergiogallegos/nvim-config
return {
  -- Sniprun - Code execution
  {
    "michaelb/sniprun",
    build = "bash ./install.sh",
    config = function()
      require("sniprun").setup({
        selected_interpreters = {},
        repl_enable = {},
        repl_disable = {},
        interpreter_options = {
          GFM_original = {
            use_on_filetypes = { "markdown" },
          },
        },
        live_display = { "VirtualTextOk" },
        display = { "TerminalOk" },
        display_options = {
          terminal_width = 45,
          notification_duration = 5,
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
        borders = "single",
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>r", function() require("sniprun").run() end, { desc = "Run code" })
      set("v", "<leader>r", function() require("sniprun").run("v") end, { desc = "Run selection" })
      set("n", "<leader>rr", function() require("sniprun").run("n") end, { desc = "Run line" })
      set("n", "<leader>rc", function() require("sniprun").close_all() end, { desc = "Close all" })
      set("n", "<leader>rl", function() require("sniprun").reset() end, { desc = "Reset" })
    end,
  },
}
