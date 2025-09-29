local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

-- Suppress deprecation warnings
vim.g.lspconfig_suppress_deprecation_warning = true
vim.g.lspconfig_disable_deprecation_warning = true

-- Disable optional providers to reduce warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Suppress vim.deprecated warnings
vim.deprecate = function() end

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

require("lazy").setup({ 
  import = "custom/plugins" 
}, { 
  change_detection = { 
    notify = false,
    enabled = true,
  },
  install = {
    missing = true,
    -- colorscheme is handled manually in lua/custom/plugins/colorschemes.lua
  },
  ui = {
    border = "rounded",
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
