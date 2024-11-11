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
        base = "#1c1b29", -- Dark base to complement WezTerm background
        overlay = "#282737", -- Slightly lighter overlay for contrast
        surface = "#333248", -- Soft, dark surface color
        muted = "#44415c", -- Muted dark gray
        subtle = "#5a576f", -- Slightly lighter for subtle highlights
        love = "#b87f9f", -- Brighter rose-pink for better readability
        gold = "#e8c080", -- Brighter pastel gold
        rose = "#d4a4b4", -- Soft rose for readability
        pine = "#a5c3c9", -- Light teal-gray for subtle highlights
        foam = "#9dc7de", -- Light blue-gray for function names
        iris = "#c3b1e3", -- Soft lavender-gray for parentheses/punctuation
      },

      highlight_groups = {
        -- Set transparent backgrounds and adjusted foregrounds
        Normal = { bg = "NONE", fg = "#e0def4" }, -- Light gray for readability
        NormalNC = { bg = "NONE", fg = "#e0def4" },
        LineNr = { bg = "NONE", fg = "#5a576f" }, -- Darker gray for line numbers
        VertSplit = { fg = "#333248", bg = "NONE" },
        StatusLine = { bg = "NONE", fg = "#e0def4" },
        SignColumn = { bg = "NONE" },

        -- Monochromatic and soft contrast text colors
        Comment = { fg = "#5a576f" }, -- Darker gray for comments
        String = { fg = "#d4a4b4" }, -- Soft rose for strings
        Function = { fg = "#9dc7de" }, -- Light blue-gray for functions
        Keyword = { fg = "#e8c080" }, -- Pastel gold for keywords
        Punctuation = { fg = "#c3b1e3" }, -- Lavender-gray for parentheses/punctuation

        -- Disable selection highlighting in file tree
        NvimTreeCursorLine = { bg = "NONE" },
        NvimTreeVertSplit = { bg = "NONE" },
        NERDTreeCursorLine = { bg = "NONE" },
        NERDTreeDir = { fg = "#e0def4" }, -- Light gray for directories
      },

      before_highlight = function(group, highlight, palette)
        -- Additional adjustments can be made here
      end,
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme rose-pine")
    vim.opt.cursorline = false -- Disable line highlighting
  end,
}
