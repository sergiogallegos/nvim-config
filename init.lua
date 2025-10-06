-- Cross-platform Neovim Configuration - Ultimate Setup
-- Works seamlessly on Windows, macOS, and Linux

-- Platform detection and setup
local platform = require("custom.platform")
platform.setup_platform_specific()

-- Basic settings
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Disable optional providers to reduce warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- Essential options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

-- File type settings
vim.filetype.add {
  extension = {
    h = "c",
    scheme = "scheme",
  },
}

-- Status line
vim.opt.laststatus = 2
vim.opt.statusline = "%#StatusLine# %f %h%w%m%r %=%y %l,%c %P"

-- ThePrimeagen's colorscheme approach
-- Will be set by the colors plugin

-- Essential keymaps
local set = vim.keymap.set

-- Basic navigation
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- Save and quit
set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Search
set("n", "<leader>s", "/", { desc = "Search" })
set("n", "<leader>S", "?", { desc = "Search backwards" })

-- Line numbers
set("n", "<leader>ln", function()
  vim.opt.number = not vim.opt.number
  vim.opt.relativenumber = not vim.opt.relativenumber
end, { desc = "Toggle line numbers" })

-- Transparency toggle (ThePrimeagen style)
set("n", "<leader>ct", function()
  require("custom.transparency").toggle_transparency()
end, { desc = "Toggle transparency" })

-- Auto-commands for persistence (ThePrimeagen style)
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Ultimate configuration - Best of ThePrimeagen + TJ DeVries
  { import = "custom.plugins.ultimate" },
  { import = "custom.plugins.lsp" },
  { import = "custom.plugins.git" },
  { import = "custom.plugins.colors" },
  
  -- Modern enhancements - Latest best practices
  { import = "custom.plugins.enhancements" },
  
  -- Cross-platform compatibility
  { import = "custom.plugins.cross-platform" },
  
  -- Advanced features from sergiogallegos/nvim-config
  { import = "custom.plugins.git-advanced" },
  { import = "custom.plugins.testing" },
  { import = "custom.plugins.code-execution" },
  { import = "custom.plugins.session-management" },
  { import = "custom.plugins.advanced-file-management" },
})

-- Initialize autogroups (ThePrimeagen style)
require("custom.autogroups").setup()

-- Initialize ultimate keymaps (Best of both worlds)
require("custom.ultimate-keymaps").setup()

-- Initialize enhanced keymaps (Modern best practices)
require("custom.enhanced-keymaps").setup()

-- Initialize diagnostic help
require("custom.diagnostic-help").setup()

-- Initialize platform-specific keymaps
platform.setup_platform_keymaps()

-- Debug platform info (optional)
vim.keymap.set("n", "<leader>pi", function() platform.debug_platform() end, { desc = "Debug platform info" })

-- Initialize transparency after colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Apply transparency after colorscheme is set
    require("custom.transparency").ColorMyPencils()
  end,
})