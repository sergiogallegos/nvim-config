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
        
        -- Set transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", ctermbg = "NONE" })
      end,
      lazy = false,
      priority = 1000,
    },
  }
