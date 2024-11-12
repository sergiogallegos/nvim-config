local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Set the correct runtime path for each OS
if is_windows then
  vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")  -- For Windows
else
  vim.opt.runtimepath:append("~/.local/share/nvim/site")
end

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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "custom/plugins" }, { change_detection = { notify = false } })
