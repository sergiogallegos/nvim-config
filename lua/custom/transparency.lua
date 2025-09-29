-- Transparency configuration for Neovim
-- Provides easy transparency management for terminal backgrounds

local M = {}

-- Current transparency state
local is_transparent = true

-- Enable transparency
function M.enable_transparency()
  -- Main editor background
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
  
  -- Line numbers and cursor
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE", ctermbg = "NONE" })
  
  -- Folding
  vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", ctermbg = "NONE" })
  
  -- Splits
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", ctermbg = "NONE" })
  
  is_transparent = true
  vim.notify("Transparency enabled", vim.log.levels.INFO)
end

-- Disable transparency (solid background)
function M.disable_transparency()
  local bg_color = "#1a1a1a"
  local fg_color = "#f8f8f2"
  
  -- Main editor background
  vim.api.nvim_set_hl(0, "Normal", { bg = bg_color, fg = fg_color })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color, fg = fg_color })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg_color, fg = fg_color })
  
  -- Line numbers and cursor
  vim.api.nvim_set_hl(0, "SignColumn", { bg = bg_color, fg = "#6a6a6a" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = bg_color, fg = "#6a6a6a" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = bg_color, fg = "#f1fa8c" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2a2a2a" })
  
  -- Folding
  vim.api.nvim_set_hl(0, "Folded", { bg = bg_color, fg = "#6a6a6a" })
  vim.api.nvim_set_hl(0, "FoldColumn", { bg = bg_color, fg = "#6a6a6a" })
  
  -- Splits
  vim.api.nvim_set_hl(0, "VertSplit", { bg = bg_color, fg = "#7daea3" })
  vim.api.nvim_set_hl(0, "WinSeparator", { bg = bg_color, fg = "#7daea3" })
  
  is_transparent = false
  vim.notify("Transparency disabled", vim.log.levels.INFO)
end

-- Toggle transparency
function M.toggle_transparency()
  if is_transparent then
    M.disable_transparency()
  else
    M.enable_transparency()
  end
end

-- Get current transparency state
function M.is_transparent()
  return is_transparent
end

-- Set transparency state
function M.set_transparency(state)
  if state then
    M.enable_transparency()
  else
    M.disable_transparency()
  end
end

return M
