-- Keep the custom Emacs palette in light mode and use Gruvbox in dark mode.
-- `custom.appearance` applies the correct theme when the system changes.
return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup {
                terminal_colors = true,
                contrast = "",
                dim_inactive = false,
                transparent_mode = false,
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = false,
                    operators = false,
                    folds = true,
                },
            }

            vim.cmd.colorscheme(vim.o.background == "dark" and "gruvbox" or "emacs-default")
        end,
    },
}
