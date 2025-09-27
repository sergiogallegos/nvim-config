-- Disable complex lualine for now
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  config = function()
    -- Simple fallback - just ensure status line is visible
    vim.cmd("set laststatus=2")
    vim.cmd("set statusline=%f\\ %h%w%m%r%=%-14.(%l,%c%V%)\\ %P")
    vim.cmd("redrawstatus")
  end,
}
