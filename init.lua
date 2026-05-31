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

-- Neovim 0.12 provider health checks call this helper, but some Windows
-- release/runtime combinations can miss it. Define the expected behavior here
-- so :checkhealth reports disabled providers instead of crashing.
if vim.health and vim.health.provider_disabled == nil then
    vim.health.provider_disabled = function(provider)
        if vim.g["loaded_" .. provider .. "_provider"] == 0 then
            vim.health.ok(provider .. " provider disabled")
            return true
        end
        return false
    end
end

-- Disable optional language providers to reduce warnings and startup work.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

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

-- Status line (lualine provides the active statusline; this is a fallback)
vim.opt.laststatus = 2

-- Auto-commands to keep line numbers on
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

require("lazy").setup({
    -- Core editing: navigation, syntax, statusline, diagnostics
    { import = "custom.plugins.ultimate" },
    { import = "custom.plugins.lsp" },
    { import = "custom.plugins.completion" },
    { import = "custom.plugins.git" },
    { import = "custom.plugins.colors" },

    -- A small, curated set of editing helpers (mini.pairs / mini.surround)
    { import = "custom.plugins.enhancements" },

    -- File explorer (oil), formatting (conform), buffer tabline
    { import = "custom.plugins.advanced-file-management" },
    { import = "custom.plugins.formatting" },
    { import = "custom.plugins.tabline" },
}, {
    rocks = {
        enabled = false,
    },
})

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
