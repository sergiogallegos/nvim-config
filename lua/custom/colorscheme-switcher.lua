-- Colorscheme Switcher for CustomBuddy variants
-- Provides easy switching between different CustomBuddy colorscheme variants

local M = {}

-- Function to check if a colorscheme exists
local function colorscheme_exists(name)
  local ok, _ = pcall(vim.cmd.colorscheme, name)
  return ok
end

-- Function to find index of item in table
local function tbl_indexof(tbl, item)
  for i, v in ipairs(tbl) do
    if v == item then
      return i
    end
  end
  return nil
end

-- Function to get available colorscheme variants
local function get_available_variants()
  local all_variants = {
    "custombuddy-rosepine", -- Rose Pine (beautiful, warm) - inspired by Rose Pine - DEFAULT
    "custombuddy",        -- Original (warm, comfortable)
    "custombuddy-craftz", -- Modern, vibrant (blue accents) - inspired by craftzdog
    "custombuddy-prime",  -- High contrast (green accents) - inspired by ThePrimeagen
    "custombuddy-tj",     -- Professional, subtle (blue accents) - inspired by tjdevries
    "custombuddy-cursor", -- Cursor IDE (clean, modern)
    "custombuddy-vscode", -- VS Code (professional, familiar)
    "custombuddy-xcode",  -- Xcode (Apple-inspired, macOS)
  }
  
  local available = {}
  for _, variant in ipairs(all_variants) do
    if colorscheme_exists(variant) then
      table.insert(available, variant)
    end
  end
  
  -- Fallback to basic colorschemes if no CustomBuddy variants are available
  if #available == 0 then
    local fallback = { "default", "desert", "slate", "darkblue", "delek", "elflord", "evening", "habamax", "industry", "koehler", "lunaperche", "morning", "murphy", "pablo", "peachpuff", "quiet", "ron", "shine", "torte", "zellner" }
    for _, variant in ipairs(fallback) do
      if colorscheme_exists(variant) then
        table.insert(available, variant)
      end
    end
  end
  
  return available
end

-- Get available variants
local variants = get_available_variants()

-- Current colorscheme index
local current_index = 1

-- Switch to next colorscheme variant
function M.next_colorscheme()
  current_index = current_index + 1
  if current_index > #variants then
    current_index = 1
  end
  M.set_colorscheme(variants[current_index])
end

-- Switch to previous colorscheme variant
function M.prev_colorscheme()
  current_index = current_index - 1
  if current_index < 1 then
    current_index = #variants
  end
  M.set_colorscheme(variants[current_index])
end

-- Set specific colorscheme variant
function M.set_colorscheme(name)
  local index = tbl_indexof(variants, name)
  if index then
    local ok, err = pcall(vim.cmd.colorscheme, name)
    if ok then
      current_index = index
      
      -- Ensure status line stays visible after colorscheme change
      vim.cmd("set laststatus=2")
      vim.cmd("redrawstatus")
      
      -- Re-initialize lualine after a small delay to ensure colorscheme is fully loaded
      vim.defer_fn(function()
        local ok, lualine = pcall(require, "lualine")
        if ok then
          -- Re-setup lualine with the proper configuration
          lualine.setup({
            options = {
              theme = 'auto',
              component_separators = { left = '', right = '' },
              section_separators = { left = '', right = '' },
              disabled_filetypes = {
                statusline = { 'alpha', 'dashboard', 'lazy', 'mason', 'TelescopePrompt' },
              },
              always_divide_middle = true,
              globalstatus = false,
              refresh = {
                statusline = 1000, -- Slower refresh for stability
              },
            },
            sections = {
              lualine_a = { 'mode' },
              lualine_b = { 'branch', 'diff', 'diagnostics' },
              lualine_c = { 'filename' },
              lualine_x = { 'encoding', 'fileformat', 'filetype' },
              lualine_y = { 'progress' },
              lualine_z = { 'location' }
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = { 'filename' },
              lualine_x = { 'location' },
              lualine_y = {},
              lualine_z = {}
            },
            -- Performance optimizations
            performance = {
              smart_caching = { enabled = true },
              lazy_loading = { enabled = true },
            },
          })
          lualine.refresh()
        end
      end, 150)
      
      vim.notify("Colorscheme: " .. name, vim.log.levels.INFO)
    else
      vim.notify("Failed to load colorscheme: " .. name .. " - " .. tostring(err), vim.log.levels.ERROR)
    end
  else
    vim.notify("Unknown colorscheme: " .. name, vim.log.levels.ERROR)
  end
end

-- Internal function to ensure status line is visible
function M._ensure_status_line_visible()
  -- Force status line to stay visible
  vim.cmd("set laststatus=2")
  vim.cmd("redrawstatus")
  
  -- Simple status line colors - no complex re-initialization
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1a1a1a", fg = "#f8f8f2", ctermbg = 0, ctermfg = 7 })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1a1a1a", fg = "#e0e0e0", ctermbg = 0, ctermfg = 7 })
end

-- Internal function to re-initialize lualine-max
function M._reinitialize_lualine()
  local ok, lualine = pcall(require, "lualine")
  if ok then
    -- Clear any existing status line configuration
    vim.o.statusline = ""
    
    -- Re-setup lualine with the same configuration
    local setup_ok, setup_err = pcall(function()
      lualine.setup({
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = { 'alpha', 'dashboard', 'lazy', 'mason', 'TelescopePrompt' },
          },
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000, -- Slower refresh for stability
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        -- Performance optimizations
        performance = {
          smart_caching = { enabled = true },
          lazy_loading = { enabled = true },
        },
      })
    end)
    
    if setup_ok then
      -- Force refresh of lualine
      lualine.refresh()
      vim.notify("Lualine re-initialized successfully", vim.log.levels.INFO)
    else
      vim.notify("Failed to re-initialize lualine: " .. tostring(setup_err), vim.log.levels.ERROR)
    end
  else
    vim.notify("Lualine not available", vim.log.levels.WARN)
  end
end

-- Get current colorscheme name
function M.get_current_colorscheme()
  return variants[current_index]
end

-- List all available variants
function M.list_variants()
  local list = {}
  for i, variant in ipairs(variants) do
    local marker = (i == current_index) and " → " or "   "
    table.insert(list, marker .. variant)
  end
  return list
end

-- Refresh available variants (useful after updating colorbuddy)
function M.refresh_variants()
  variants = get_available_variants()
  current_index = 1
  vim.notify("Refreshed colorscheme variants. Found " .. #variants .. " available.", vim.log.levels.INFO)
end

-- Fix status line visibility (useful when it disappears)
function M.fix_status_line()
  M._ensure_status_line_visible()
  vim.notify("Status line fixed", vim.log.levels.INFO)
end

-- Re-initialize lualine-max (useful when formatting is lost)
function M.reinitialize_lualine()
  M._reinitialize_lualine()
  vim.notify("Lualine-max re-initialized", vim.log.levels.INFO)
end

-- Show colorscheme picker using telescope
function M.picker()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "CustomBuddy Colorschemes",
    finder = finders.new_table({
      results = variants,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        M.set_colorscheme(selection.value)
      end)
      return true
    end,
  }):find()
end

return M
