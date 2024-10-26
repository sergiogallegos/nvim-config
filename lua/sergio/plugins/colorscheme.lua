return {
  "Mofiqul/vscode.nvim",
  name = "vscode",
  priority = 1000,
  config = function()
    -- Set up VSCode Dark theme with custom options if needed
    require('vscode').setup({
      -- Enable transparent background
      transparent = true,

      -- Enable italic comments
      italic_comments = false,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Override highlight groups
      color_overrides = {
        vscLineNumber = '#5c6370',  -- Customize the line number color
      },

      group_overrides = {
        -- Customize specific highlight groups
        Comment = { fg = '#6a9955', italic = true }, -- Italic green comments
        Function = { fg = '#dcdcaa', bold = true },  -- Yellow functions
        String = { fg = '#ce9178' },                -- Orange for strings
        Keyword = { fg = '#569cd6', italic = true }, -- Blue for keywords
        Error = { fg = '#f44747', bold = true },      -- Red for errors
      },
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme vscode")
  end,
}

