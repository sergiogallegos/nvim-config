return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Simple, direct popup color override
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Wait a bit for everything to load
          vim.defer_fn(function()
            -- Force override popup colors
            vim.cmd("highlight Pmenu guibg=#1a1a1a guifg=#E0E0E0")
            vim.cmd("highlight PmenuSel guibg=#2d2d2d guifg=#f8fe7a")
            vim.cmd("highlight PmenuSbar guibg=#1a1a1a")
            vim.cmd("highlight PmenuThumb guibg=#4a4a4a")
            vim.cmd("highlight NormalFloat guibg=#1a1a1a guifg=#E0E0E0")
            vim.cmd("highlight FloatBorder guibg=#1a1a1a guifg=#bbbbbb")
            vim.cmd("highlight Cmdline guibg=#1a1a1a guifg=#E0E0E0")
            vim.cmd("highlight CmdlineIcon guibg=#1a1a1a guifg=#f8fe7a")
            vim.cmd("highlight CmdlineIconSearch guibg=#1a1a1a guifg=#f8fe7a")
            vim.cmd("highlight CmdlineIconHelp guibg=#1a1a1a guifg=#81a2be")
            vim.cmd("highlight CmdlineIconFilter guibg=#1a1a1a guifg=#8abeb7")
          end, 1000)
        end,
      })
    end,
    lazy = false,
    priority = 9999, -- Load last
  },
}
