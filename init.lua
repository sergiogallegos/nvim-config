-- Cross-platform Neovim Configuration - Ultimate Setup
-- Works seamlessly on Windows, macOS, and Linux

-- Platform detection and setup
local platform = require "custom.platform"
platform.setup_platform_specific()

-- Basic settings
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.g.transparent_background = false

-- Suppress lspconfig deprecation warnings globally
vim.g.lspconfig_deprecation_warning = false

-- Override vim.notify to filter out deprecation warnings
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
    if msg and (string.find(msg, "deprecated") or string.find(msg, "lspconfig")) then
        return
    end
    return original_notify(msg, level, opts)
end

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

-- Enhanced Status line with full file path
vim.opt.laststatus = 2
vim.opt.statusline = "%#StatusLine# %F %h%w%m%r %=%y %l,%c %P"

-- ThePrimeagen's colorscheme approach
-- Will be set by the colors plugin

-- Auto-commands for persistence (ThePrimeagen style)
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.number = true
        vim.opt.relativenumber = true
    end,
})

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup {
    -- Ultimate configuration - Best of ThePrimeagen + TJ DeVries
    { import = "custom.plugins.ultimate" },
    { import = "custom.plugins.lsp" },
    { import = "custom.plugins.completion" },
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

    -- AI Assistant
    { import = "custom.plugins.luca" },

    -- NEW: Enhanced configurations (temporarily disabled for debugging)
    -- { import = "custom.plugins.performance" },
    -- { import = "custom.plugins.development" },
    -- { import = "custom.plugins.rust-enhanced" },
    -- { import = "custom.plugins.ui-enhanced" },

    -- Tabline with close buttons
    { import = "custom.plugins.tabline" },
}

-- Initialize autogroups (ThePrimeagen style)
require("custom.autogroups").setup()

-- Initialize enhanced keymaps (Modern best practices)
require("custom.enhanced-keymaps").setup()

-- Initialize diagnostic help
require("custom.diagnostic-help").setup()

-- Initialize platform-specific keymaps
platform.setup_platform_keymaps()

-- Debug platform info (optional)
vim.keymap.set("n", "<leader>pi", function()
    platform.debug_platform()
end, { desc = "Debug platform info" })

-- Keep light terminal colors opaque by default. Toggle with <leader>ct.
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        if vim.g.transparent_background then
            require("custom.transparency").ColorMyPencils()
        end
    end,
})
