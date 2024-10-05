return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    -- Set your variant and configurations here
    require("rose-pine").setup({
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- Choose between "main", "moon", or "dawn"
      dim_inactive_windows = false, -- Keep inactive windows undimmed
      extend_background_behind_borders = true, -- Extend the background behind borders

      enable = {
        terminal = true, -- Enable Rose Pine for terminal
        legacy_highlights = true, -- For older Neovim versions
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true, -- Enable bold styling
        italic = false, -- Enable italic styling
        transparency = true, -- Transparency is disabled, set to true if needed
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {
        -- Optionally override specific colors for the moon variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
      },

      highlight_groups = {
        -- Customize specific highlight groups, for example:
        -- Comment = { fg = "foam", italic = true },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Example custom logic: Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end

        -- Change specific palette colors
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme rose-pine")
    -- Optionally use specific variants:
    -- vim.cmd("colorscheme rose-pine-main")
    -- vim.cmd("colorscheme rose-pine-moon")
    -- vim.cmd("colorscheme rose-pine-dawn")
  end,
}
