--[[
-- Setup initial configuration,
-- 
-- Primarily just download and execute lazy.nvim
--]]
vim.g.mapleader = ","
-- Enable true colors support
vim.opt.termguicolors = true
-- Treesitter runtime path
vim.opt.runtimepath:append("C:/Users/sheco/AppData/Local/nvim-data/site") -- on windows
-- vim.opt.runtimepath:append("~/.local/share/nvim/site") -- on macos

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom/plugins" }, {
  change_detection = {
    notify = false,
  },
})
