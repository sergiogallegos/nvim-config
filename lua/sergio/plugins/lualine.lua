return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- Updated colors to match Rose Pine and WezTerm
    local colors = {
      blue = "#6CAADC", -- Softer blue to match Rose Pine
      green = "#44FFB1", -- Matches Rose Pine's green
      violet = "#A277FF", -- Softer violet, also from Rose Pine palette
      yellow = "#FFE073", -- Subdued yellow
      red = "#E52E2E", -- Less vibrant red
      fg = "#CBE0F0", -- Rose Pine foreground color
      bg = "#0D0D0D", -- Rose Pine background color
      inactive_bg = "#2C2C2C", -- Inactive window/tab background
    }

    -- Updated lualine theme configuration
    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = "#B0B0B0", gui = "bold" },
        b = { bg = colors.inactive_bg, fg = "#B0B0B0" },
        c = { bg = colors.inactive_bg, fg = "#B0B0B0" },
      },
    }

    -- Configure lualine with the updated theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = " " }, -- Adds a Git-like icon to the mode
        },
        lualine_b = {
          "branch", -- Shows Git branch
          "diff", -- Shows added/modified/removed counts
        },
        lualine_c = {
          { "filename", path = 1 }, -- Shows the file path
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" }, -- Pending updates
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" }, -- Displays percentage through the file
        lualine_z = { "location" }, -- Displays line and column number
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" }, -- Git integration
    })
  end,
}
