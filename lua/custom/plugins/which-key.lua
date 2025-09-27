return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = false, -- Temporarily disable to fix errors
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        operators = { gc = "Comments", gb = "Comments" },
        key_labels = {
          ["<space>"] = "SPC",
          ["<cr>"] = "RET",
          ["<tab>"] = "TAB",
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        popup_mappings = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        window = {
          border = "rounded",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 2, 2, 2, 2 },
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "left",
        },
        ignore_missing = true,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true,
        triggers = "auto",
        triggers_blacklist = {
          i = { "j", "k" },
          v = { "j", "k" },
        },
      })

      -- Register keymaps using the old format that works
      wk.register({
        ["<leader>"] = {
          name = "Leader",
          f = {
            name = "Find",
            d = "Find files",
            t = "Git files",
            h = "Help tags",
            g = "Multi-ripgrep",
            b = "Buffers",
            a = "Find in lazy",
            n = "Find in config",
            o = "Find in backup",
            p = "Find in plugins",
          },
          g = {
            name = "Git",
            w = "Grep string",
          },
          l = {
            name = "LSP",
            d = "Open diagnostics",
            q = "Quickfix",
            a = "Code action",
            r = "Rename",
            f = "Format",
          },
          h = {
            name = "Harpoon",
            m = "Mark file",
            l = "List files",
          },
          d = {
            name = "Debug",
            b = "Toggle breakpoint",
            g = "Run to cursor",
            ["?"] = "Eval variable",
          },
          t = {
            name = "Test",
            t = "Toggle inlay hints",
          },
          ["1"] = "Harpoon file 1",
          ["2"] = "Harpoon file 2",
          ["3"] = "Harpoon file 3",
          ["4"] = "Harpoon file 4",
          ["5"] = "Harpoon file 5",
        },
        ["<space>"] = {
          name = "Space",
          ["/"] = "Fuzzy find in buffer",
          b = "Toggle breakpoint",
          g = "Run to cursor",
          ["?"] = "Eval variable",
          ca = "Code action",
          f = "Format",
          rn = "Rename",
          t = "Test file",
          tt = "Toggle inlay hints",
        },
      })
    end,
  },
}