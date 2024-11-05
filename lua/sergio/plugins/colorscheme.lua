return {
  "mcchrish/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
  name = "zenbones",
  priority = 1000,
  config = function()
    -- Set up Zenbones with custom options
    vim.g.zenbones_lightness = "dark" -- Set it to dark mode
    vim.g.zenbones_transparent_background = 1 -- Enable transparency
    vim.g.zenbones_dim_inactive = true -- Dim inactive splits or windows

    -- Apply the colorscheme
    vim.cmd("colorscheme zenbones")
  end,
}
