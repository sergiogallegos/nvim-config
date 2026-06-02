-- Colorscheme Configuration
--
-- Default: `emacs-default` (lua/../colors/emacs-default.lua) — a faithful port
-- of vanilla GNU Emacs's default font-lock faces (purple keywords, blue
-- functions, firebrick comments, etc.) on a white background.
--
-- Modus is kept installed as a fallback you can switch to any time with
-- `:colorscheme modus_operandi` (or `modus_vivendi` for the dark variant).
return {
    {
        "miikanissi/modus-themes.nvim",
        name = "modus-themes",
        priority = 1000,
        config = function()
            require("modus-themes").setup {
                style = "modus_operandi",
                transparent = false,
                dim_inactive = false,
                styles = {
                    comments = { italic = false },
                },
            }

            -- Apply the local original-Emacs colorscheme by default.
            vim.cmd "colorscheme emacs-default"
        end,
    },
}
