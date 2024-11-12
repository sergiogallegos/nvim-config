return {
    -- Lazy.nvim itself, usually managed externally, so not needed here unless used for custom configurations.
  
    -- Plenary: A required dependency for many plugins
    { "nvim-lua/plenary.nvim" },
  
    -- Treesitter for syntax highlighting
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "lua", "python", "javascript" }, -- Add languages as needed
          highlight = { enable = true },
        })
      end,
    },
  
    -- Telescope for fuzzy finding
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({})
      end,
    },
  
    -- LSP configurations
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup{} -- Python LSP setup as an example
      end,
    },
}
  