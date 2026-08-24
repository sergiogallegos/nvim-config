-- Cross-platform Transparency Configuration
local M = {}
local platform = require "custom.platform"

-- Cross-platform transparency function
function M.ColorMyPencils(color)
    vim.g.transparent_background = true
    -- Only set transparency, don't change colorscheme
    -- The colorscheme will be set by the colors plugin

    -- Set transparency (cross-platform)
    local function make_transparent(group)
        local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
        highlight.bg = nil
        vim.api.nvim_set_hl(0, group, highlight)
    end

    make_transparent "Normal"
    make_transparent "NormalFloat"
    make_transparent "NormalNC"
    make_transparent "EndOfBuffer"

    -- Platform-specific transparency settings
    if platform.is_windows then
        -- Windows PowerShell transparency
        make_transparent "MsgArea"
        make_transparent "MoreMsg"
        make_transparent "Question"
    end

    make_transparent "StatusLine"
    make_transparent "StatusLineNC"
end

-- Cross-platform toggle transparency
function M.toggle_transparency()
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    if normal_bg == nil then
        vim.g.transparent_background = false
        vim.cmd.colorscheme(
            vim.g.colors_name or (vim.o.background == "dark" and "emacs-default-dark" or "emacs-default")
        )
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
