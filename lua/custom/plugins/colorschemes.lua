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
        
        -- Load Rose Pine as default colorscheme
        -- Simple and direct approach - no automatic switching
        -- 
        -- To change the default colorscheme in the future, simply replace the line below:
        -- vim.cmd.colorscheme("custombuddy-rosepine")
        -- 
        -- Available options:
        -- "custombuddy" - Original CustomBuddy
        -- "custombuddy-craftz" - Craftz variant
        -- "custombuddy-prime" - Prime variant  
        -- "custombuddy-tj" - TJ variant
        -- "custombuddy-cursor" - Cursor variant
        -- "custombuddy-vscode" - VS Code variant
        -- "custombuddy-xcode" - Xcode variant
        -- "custombuddy-rosepine" - Rose Pine variant (current default)
        
        -- Set transparent background immediately to prevent flash
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        
        -- Load Rose Pine immediately (no delay needed with native transparency)
        local ok, err = pcall(vim.cmd.colorscheme, "custombuddy-rosepine")
        if ok then
          vim.notify("Rose Pine colorscheme loaded successfully!", vim.log.levels.INFO)
        else
          vim.notify("Failed to load Rose Pine: " .. tostring(err) .. " - Using fallback", vim.log.levels.WARN)
          vim.cmd.colorscheme("custombuddy")
        end
        
        -- Ensure status line is visible after colorscheme load
        vim.cmd("set laststatus=2")
        vim.cmd("redrawstatus")
        
        -- Note: All CustomBuddy themes now have built-in transparency support
        -- Use <Space>ct to toggle transparency on/off
        -- Themes will automatically use transparent backgrounds when transparency is enabled
        -- Use <Space>cd to force solid backgrounds if needed
        
      end,
      lazy = false,
      priority = 1000,
    },
  }
