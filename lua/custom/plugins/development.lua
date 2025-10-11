-- Enhanced Development Experience
return {
  -- Better code actions
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          rust = { "rustfmt" },
          python = { "black", "isort" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  
  -- Better diagnostics (already configured in ultimate.lua)
  -- {
  --   "folke/trouble.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("trouble").setup({
  --       position = "bottom",
  --       height = 10,
  --       width = 50,
  --       icons = true,
  --       mode = "workspace_diagnostics",
  --       fold_open = "",
  --       fold_closed = "",
  --       group = true,
  --       padding = true,
  --       action_keys = {
  --         close = "q",
  --         cancel = "<esc>",
  --         refresh = "r",
  --         jump = { "<cr>", "<tab>" },
  --         open_split = { "<c-x>" },
  --         open_vsplit = { "<c-v>" },
  --         open_tab = { "<c-t>" },
  --         jump_close = { "o" },
  --         toggle_mode = "m",
  --         toggle_preview = "P",
  --         hover = "K",
  --         preview = "p",
  --         close_folds = { "zM", "zm" },
  --         open_folds = { "zR", "zr" },
  --         toggle_fold = { "za", "zA" },
  --         previous = "k",
  --         next = "j",
  --       },
  --       indent_lines = true,
  --       auto_open = false,
  --       auto_close = false,
  --       auto_preview = true,
  --       auto_fold = false,
  --       auto_jump = { "lsp_definitions" },
  --       signs = {
  --         error = "",
  --         warning = "",
  --         hint = "",
  --         information = "",
  --         other = "﫠",
  --       },
  --       use_diagnostic_signs = false,
  --     })
  --   end,
  -- },
  
  -- Better LSP UI
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          in_custom = false,
          enable = true,
          separator = "  ",
          show_file = true,
          file_formatter = "",
        },
        ui = {
          border = "rounded",
          devicon = true,
          title = true,
          expand = "",
          collapse = "",
          code_action = "💡",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          kind = {},
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
