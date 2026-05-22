-- Colorscheme Configuration - ThePrimeagen style (rose-pine)
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            local ghostty_bg = "#FAFAFA"

            require("rose-pine").setup {
                variant = "dawn", -- light variant for light terminal backgrounds
                dark_variant = "main", -- main, moon, or dawn
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = true, -- Disable all italics

                -- Custom highlight groups (no italics, just bold)
                highlight_groups = {
                    -- Customize specific highlight groups
                    ["@keyword"] = { bold = true },
                    ["@function"] = { bold = true },
                    ["@string"] = { bold = true },
                    Normal = { bg = ghostty_bg },
                    NormalNC = { bg = ghostty_bg },
                    NormalFloat = { bg = ghostty_bg },
                    FloatBorder = { bg = ghostty_bg },
                    SignColumn = { bg = ghostty_bg },
                    StatusLine = { bg = ghostty_bg },
                    TabLineFill = { bg = ghostty_bg },
                },
            }

            -- Apply the colorscheme
            vim.cmd "colorscheme rose-pine"
        end,
    },
}
