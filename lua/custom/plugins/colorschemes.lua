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
        
        -- Choose your preferred colorscheme variant
        -- Available options (only if they exist):
        -- "custombuddy"        - Original (warm, comfortable)
        -- "custombuddy-craftz" - Modern, vibrant (blue accents) - inspired by craftzdog
        -- "custombuddy-prime"  - High contrast (green accents) - inspired by ThePrimeagen
        -- "custombuddy-tj"     - Professional, subtle (blue accents) - inspired by tjdevries
        -- "custombuddy-cursor" - Cursor IDE (clean, modern)
        -- "custombuddy-vscode" - VS Code (professional, familiar)
        -- "custombuddy-xcode"  - Xcode (Apple-inspired, macOS)
        -- "custombuddy-rosepine" - Rose Pine (beautiful, warm) - inspired by Rose Pine
        
        -- Try to load custombuddy-rosepine as default, fallback to custombuddy, then default
        local ok, err = pcall(vim.cmd.colorscheme, "custombuddy-rosepine")
        if not ok then
          -- Fallback to original custombuddy
          local ok2, err2 = pcall(vim.cmd.colorscheme, "custombuddy")
          if not ok2 then
            vim.notify("CustomBuddy not available, using default colorscheme. Error: " .. tostring(err2), vim.log.levels.WARN)
            vim.cmd.colorscheme("default")
          else
            vim.notify("Rose Pine not available, using original CustomBuddy. Error: " .. tostring(err), vim.log.levels.INFO)
          end
        end
        
        -- Ensure status line is visible after colorscheme load
        vim.cmd("set laststatus=2")
        vim.cmd("redrawstatus")
        
        -- Enable transparency for terminal backgrounds
        -- This overrides the colorscheme to make backgrounds truly transparent
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", ctermbg = "NONE" })
        
        -- Keep status line visible but with transparency
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1a1a1a", fg = "#f8f8f2", ctermbg = 0, ctermfg = 7 })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1a1a1a", fg = "#e0e0e0", ctermbg = 0, ctermfg = 7 })
        
        -- Make floating windows semi-transparent
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1a1a1a", fg = "#7daea3", blend = 20 })
        
        -- Make popup menus semi-transparent
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2a2a", fg = "#f1fa8c", blend = 20 })
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2a2a2a", blend = 20 })
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#7daea3", blend = 20 })
        
        -- Make telescope semi-transparent
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1a1a1a", fg = "#7daea3", blend = 20 })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1a1a1a", fg = "#f8f8f2", blend = 20 })
        vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2a2a2a", fg = "#f1fa8c", blend = 20 })
        
        -- Force status line to stay visible
        vim.cmd("set laststatus=2")
        vim.cmd("redrawstatus")
        
      end,
      lazy = false,
      priority = 1000,
    },
  }
