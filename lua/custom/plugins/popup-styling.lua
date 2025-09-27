return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin to ensure this loads
    config = function()
      -- Force popup styling with higher priority
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- Clear existing highlights
          vim.cmd("hi clear Pmenu")
          vim.cmd("hi clear PmenuSel")
          vim.cmd("hi clear PmenuSbar")
          vim.cmd("hi clear PmenuThumb")
          vim.cmd("hi clear NormalFloat")
          vim.cmd("hi clear FloatBorder")
          
          -- Apply custom popup styling
          vim.api.nvim_set_hl(0, "Pmenu", { 
            bg = "#1a1a1a", 
            fg = "#E0E0E0",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "PmenuSel", { 
            bg = "#333333", 
            fg = "#f8fe7a",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "PmenuSbar", { 
            bg = "#2a2a2a",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "PmenuThumb", { 
            bg = "#bbbbbb",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "NormalFloat", { 
            bg = "#1a1a1a", 
            fg = "#E0E0E0",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "FloatBorder", { 
            bg = "#1a1a1a", 
            fg = "#bbbbbb",
            blend = 20 
          })
          
          -- Command line styling
          vim.api.nvim_set_hl(0, "MsgArea", { 
            bg = "#1a1a1a", 
            fg = "#E0E0E0",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "MoreMsg", { 
            bg = "#1a1a1a", 
            fg = "#99cc99",
            blend = 20 
          })
          vim.api.nvim_set_hl(0, "Question", { 
            bg = "#1a1a1a", 
            fg = "#f8fe7a",
            blend = 20 
          })
          
          -- Completion styling
          vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#E0E0E0", bg = "NONE" })
          vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#f8fe7a", bg = "NONE" })
          vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#bbbbbb", bg = "NONE" })
          vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bbbbbb", bg = "NONE" })
          
          print("🎨 Popup styling refreshed!")
        end,
      })
      
      -- Apply immediately
      vim.cmd("doautocmd ColorScheme")
    end,
    lazy = false,
    priority = 2000, -- Higher priority than colorscheme
  },
}
