return {
  {
    "lewis6991/impatient.nvim",
    priority = 1000,
    config = function()
      local ok, impatient = pcall(require, "impatient")
      if not ok then
        vim.notify("Failed to load impatient.nvim", vim.log.levels.ERROR)
        return
      end
      impatient.enable_profile()
    end,
  },
  {
    "nathom/filetype.nvim",
    event = "VeryLazy",
    config = function()
      local ok, filetype = pcall(require, "filetype")
      if not ok then
        vim.notify("Failed to load filetype.nvim", vim.log.levels.ERROR)
        return
      end
      filetype.setup()
    end,
  },
}
