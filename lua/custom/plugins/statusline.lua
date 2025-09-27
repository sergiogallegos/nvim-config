-- Status line configuration - Back to lualine.nvim
-- This file configures the status line using lualine.nvim

return {
  -- lualine.nvim - Fast and easy to configure status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
      local ok, lualine = pcall(require, "lualine")
      if not ok then
        vim.notify("Failed to load lualine", vim.log.levels.ERROR)
        return
      end
      
      lualine.setup({
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = "",
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics", "filetype" },
          lualine_y = { "location" },
          lualine_z = { "progress" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      })
      
      -- Force status line to show and hide command line status
      vim.cmd("set laststatus=2")
      vim.cmd("set cmdheight=0")  -- Hide command line status
      vim.cmd("set showcmd")      -- Show mode in status line only
      vim.cmd("set ruler")         -- Show position in status line only
      
      -- Hide the duplicate mode indicator
      vim.cmd("set noshowmode")    -- Don't show mode in command line
    end,
  },
  
  -- Command line popup plugin
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local ok, noice = pcall(require, "noice")
      if not ok then
        vim.notify("Failed to load noice.nvim", vim.log.levels.ERROR)
        return
      end
      
      noice.setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },
}
