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
  
  -- === USEFUL COMMANDS ===
  -- :lua vim.diagnostic.show() - Show all diagnostics
  -- :lua vim.diagnostic.hide() - Hide all diagnostics
  -- :lua vim.diagnostic.reset() - Reset diagnostics
  -- :lua vim.diagnostic.get(0) - Get diagnostics for current buffer
  
  -- === TROUBLE.NVIM USAGE ===
  -- 1. Press <leader>xx to open Trouble
  -- 2. Navigate with j/k
  -- 3. Press <Enter> to jump to the diagnostic
  -- 4. Press q to close Trouble
  -- 5. Use <leader>xw for workspace-wide diagnostics
  -- 6. Use <leader>xd for current document diagnostics
end

return M
