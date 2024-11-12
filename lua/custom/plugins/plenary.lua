return {
  -- Ensure plenary.nvim is loaded first, as it’s a dependency for many plugins
  {
    "nvim-lua/plenary.nvim",
    priority = 1000, -- Make sure plenary loads first if required
  },

  -- Treesitter configuration with plenary as a dependency
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "java", "c", "cpp", "rust", "go", "typescript" },
        highlight = { enable = true },
      })
    end,
  },

  -- Telescope configuration with plenary as a dependency
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Example of another plugin using plenary as a dependency
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "make",
  },
}
