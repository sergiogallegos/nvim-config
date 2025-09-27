return {
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    config = function()
      local ok, aerial = pcall(require, "aerial")
      if not ok then
        vim.notify("Failed to load aerial.nvim", vim.log.levels.ERROR)
        return
      end
      aerial.setup({
        layout = {
          max_width = { 40, 0.2 },
          width = nil,
          win_opts = {},
        },
        attach_mode = "window",
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,
        guides = {
          mid_item = "├─",
          last_item = "└─",
          nested_top = "│ ",
          whitespace = "  ",
        },
      })

      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggle Aerial" })
      vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { desc = "Previous symbol" })
      vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { desc = "Next symbol" })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}
