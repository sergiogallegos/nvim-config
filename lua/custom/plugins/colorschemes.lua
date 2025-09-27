return {
    {
      "sergiogallegos/colorbuddy.nvim",
      config = function()
        local ok, colorbuddy = pcall(require, "colorbuddy")
        if not ok then
          vim.notify("Failed to load colorbuddy", vim.log.levels.ERROR)
          return
        end
        
        colorbuddy.setup()  -- Ensure colorbuddy is initialized
        vim.cmd.colorscheme("custombuddy") -- Set the color scheme to custombuddy
        
        -- Set transparent background for main editor
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
        -- Clear status line highlights to use default
        vim.cmd("hi clear StatusLine")
        vim.cmd("hi clear StatusLineNC")
        vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", ctermbg = "NONE" })
        
        -- Enhanced popup styling to match colorbuddy theme
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
        
        -- Popup menu styling (completion, command line, etc.)
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
        
        -- LSP and diagnostic popups
        vim.api.nvim_set_hl(0, "LspInfoBorder", { 
          bg = "#1a1a1a", 
          fg = "#bbbbbb",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "LspInfoTitle", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "LspInfoList", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        
        -- Diagnostic popups
        vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { 
          bg = "#1a1a1a", 
          fg = "#cc6666",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { 
          bg = "#1a1a1a", 
          fg = "#81a2be",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { 
          bg = "#1a1a1a", 
          fg = "#8abeb7",
          blend = 20 
        })
        
        -- Command line and help popups
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
        
        -- Telescope and other floating windows
        vim.api.nvim_set_hl(0, "TelescopeNormal", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { 
          bg = "#1a1a1a", 
          fg = "#bbbbbb",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "TelescopeSelection", { 
          bg = "#333333", 
          fg = "#f8fe7a",
          blend = 20 
        })
        
        -- Force refresh of popup styling
        vim.cmd("hi clear Pmenu")
        vim.cmd("hi clear PmenuSel")
        vim.cmd("hi clear NormalFloat")
        vim.cmd("hi clear FloatBorder")
        
        -- Additional popup highlight groups
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#E0E0E0", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#f8fe7a", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#bbbbbb", bg = "NONE" })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bbbbbb", bg = "NONE" })
        
        -- Visual selection highlighting
        vim.api.nvim_set_hl(0, "Visual", { 
          bg = "#4a4a4a", 
          fg = "#ffffff",
          ctermbg = 240,
          ctermfg = 15
        })
        vim.api.nvim_set_hl(0, "VisualNOS", { 
          bg = "#4a4a4a", 
          fg = "#ffffff",
          ctermbg = 240,
          ctermfg = 15
        })
        vim.api.nvim_set_hl(0, "VisualNC", { 
          bg = "#3a3a3a", 
          fg = "#cccccc",
          ctermbg = 237,
          ctermfg = 252
        })
        
        -- Command line popup
        vim.api.nvim_set_hl(0, "Cmdline", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "CmdlineIcon", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "CmdlineIconSearch", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "CmdlineIconHelp", { 
          bg = "#1a1a1a", 
          fg = "#81a2be",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "CmdlineIconFilter", { 
          bg = "#1a1a1a", 
          fg = "#8abeb7",
          blend = 20 
        })
        
        -- Notify popup styling
        vim.api.nvim_set_hl(0, "NotifyBackground", { 
          bg = "#1a1a1a", 
          fg = "#E0E0E0",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "NotifyERRORBorder", { 
          bg = "#1a1a1a", 
          fg = "#cc6666",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "NotifyWARNBorder", { 
          bg = "#1a1a1a", 
          fg = "#f8fe7a",
          blend = 20 
        })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { 
          bg = "#1a1a1a", 
          fg = "#81a2be",
          blend = 20 
        })
        
      end,
      lazy = false,
      priority = 1000,
    },
  }
