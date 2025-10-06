-- Autogroups - Professional autocmd management (ThePrimeagen style)
local M = {}

-- Create autogroup for organized autocmds
local function create_autogroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Yank highlighting (ThePrimeagen style)
function M.setup_yank_highlighting()
  local yank_group = create_autogroup("YankHighlight")
  
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({
        higroup = "IncSearch",
        timeout = 40,
      })
    end,
  })
end

-- Auto remove whitespace
function M.setup_whitespace_removal()
  local whitespace_group = create_autogroup("WhitespaceRemoval")
  
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = whitespace_group,
    pattern = "*",
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end,
  })
end

-- Auto resize splits
function M.setup_auto_resize()
  local resize_group = create_autogroup("AutoResize")
  
  vim.api.nvim_create_autocmd("VimResized", {
    group = resize_group,
    pattern = "*",
    callback = function()
      vim.cmd("wincmd =")
    end,
  })
end

-- Format on save for specific filetypes
function M.setup_format_on_save()
  local format_group = create_autogroup("FormatOnSave")
  
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = { "*.lua", "*.js", "*.ts", "*.json" },
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

-- Initialize all autogroups
function M.setup()
  M.setup_yank_highlighting()
  M.setup_whitespace_removal()
  M.setup_auto_resize()
  M.setup_format_on_save()
end

return M
