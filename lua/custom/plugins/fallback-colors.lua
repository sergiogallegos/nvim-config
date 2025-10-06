-- Fallback colorscheme - Simple and clean
return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local ok, tokyonight = pcall(require, "tokyonight")
      if not ok then return end
      
      tokyonight.setup({
        style = "night", -- storm, moon, night, day
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { bold = true },
          keywords = { bold = true },
          functions = { bold = true },
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })
      
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
