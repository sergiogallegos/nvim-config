return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin for loading
    config = function()
      -- Aggressive popup transparency fix
      local function apply_transparency_fix()
        -- Force clear all popup highlights
        vim.cmd("hi clear Pmenu")
        vim.cmd("hi clear PmenuSel") 
        vim.cmd("hi clear PmenuSbar")
        vim.cmd("hi clear PmenuThumb")
        vim.cmd("hi clear NormalFloat")
        vim.cmd("hi clear FloatBorder")
        vim.cmd("hi clear Cmdline")
        vim.cmd("hi clear CmdlineIcon")
        vim.cmd("hi clear CmdlineIconSearch")
        vim.cmd("hi clear CmdlineIconHelp")
        vim.cmd("hi clear CmdlineIconFilter")
        
        -- Apply beautiful semi-transparent styling
        vim.api.nvim_set_hl(0, "Pmenu", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 15,
          ctermbg = 235,
          ctermfg = 253
        })
        vim.api.nvim_set_hl(0, "PmenuSel", { 
          bg = "#2d2d2d", 
          fg = "#f8fe7a",
          blend = 15,
          ctermbg = 237,
          ctermfg = 11
        })
        vim.api.nvim_set_hl(0, "PmenuSbar", { 
          bg = "#1a1a1a",
          blend = 15,
          ctermbg = 235
        })
        vim.api.nvim_set_hl(0, "PmenuThumb", { 
          bg = "#4a4a4a",
          blend = 15,
          ctermbg = 240
        })
        vim.api.nvim_set_hl(0, "NormalFloat", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 15,
          ctermbg = 235,
          ctermfg = 253
        })
        vim.api.nvim_set_hl(0, "FloatBorder", { 
          bg = "#1a1a1a", 
          fg = "#bbbbbb",
          blend = 15,
          ctermbg = 235,
          ctermfg = 250
        })
        
        -- Command line styling
        vim.api.nvim_set_hl(0, "Cmdline", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 15,
          ctermbg = 235,
          ctermfg = 253
        })
        vim.api.nvim_set_hl(0, "CmdlineIcon", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 15,
          ctermbg = 235,
          ctermfg = 11
        })
        vim.api.nvim_set_hl(0, "CmdlineIconSearch", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 15,
          ctermbg = 235,
          ctermfg = 11
        })
        vim.api.nvim_set_hl(0, "CmdlineIconHelp", { 
          bg = "#1a1a1a", 
          fg = "#81a2be",
          blend = 15,
          ctermbg = 235,
          ctermfg = 12
        })
        vim.api.nvim_set_hl(0, "CmdlineIconFilter", { 
          bg = "#1a1a1a", 
          fg = "#8abeb7",
          blend = 15,
          ctermbg = 235,
          ctermfg = 14
        })
        
        -- Completion styling
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { 
          fg = "#E0E0E0", 
          bg = "NONE",
          ctermfg = 253
        })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { 
          fg = "#f8fe7a", 
          bg = "NONE",
          ctermfg = 11
        })
        vim.api.nvim_set_hl(0, "CmpItemKind", { 
          fg = "#bbbbbb", 
          bg = "NONE",
          ctermfg = 250
        })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { 
          fg = "#bbbbbb", 
          bg = "NONE",
          ctermfg = 250
        })
        
        -- LSP popup styling
        vim.api.nvim_set_hl(0, "LspInfoBorder", { 
          bg = "#1a1a1a", 
          fg = "#bbbbbb",
          blend = 15,
          ctermbg = 235,
          ctermfg = 250
        })
        vim.api.nvim_set_hl(0, "LspInfoTitle", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 15,
          ctermbg = 235,
          ctermfg = 11
        })
        vim.api.nvim_set_hl(0, "LspInfoList", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 15,
          ctermbg = 235,
          ctermfg = 253
        })
        
      end
      
      -- Apply immediately
      apply_transparency_fix()
      
      -- Reapply on colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = apply_transparency_fix,
      })
      
      -- Reapply on VimEnter
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = apply_transparency_fix,
      })
      
      -- Reapply on BufEnter for each buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = apply_transparency_fix,
      })
    end,
    lazy = false,
    priority = 3000, -- Highest priority
  },
}
