-- Colorscheme Switcher - Professional color management
local M = {}

-- Available colorschemes (ThePrimeagen style)
local colorschemes = {
  "rose-pine",  -- ThePrimeagen's colorscheme
  "default",    -- Vim default (fallback)
  "tokyonight", -- Alternative
}

local current_index = 1

-- Switch to next colorscheme
function M.next_colorscheme()
  current_index = current_index + 1
  if current_index > #colorschemes then
    current_index = 1
  end
  
  local colorscheme = colorschemes[current_index]
  local ok = pcall(function()
    vim.cmd("colorscheme " .. colorscheme)
  end)
  
  if ok then
    vim.notify("Colorscheme: " .. colorscheme, vim.log.levels.INFO)
  else
    vim.notify("Failed to set colorscheme: " .. colorscheme .. ", using default", vim.log.levels.WARN)
    vim.cmd("colorscheme default")
    current_index = 1
  end
end

-- Switch to previous colorscheme
function M.prev_colorscheme()
  current_index = current_index - 1
  if current_index < 1 then
    current_index = #colorschemes
  end
  
  local colorscheme = colorschemes[current_index]
  local ok = pcall(function()
    vim.cmd("colorscheme " .. colorscheme)
  end)
  
  if ok then
    vim.notify("Colorscheme: " .. colorscheme, vim.log.levels.INFO)
  else
    vim.notify("Failed to set colorscheme: " .. colorscheme .. ", using default", vim.log.levels.WARN)
    vim.cmd("colorscheme default")
    current_index = 1
  end
end

-- Set specific colorscheme
function M.set_colorscheme(name)
  if vim.tbl_contains(colorschemes, name) then
    local ok = pcall(function()
      vim.cmd("colorscheme " .. name)
    end)
    
    if ok then
      current_index = vim.tbl_indexof(colorschemes, name)
      vim.notify("Colorscheme: " .. name, vim.log.levels.INFO)
    else
      vim.notify("Failed to set colorscheme: " .. name .. ", using default", vim.log.levels.WARN)
      vim.cmd("colorscheme default")
      current_index = 1
    end
  else
    vim.notify("Colorscheme not found: " .. name, vim.log.levels.ERROR)
  end
end

-- Get current colorscheme
function M.get_current_colorscheme()
  return colorschemes[current_index]
end

-- List available colorschemes
function M.list_colorschemes()
  vim.notify("Available colorschemes: " .. table.concat(colorschemes, ", "), vim.log.levels.INFO)
end

return M