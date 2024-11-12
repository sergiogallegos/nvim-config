-- lua/treesitter.lua

local M = {}

M.setup = function()
  local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

  require("nvim-treesitter.configs").setup {
    -- ensure_installed = { "core", "stable" },
    highlight = {
      enable = true, -- Enable Treesitter syntax highlighting
    },
  }

  local syntax_on = {
    elixir = true,
    php = true,
  }

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
      local bufnr = args.buf
      local ft = vim.bo[bufnr].filetype
      pcall(vim.treesitter.start)

      if syntax_on[ft] then
        vim.bo[bufnr].syntax = "on"
      end
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
      local parsers = require "nvim-treesitter.parsers"

      -- Remove the lua parser customization since plugins/tree-sitter-lua is missing
      -- You can add it back here if you set up a tree-sitter-lua parser in the future

      parsers.cram = {
        tier = 0,

        ---@diagnostic disable-next-line: missing-fields
        install_info = {
          path = "~/git/tree-sitter-cram",
          files = { "src/parser.c" },
        },
      }

      parsers.reason = {
        tier = 0,

        ---@diagnostic disable-next-line: missing-fields
        install_info = {
          url = "https://github.com/reasonml-editor/tree-sitter-reason",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
      }

      parsers.ocaml_mlx = {
        tier = 0,

        install_info = {
          location = "grammars/mlx",
          url = "https://github.com/ocaml-mlx/tree-sitter-mlx",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
        filetype = "ocaml.mlx",
      }
    end,
  })
end

M.setup()

return M
