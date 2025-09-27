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
        ensure_installed = { 
          "java", "python", "c", "cpp", "rust", "go", "lua", "javascript", 
          "typescript", "html", "css", "json", "yaml", "markdown", "bash", 
          "vim", "vimdoc", "sql", "toml", "dockerfile"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
      })
    end,
  },
}
