return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "main",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },

      palette = {
        base = "#2a273f", -- Slightly lighter base for contrast
        overlay = "#3e3b5e",
        surface = "#4a456e",
        muted = "#8e86a3", -- Lightened muted color
        subtle = "#b0a4c1", -- Lightened subtle color
        love = "#f2b3b6", -- Lighter red/pink
        gold = "#f9e0b7", -- Lighter gold
        rose = "#f7d3dc", -- Soft pink
        pine = "#b0e3db", -- Light green/teal
        foam = "#a6e2f0", -- Light blue
        iris = "#c8b9f7", -- Light violet
      },

      highlight_groups = {
        -- Transparent backgrounds for main elements
        Normal = { bg = "NONE", fg = "#e0def4" },
        NormalNC = { bg = "NONE", fg = "#e0def4" },
        LineNr = { bg = "NONE", fg = "#e0def4" },
        VertSplit = { fg = "#4a456e", bg = "NONE" },
        StatusLine = { bg = "NONE", fg = "#e0def4" },
        SignColumn = { bg = "NONE" },

        -- Lighter text for improved visibility
        Comment = { fg = "#a6e2f0" }, -- Lightened for readability
        String = { fg = "#f9e0b7" },
        Function = { fg = "#c8b9f7" },
        Keyword = { fg = "#f7d3dc" },

        -- Disable selection highlighting in file tree
        NvimTreeCursorLine = { bg = "NONE" }, -- For nvim-tree
        NvimTreeVertSplit = { bg = "NONE" },
        NERDTreeCursorLine = { bg = "NONE" }, -- For NERDTree (if applicable)
        NERDTreeDir = { fg = "#c8b9f7" },
      },

      before_highlight = function(group, highlight, palette)
        -- Additional highlight adjustments if needed
      end,
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme rose-pine")
    vim.opt.cursorline = false -- Disabling line highlighting
  end,
}
