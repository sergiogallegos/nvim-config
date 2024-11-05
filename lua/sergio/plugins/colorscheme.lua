return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    -- Set up Rose Pine with custom options
    require("rose-pine").setup({
      variant = "main",                   -- Options: "auto", "main", "moon", "dawn"
      dark_variant = "main",              -- Dark variant option
      dim_inactive_windows = false,       -- Dim inactive windows if desired
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,         -- For compatibility with older Neovim versions
        migrations = true,                -- Enable handling of deprecated options
      },

      styles = {
        bold = true,
        italic = false,                   -- Disable italics if preferred
        transparency = true,              -- Set transparency
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
        -- Customize the palette if needed for specific variants
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
      },

      highlight_groups = {
        -- Customize specific highlight groups if needed
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Example customization of highlight groups
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        -- Customize colors dynamically if desired
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme rose-pine")
  end,
}
