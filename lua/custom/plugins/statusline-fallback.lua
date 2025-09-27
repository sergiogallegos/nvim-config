return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Simple fallback status line
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Ensure status line is always visible
          vim.cmd("set laststatus=2")
          vim.cmd("set cmdheight=1")
          
          -- Simple status line if lualine fails
          vim.cmd("set statusline=%f\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ %P")
          
          -- Force redraw
          vim.cmd("redrawstatus")
        end,
      })
    end,
    lazy = false,
    priority = 9999, -- Load last
  },
}
