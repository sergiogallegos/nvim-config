-- Diagnostic Help - How to read error messages
local M = {}

function M.setup()
  -- === HOW TO READ DIAGNOSTIC MESSAGES ===
  
  -- 1. Hover over the error indicator (E, W, H, I) to see the message
  -- 2. Use Trouble.nvim to see all diagnostics in a list
  -- 3. Use built-in Neovim commands for diagnostics
  
  -- === KEYMAPS FOR READING DIAGNOSTICS ===
  local set = vim.keymap.set
  
  -- Hover over diagnostic to see message
  set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
  
  -- Navigate between diagnostics
  set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
  set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  
  -- Show all diagnostics in current line
  set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
  
  -- Show diagnostics in location list
  set("n", "<leader>dL", vim.diagnostic.setloclist, { desc = "Show diagnostics in location list" })
  
  -- Show diagnostics in quickfix list
  set("n", "<leader>dQ", vim.diagnostic.setqflist, { desc = "Show diagnostics in quickfix list" })
  
  -- === TROUBLE.NVIM DIAGNOSTIC VIEWER ===
  -- These are already configured in ultimate.lua:
  -- <leader>xx - Toggle trouble
  -- <leader>xw - Workspace diagnostics
  -- <leader>xd - Document diagnostics
  -- <leader>xl - Location list
  -- <leader>xq - Quickfix list
  
  -- === DIAGNOSTIC CONFIGURATION ===
  -- Configure diagnostic appearance
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●", -- Change the prefix for virtual text
      spacing = 4,
    },
    signs = true, -- Show E, W, H, I indicators
    underline = true, -- Underline problematic code
    update_in_insert = false, -- Don't update while typing
    severity_sort = true, -- Sort by severity
    float = {
      border = "rounded",
      source = "always", -- Show source of diagnostic
      header = "",
      prefix = function(diagnostic)
        local icons = {
          [vim.diagnostic.severity.ERROR] = "❌ ",
          [vim.diagnostic.severity.WARN] = "⚠️ ",
          [vim.diagnostic.severity.INFO] = "ℹ️ ",
          [vim.diagnostic.severity.HINT] = "💡 ",
        }
        return icons[diagnostic.severity] or "● "
      end,
    },
  })
  
  -- === DIAGNOSTIC SEVERITY LEVELS ===
  -- E = Error (red) - Critical issues that prevent compilation
  -- W = Warning (yellow) - Issues that might cause problems
  -- I = Info (blue) - Informational messages
  -- H = Hint (green) - Suggestions for improvement
  
  -- === DIAGNOSTIC TOGGLE FUNCTIONALITY ===
  local diagnostic_visible = true
  
  -- Toggle diagnostic visibility
  local function toggle_diagnostics()
    if diagnostic_visible then
      vim.diagnostic.hide()
      diagnostic_visible = false
      vim.notify("Diagnostics hidden", vim.log.levels.INFO)
    else
      vim.diagnostic.show()
      diagnostic_visible = true
      vim.notify("Diagnostics shown", vim.log.levels.INFO)
    end
  end
  
  -- Toggle specific diagnostic types
  local function toggle_diagnostic_type(severity)
    local current_config = vim.diagnostic.config()
    local severity_map = {
      error = vim.diagnostic.severity.ERROR,
      warn = vim.diagnostic.severity.WARN,
      info = vim.diagnostic.severity.INFO,
      hint = vim.diagnostic.severity.HINT,
    }
    
    if not current_config.severity_filter then
      current_config.severity_filter = {}
    end
    
    local target_severity = severity_map[severity]
    if current_config.severity_filter.min == target_severity then
      -- Currently showing this severity, hide it
      current_config.severity_filter.min = target_severity + 1
      vim.notify(severity:gsub("^%l", string.upper) .. " diagnostics hidden", vim.log.levels.INFO)
    else
      -- Show this severity and above
      current_config.severity_filter.min = target_severity
      vim.notify(severity:gsub("^%l", string.upper) .. " diagnostics shown", vim.log.levels.INFO)
    end
    
    vim.diagnostic.config(current_config)
  end
  
  -- Keymaps for diagnostic toggles
  set("n", "<leader>dt", toggle_diagnostics, { desc = "Toggle all diagnostics" })
  set("n", "<leader>de", function() toggle_diagnostic_type("error") end, { desc = "Toggle error diagnostics" })
  set("n", "<leader>dw", function() toggle_diagnostic_type("warn") end, { desc = "Toggle warning diagnostics" })
  set("n", "<leader>di", function() toggle_diagnostic_type("info") end, { desc = "Toggle info diagnostics" })
  set("n", "<leader>dh", function() toggle_diagnostic_type("hint") end, { desc = "Toggle hint diagnostics" })
  
  -- Additional diagnostic commands
  set("n", "<leader>ds", function() 
    vim.diagnostic.config({ signs = not vim.diagnostic.config().signs })
    vim.notify("Diagnostic signs " .. (vim.diagnostic.config().signs and "enabled" or "disabled"), vim.log.levels.INFO)
  end, { desc = "Toggle diagnostic signs (E, W, H, I)" })
  
  set("n", "<leader>du", function()
    local current_config = vim.diagnostic.config()
    vim.diagnostic.config({ underline = not current_config.underline })
    vim.notify("Diagnostic underlines " .. (vim.diagnostic.config().underline and "enabled" or "disabled"), vim.log.levels.INFO)
  end, { desc = "Toggle diagnostic underlines" })
  
  set("n", "<leader>dv", function()
    local current_config = vim.diagnostic.config()
    vim.diagnostic.config({ virtual_text = not current_config.virtual_text })
    vim.notify("Diagnostic virtual text " .. (vim.diagnostic.config().virtual_text and "enabled" or "disabled"), vim.log.levels.INFO)
  end, { desc = "Toggle diagnostic virtual text" })
  
  -- === USEFUL COMMANDS ===
  -- :lua vim.diagnostic.show() - Show all diagnostics
  -- :lua vim.diagnostic.hide() - Hide all diagnostics
  -- :lua vim.diagnostic.reset() - Reset diagnostics
  -- :lua vim.diagnostic.get(0) - Get diagnostics for current buffer
  -- :lua require('custom.diagnostic-help').toggle_diagnostics() - Toggle diagnostics
  
  -- === TROUBLE.NVIM USAGE ===
  -- 1. Press <leader>xx to open Trouble
  -- 2. Navigate with j/k
  -- 3. Press <Enter> to jump to the diagnostic
  -- 4. Press q to close Trouble
  -- 5. Use <leader>xw for workspace-wide diagnostics
  -- 6. Use <leader>xd for current document diagnostics
end

return M
