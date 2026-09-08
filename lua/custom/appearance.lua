local M = {}

local platform = require "custom.platform"

local themes = {
    light = "emacs-default",
    dark = "gruvbox",
}

local timer

local function normalized_mode(value)
    value = value and vim.trim(value):lower() or ""
    return themes[value] and value or nil
end

function M.detect()
    local override = normalized_mode(vim.env.NVIM_APPEARANCE)
    if override then
        return override
    end

    if platform.is_macos then
        local result = vim.system({ "/usr/bin/defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
        if result.code == 0 and normalized_mode(result.stdout) == "dark" then
            return "dark"
        end
    end

    return "light"
end

function M.sync()
    local mode = M.detect()
    local colorscheme = themes[mode]

    if vim.o.background == mode and vim.g.colors_name == colorscheme then
        return false
    end

    vim.o.background = mode
    vim.cmd.colorscheme(colorscheme)
    return true
end

function M.setup()
    local group = vim.api.nvim_create_augroup("SystemAppearance", { clear = true })

    vim.api.nvim_create_user_command("AppearanceSync", M.sync, {
        desc = "Synchronize Neovim colors with the system appearance",
    })

    vim.api.nvim_create_autocmd("FocusGained", {
        group = group,
        callback = M.sync,
        desc = "Synchronize colors when Neovim regains focus",
    })

    if platform.is_macos and normalized_mode(vim.env.NVIM_APPEARANCE) == nil then
        timer = vim.uv.new_timer()
        timer:start(2000, 2000, vim.schedule_wrap(M.sync))

        vim.api.nvim_create_autocmd("VimLeavePre", {
            group = group,
            once = true,
            callback = function()
                if timer and not timer:is_closing() then
                    timer:stop()
                    timer:close()
                end
            end,
        })
    end
end

return M
