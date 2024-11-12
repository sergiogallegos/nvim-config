return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java", "python", "c", "cpp", "rust", "go" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
