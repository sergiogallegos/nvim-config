-- Cross-platform Transparency Configuration
local M = {}
local platform = require "custom.platform"

-- Cross-platform transparency function
function M.ColorMyPencils(color)
    vim.g.transparent_background = true
    -- Only set transparency, don't change colorscheme
    -- The colorscheme will be set by the colors plugin

    -- Set transparency (cross-platform)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

    -- Platform-specific transparency settings
    if platform.is_windows then
        -- Windows PowerShell transparency
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
        vim.api.nvim_set_hl(0, "MoreMsg", { bg = "none" })
        vim.api.nvim_set_hl(0, "Question", { bg = "none" })
        -- Status line for Windows
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#575279" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#797593" })
    elseif platform.is_macos then
        -- macOS transparency
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#575279" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#797593" })
    else
        -- Linux transparency
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#575279" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#797593" })
    end
end

-- Cross-platform toggle transparency
function M.toggle_transparency()
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    if normal_bg == nil then
        -- Disable transparency with a light-friendly fallback background.
        vim.g.transparent_background = false
        local bg_color = "#faf4ed"
        vim.api.nvim_set_hl(0, "Normal", { bg = bg_color })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_color })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg_color })

        -- Platform-specific status line
        if platform.is_windows then
            vim.api.nvim_set_hl(0, "MsgArea", { bg = bg_color })
            vim.api.nvim_set_hl(0, "MoreMsg", { bg = bg_color })
            vim.api.nvim_set_hl(0, "Question", { bg = bg_color })
        end

        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#f2e9de", fg = "#575279" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#fffaf3", fg = "#797593" })
        vim.notify(
            "Transparency disabled ("
                .. (platform.is_windows and "Windows" or platform.is_macos and "macOS" or "Linux")
                .. ")",
            vim.log.levels.INFO
        )
    else
        -- Enable transparency
        M.ColorMyPencils()
        vim.notify(
            "Transparency enabled ("
                .. (platform.is_windows and "Windows" or platform.is_macos and "macOS" or "Linux")
                .. ")",
            vim.log.levels.INFO
        )
    end
end

-- Initialize transparency
function M.init()
    M.ColorMyPencils()
end

return M
