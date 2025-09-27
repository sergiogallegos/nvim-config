return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- Load immediately
  priority = 1000, -- High priority
  config = function()
    local ok, lualine = pcall(require, "lualine")
    if not ok then
      vim.notify("Failed to load lualine", vim.log.levels.ERROR)
      return
    end
    
    -- Force clear any existing status line
    vim.cmd("hi clear StatusLine")
    vim.cmd("hi clear StatusLineNC")
    
    lualine.setup({
      options = {
        theme = "auto",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = {},
        always_divide_middle = true,
        color_icons = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 
          { "mode", icon = "🚀", color = { bg = "#ff6b6b", fg = "#000000" } },
        },
        lualine_b = { 
          { "branch", icon = "🌿", color = { bg = "#4ecdc4", fg = "#000000" } },
          { "diff", icons = true, color = { added = "green", modified = "orange", removed = "red" } },
        },
        lualine_c = { 
          { "filename", path = 1, shorting_target = 40, color = { bg = "#45b7d1", fg = "#000000" } },
          { "filetype", icon_only = true, color = { bg = "#96ceb4", fg = "#000000" } },
        },
        lualine_x = { 
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = "❌", warn = "⚠️", info = "ℹ️", hint = "💡" }, color = { bg = "#feca57", fg = "#000000" } },
          { "encoding", color = { bg = "#ff9ff3", fg = "#000000" } },
          { "fileformat", color = { bg = "#54a0ff", fg = "#000000" } },
        },
        lualine_y = { 
          { "progress", separator = " ", padding = { left = 1, right = 0 }, color = { bg = "#5f27cd", fg = "#ffffff" } },
        },
        lualine_z = { 
          { "location", padding = { left = 0, right = 1 }, color = { bg = "#00d2d3", fg = "#000000" } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 
          { "filename", path = 1, shorting_target = 40, color = { bg = "#2c2c54", fg = "#ffffff" } },
        },
        lualine_x = { 
          { "location", padding = { left = 0, right = 1 }, color = { bg = "#2c2c54", fg = "#ffffff" } },
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
    
    -- Force refresh status line
    vim.cmd("redrawstatus")
    vim.cmd("set laststatus=2")
  end,
}
