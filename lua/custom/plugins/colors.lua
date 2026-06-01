-- Colorscheme Configuration - Emacs Modus (modus-operandi light)
return {
    {
        "miikanissi/modus-themes.nvim",
        name = "modus-themes",
        priority = 1000,
        config = function()
            local ghostty_bg = "#FFFFFF"

            require("modus-themes").setup {
                style = "modus_operandi", -- light variant (Emacs default look)
                variant = "default", -- "default" | "tinted" | "deuteranopia" | "tritanopia"
                transparent = false,
                dim_inactive = false,

                styles = {
                    comments = { italic = false },
                    keywords = { bold = true },
                    functions = { bold = true },
                },

                -- Match the light terminal background and remove stray italics
                on_highlights = function(highlights, colors)
                    highlights.Normal = { bg = ghostty_bg }
                    highlights.NormalNC = { bg = ghostty_bg }
                    highlights.NormalFloat = { bg = ghostty_bg }
                    highlights.FloatBorder = { bg = ghostty_bg }
                    highlights.SignColumn = { bg = ghostty_bg }
                    highlights.StatusLine = { bg = ghostty_bg }
                    highlights.TabLineFill = { bg = ghostty_bg }
                end,
            }

            -- Apply the colorscheme
            vim.cmd "colorscheme modus_operandi"
        end,
    },
}
