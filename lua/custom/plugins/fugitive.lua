-- Git integration (ThePrimeagen style)
return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- Git keymaps (ThePrimeagen style)
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
      vim.keymap.set("n", "<leader>gp", function()
        vim.cmd("Git push")
      end, { desc = "Git push" })
      vim.keymap.set("n", "<leader>gP", function()
        vim.cmd("Git pull")
      end, { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gc", function()
        vim.cmd("Git commit")
      end, { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gb", function()
        vim.cmd("Git blame")
      end, { desc = "Git blame" })
      vim.keymap.set("n", "<leader>gd", function()
        vim.cmd("Gdiffsplit")
      end, { desc = "Git diff split" })
      vim.keymap.set("n", "<leader>gl", function()
        vim.cmd("Git log")
      end, { desc = "Git log" })
    end,
  },
}
