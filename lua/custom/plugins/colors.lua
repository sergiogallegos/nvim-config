-- Colorscheme Configuration - ThePrimeagen style (rose-pine)
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
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
        },
      })
      
      -- Apply the colorscheme
      vim.cmd("colorscheme rose-pine")
      
      -- Apply transparency after colorscheme is set
      vim.defer_fn(function()
        require("custom.transparency").ColorMyPencils()
      end, 100)
    end,
  },
}