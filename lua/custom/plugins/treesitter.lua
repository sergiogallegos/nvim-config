return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        print("Failed to load nvim-treesitter.configs")
        return
      end

      configs.setup({
        ensure_installed = { "java", "python", "c", "cpp", "rust", "go" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
