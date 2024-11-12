return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "lua", "elixir", "php", 
          "java", "python", "c", "cpp", 
          "rust", "go", "typescript" 
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })

      -- Enable syntax for Elixir and PHP file types
      local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          local bufnr = args.buf
          local ft = vim.bo[bufnr].filetype
          local syntax_on = { elixir = true, php = true }
          if syntax_on[ft] then
            vim.bo[bufnr].syntax = "on"
          end
        end,
      })
    end,
  },
}
