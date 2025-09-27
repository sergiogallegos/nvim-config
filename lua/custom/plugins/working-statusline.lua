return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Force a working status line
      vim.cmd("set laststatus=2")
      vim.cmd("set statusline=%f\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ %P")
      vim.cmd("redrawstatus")
      
      print("Working status line set")
    end,
    lazy = false,
    priority = 10000,
  },
}
