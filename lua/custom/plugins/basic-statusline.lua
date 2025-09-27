return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Completely disable lualine and use basic vim statusline
      vim.cmd("set laststatus=2")
      vim.cmd("set statusline=")
      
      -- Set a very simple status line
      vim.cmd("set statusline=%f\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ %P")
      
      -- Force it to be visible
      vim.cmd("redrawstatus")
      
      print("Basic status line set")
    end,
    lazy = false,
    priority = 10000, -- Highest possible priority
  },
}
