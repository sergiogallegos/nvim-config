return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- Load immediately
  config = function()
    local ok, lualine = pcall(require, "lualine")
    if not ok then
      vim.notify("Failed to load lualine", vim.log.levels.ERROR)
      return
    end
    
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
      },
      sections = {
        lualine_a = { 
          { "mode", icon = "🚀" },
        },
        lualine_b = { 
          { "branch", icon = "🌿" },
          { "diff", icons = true, color = { added = "green", modified = "orange", removed = "red" } },
        },
        lualine_c = { 
          { "filename", path = 1, shorting_target = 40 },
          { "filetype", icon_only = true },
        },
        lualine_x = { 
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = "❌", warn = "⚠️", info = "ℹ️", hint = "💡" } },
          { "encoding" },
          { "fileformat" },
        },
        lualine_y = { 
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
        },
        lualine_z = { 
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 
          { "filename", path = 1, shorting_target = 40 },
        },
        lualine_x = { 
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
    
    -- Force refresh status line
    vim.cmd("redrawstatus")
  end,
}
