return {
    {
      "sergiogallegos/colorbuddy.nvim",
      config = function()
        require("colorbuddy").setup()  -- Ensure colorbuddy is initialized
        vim.cmd.colorscheme("custombuddy") -- Set the color scheme to gruvbuddy
      end,
      lazy = false,
      priority = 1000,
    },
  }
