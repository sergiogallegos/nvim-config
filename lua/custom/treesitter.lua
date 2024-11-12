local M = {}

M.setup = function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = { "java", "python", "c", "cpp", "rust", "go" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

return M
