return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Set up minimalist status line with colorbuddy theme colors
      vim.cmd("set laststatus=2")
      vim.cmd("set statusline=")
      
      -- Define colors that match colorbuddy theme
      vim.cmd("hi StatusLine guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineNC guibg=#1a1a1a guifg=#bbbbbb")
      
      -- Set up highlight groups for different parts
      vim.cmd("hi StatusLineMode guibg=#4ecdc4 guifg=#000000 gui=bold")
      vim.cmd("hi StatusLineFilename guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineFiletype guibg=#2d2d2d guifg=#bbbbbb")
      vim.cmd("hi StatusLineLocation guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineProgress guibg=#2d2d2d guifg=#f8fe7a")
      
      -- Set a simple formatted status line using vim's built-in formatting
      vim.cmd("set statusline=%#StatusLineMode#\\ N\\ %*%#StatusLineFilename#\\ %f\\ %*%#StatusLineFiletype#\\ %y\\ %*%=%#StatusLineLocation#\\ %l,%c\\ %*%#StatusLineProgress#\\ %P\\ %*")
      
      -- Force refresh
      vim.cmd("redrawstatus")
    end,
    lazy = false,
    priority = 10000, -- Highest possible priority
  },
}
