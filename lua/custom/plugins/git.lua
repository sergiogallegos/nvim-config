return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      local ok, diffview = pcall(require, "diffview")
      if not ok then
        vim.notify("Failed to load diffview.nvim", vim.log.levels.ERROR)
        return
      end
      diffview.setup({
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
      vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = function()
      local ok, git_conflict = pcall(require, "git-conflict")
      if not ok then
        vim.notify("Failed to load git-conflict.nvim", vim.log.levels.ERROR)
        return
      end
      git_conflict.setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = "copen",
        highlights = {
          incoming = "DiffAdd",
          current = "DiffText",
        },
      })
    end,
  },
}
