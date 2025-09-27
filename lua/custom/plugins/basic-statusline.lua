return {
  {
    "nvim-lualine/lualine.nvim", -- Dummy plugin
    config = function()
      -- Set up minimalist status line with colorbuddy theme colors
      vim.cmd("set laststatus=2")
      vim.cmd("set statusline=")
      
      -- Define colors that match colorbuddy theme
      vim.cmd("hi StatusLine guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineNC guibg=#1a1a1a guifg=#bbbbbb")
      
      -- Create a custom status line function with minimalist formatting
      local function minimalist_statusline()
        local mode = vim.fn.mode()
        local mode_colors = {
          n = "#4ecdc4", -- Teal for normal
          v = "#feca57", -- Yellow for visual
          V = "#feca57", -- Yellow for visual line
          ["\22"] = "#feca57", -- Yellow for visual block
          i = "#ff6b6b", -- Red for insert
          R = "#ff9ff3", -- Pink for replace
          c = "#54a0ff", -- Blue for command
          t = "#96ceb4", -- Green for terminal
        }
        
        local mode_icons = {
          n = "N",
          v = "V", 
          V = "V",
          ["\22"] = "V",
          i = "I",
          R = "R",
          c = "C",
          t = "T",
        }
        
        local mode_color = mode_colors[mode] or "#bbbbbb"
        local mode_icon = mode_icons[mode] or "?"
        
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
        
        -- Build minimalist status line
        local status = ""
        status = status .. "%#StatusLineMode# " .. mode_icon .. " %*"
        status = status .. "%#StatusLineFilename# " .. filename .. " %*"
        if filetype ~= "text" then
          status = status .. "%#StatusLineFiletype# " .. filetype .. " %*"
        end
        status = status .. "%="
        status = status .. "%#StatusLineLocation# " .. line .. "," .. col .. " %*"
        status = status .. "%#StatusLineProgress# " .. percent .. "%% %*"
        
        return status
      end
      
      -- Set up highlight groups for different parts
      vim.cmd("hi StatusLineMode guibg=#4ecdc4 guifg=#000000 gui=bold")
      vim.cmd("hi StatusLineFilename guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineFiletype guibg=#2d2d2d guifg=#bbbbbb")
      vim.cmd("hi StatusLineLocation guibg=#2d2d2d guifg=#E0E0E0")
      vim.cmd("hi StatusLineProgress guibg=#2d2d2d guifg=#f8fe7a")
      
      -- Set the status line
      vim.opt.statusline = "%!v:lua.minimalist_statusline()"
      
      -- Make the function available globally
      _G.minimalist_statusline = minimalist_statusline
      
      -- Force refresh
      vim.cmd("redrawstatus")
    end,
    lazy = false,
    priority = 10000, -- Highest possible priority
  },
}
