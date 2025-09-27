return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Disable lualine completely and use built-in status line
      vim.cmd("set laststatus=2")
      vim.cmd("set statusline=")
      
      -- Create a custom status line function
      local function custom_statusline()
        local mode = vim.fn.mode()
        local mode_icons = {
          n = "🚀 NORMAL",
          v = "✂️ VISUAL", 
          V = "✂️ VISUAL LINE",
          ["\22"] = "✂️ VISUAL BLOCK",
          i = "✏️ INSERT",
          R = "🔄 REPLACE",
          c = "💬 COMMAND",
          t = "🖥️ TERMINAL",
        }
        
        local mode_text = mode_icons[mode] or "❓ " .. mode
        
        local filename = vim.fn.expand("%:t")
        if filename == "" then
          filename = "[No Name]"
        end
        
        local filetype = vim.bo.filetype
        if filetype == "" then
          filetype = "text"
        end
        
        local line = vim.fn.line(".")
        local col = vim.fn.col(".")
        local total_lines = vim.fn.line("$")
        local percent = math.floor((line / total_lines) * 100)
        
        local git_branch = ""
        local git_status = ""
        
        -- Try to get git info
        local git_dir = vim.fn.finddir(".git", ".;")
        if git_dir ~= "" then
          local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
          if branch ~= "" then
            git_branch = "🌿 " .. branch
          end
        end
        
        -- Build status line
        local status = ""
        status = status .. mode_text .. " │ "
        status = status .. filename .. " "
        if filetype ~= "text" then
          status = status .. "(" .. filetype .. ") "
        end
        status = status .. "│ "
        if git_branch ~= "" then
          status = status .. git_branch .. " │ "
        end
        status = status .. "📍 " .. line .. "," .. col .. " "
        status = status .. "📊 " .. percent .. "%"
        
        return status
      end
      
      -- Set the status line
      vim.opt.statusline = "%!v:lua.custom_statusline()"
      
      -- Make the function available globally
      _G.custom_statusline = custom_statusline
      
      -- Force refresh
      vim.cmd("redrawstatus")
    end,
    lazy = false,
    priority = 9999, -- Highest priority
  },
}
