return {
  "sainnhe/gruvbox-material",
  name = "gruvbox-material",
  priority = 1000,
  config = function()
    -- Set up Gruvbox Material with custom options
    vim.g.gruvbox_material_background = "soft" -- Options: 'hard', 'medium', 'soft'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_transparent_background = 1 -- Enable transparency
    vim.g.gruvbox_material_disable_italic_comment = 1

    -- Apply the colorscheme
    vim.cmd("colorscheme gruvbox-material")
  end,
}
