-- lua/custom/treesitter.lua

local M = {}

M.setup = function()
  -- Use this if you have custom parsers outside the standard Treesitter setup
  local parsers = require("nvim-treesitter.parsers")

  parsers.cram = {
    tier = 0,
    install_info = {
      path = "~/git/tree-sitter-cram",
      files = { "src/parser.c" },
    },
  }

  parsers.reason = {
    tier = 0,
    install_info = {
      url = "https://github.com/reasonml-editor/tree-sitter-reason",
      files = { "src/parser.c", "src/scanner.c" },
      branch = "master",
    },
  }

end

return M
