return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Debug popup colors
      vim.api.nvim_create_user_command("PopupDebug", function()
        local highlights = {
          "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb", 
          "NormalFloat", "FloatBorder", "Cmdline", "CmdlineIcon"
        }
        
        for _, hl in ipairs(highlights) do
          local result = vim.api.nvim_get_hl(0, { name = hl })
          print(hl .. ": " .. vim.inspect(result))
        end
      end, {})
      
      -- Force set popup colors with different approach
      vim.api.nvim_create_user_command("PopupFix", function()
        -- Try different color values
        vim.cmd("hi Pmenu guibg=#2d2d2d guifg=#ffffff")
        vim.cmd("hi PmenuSel guibg=#4a4a4a guifg=#ffff00")
        vim.cmd("hi NormalFloat guibg=#2d2d2d guifg=#ffffff")
        vim.cmd("hi FloatBorder guibg=#2d2d2d guifg=#cccccc")
        vim.cmd("hi Cmdline guibg=#2d2d2d guifg=#ffffff")
        print("Popup colors forced!")
      end, {})
    end,
    lazy = false,
    priority = 9998,
  },
}
