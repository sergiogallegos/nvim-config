return {
  {
    "tjdevries/colorbuddy.nvim",    -- Load colorbuddy.nvim first
    lazy = false,
  },
  {
    "tjdevries/gruvbuddy.nvim",      -- Load gruvbuddy.nvim with colorbuddy as a dependency
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("colorbuddy").setup()  -- Ensure colorbuddy is initialized
      vim.cmd.colorscheme("gruvbuddy") -- Set the color scheme to gruvbuddy
    end,
    lazy = false,
    priority = 1000,
  },
  -- Other colorschemes as fallbacks or options
  "rktjmp/lush.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  -- Add more colorschemes if needed
}
