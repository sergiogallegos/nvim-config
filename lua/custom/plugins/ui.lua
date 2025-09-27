return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      local ok, dressing = pcall(require, "dressing")
      if not ok then
        vim.notify("Failed to load dressing.nvim", vim.log.levels.ERROR)
        return
      end
      dressing.setup({
        input = {
          enabled = true,
          default_prompt = "Input:",
          win_options = {
            winblend = 0,
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin" },
          builtin = {
            win_options = {
              winblend = 0,
            },
          },
        },
      })
    end,
  },
  -- Temporarily disabled noice.nvim due to startup errors
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     local ok, noice = pcall(require, "noice")
  --     if not ok then
  --       vim.notify("Failed to load noice.nvim", vim.log.levels.ERROR)
  --       return
  --     end
  --     noice.setup({
  --       lsp = {
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       presets = {
  --         bottom_search = true,
  --         command_palette = true,
  --         long_message_to_split = true,
  --         inc_rename = false,
  --         lsp_doc_border = false,
  --       },
  --     })
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local ok, notify = pcall(require, "notify")
      if not ok then
        vim.notify("Failed to load nvim-notify", vim.log.levels.ERROR)
        return
      end
      notify.setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "🐛",
          ERROR = "❌",
          INFO = "ℹ️",
          TRACE = "🔍",
          WARN = "⚠️",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = true,
      })
      vim.notify = notify
    end,
  },
}
