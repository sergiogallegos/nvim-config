-- Colorscheme Configuration
--
-- Default: `emacs-default` (lua/../colors/emacs-default.lua) — GNU Emacs's
-- default font-lock hues, tuned for modern development (purple keywords, blue
-- functions, dark gray comments, accessible diagnostics) on a white background.
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

            -- Apply the local Emacs-inspired colorscheme by default.
            vim.cmd "colorscheme emacs-default"
        end,
    },
}
