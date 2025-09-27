-- Status line configuration - Custom formatting
-- This file configures both main status line and command line status

return {
  -- Custom status line configuration
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
      
      -- Custom command line status line format
      vim.cmd([[
        set statusline=%f\ %m\ %r\ %w\ %y\ %p%%\ %l:%c\ %{&fileencoding}\ %{&fileformat}
        set laststatus=2
      ]])
    end,
  },
}
