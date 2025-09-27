return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local ok, lualine = pcall(require, "lualine")
      if not ok then
        vim.notify("Failed to load lualine", vim.log.levels.ERROR)
        return
      end
      
      -- Simple, guaranteed-to-work configuration
      lualine.setup({
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = "",
          icons_enabled = true,
          globalstatus = false, -- Try with false first
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
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
    end,
  },
}
