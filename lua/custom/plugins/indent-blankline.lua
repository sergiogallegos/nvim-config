return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    enabled = false, -- Temporarily disable to fix errors
    config = function()
      local ok, ibl = pcall(require, "ibl")
      if not ok then
        vim.notify("Failed to load indent-blankline", vim.log.levels.ERROR)
        return
      end
      
      ibl.setup({
        indent = {
          char = "▏",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
          char = "▏",
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
          buftypes = {
            "terminal",
            "nofile",
          },
        },
      })
    end,
  },
}