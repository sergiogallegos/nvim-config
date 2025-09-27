return {
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })

      vim.keymap.set("n", "]]", function()
        require("illuminate").goto_next_reference()
      end, { desc = "Next reference" })

      vim.keymap.set("n", "[[", function()
        require("illuminate").goto_prev_reference()
      end, { desc = "Prev reference" })
    end,
  },
}
