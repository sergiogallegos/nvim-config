-- Performance Optimizations - Speed up Neovim
return {
  -- Fast file operations
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  
  -- Faster startup
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end,
  },
  
  -- Optimized file tree (already configured in ultimate.lua)
  -- {
  --   "stevearc/oil.nvim",
  --   opts = {
  --     columns = { "icon", "permissions", "size", "mtime" },
  --     keymaps = {
  --       ["<C-h>"] = false,
  --       ["<C-l>"] = false,
  --     },
  --   },
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },
}
