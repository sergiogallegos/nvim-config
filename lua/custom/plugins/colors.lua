-- Colorscheme Configuration
--
-- `emacs-default` and `emacs-default-dark` preserve the same semantic
-- font-lock palette while following the system's light or dark appearance.
--
-- Modus is kept installed as a fallback you can switch to any time with
-- `:colorscheme modus_operandi` (or `modus_vivendi` for the dark variant).
return {
    {
        "miikanissi/modus-themes.nvim",
        name = "modus-themes",
        priority = 1000,
        config = function()
            local dark = vim.o.background == "dark"
            require("modus-themes").setup {
                style = dark and "modus_vivendi" or "modus_operandi",
                transparent = false,
                dim_inactive = false,
                styles = {
                    comments = { italic = false },
                },
            }

            vim.cmd.colorscheme(dark and "emacs-default-dark" or "emacs-default")
        end,
    },
}
