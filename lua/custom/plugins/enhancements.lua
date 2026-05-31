-- A deliberately small set of editing helpers.
-- Minimalist (Helix / Andrew Kelley) spirit: just enough to stay out of the way.
-- Commenting uses Neovim's built-in `gc`/`gcc` (0.10+), so no plugin is needed.
return {
    -- Auto-close brackets/quotes
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        config = function()
            require("mini.pairs").setup()
        end,
    },

    -- Surround: sa (add), sd (delete), sr (replace)
    {
        "echasnovski/mini.surround",
        keys = { "sa", "sd", "sr", "sf", "sF", "sh", "sn" },
        config = function()
            require("mini.surround").setup {
                mappings = {
                    add = "sa",
                    delete = "sd",
                    find = "sf",
                    find_left = "sF",
                    highlight = "sh",
                    replace = "sr",
                    update_n_lines = "sn",
                },
            }
        end,
    },
}
