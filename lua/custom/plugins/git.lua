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
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
      local ok, git_blame = pcall(require, "gitblame")
      if not ok then
        vim.notify("Failed to load git-blame.nvim", vim.log.levels.ERROR)
        return
      end
      git_blame.setup({
        enabled = true,
        message_template = "  <author> • <date> • <summary>",
        date_format = "%Y-%m-%d %H:%M",
        virtual_text_column = 80,
        highlight_group = "GitBlame",
      })
      
      vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    event = "VeryLazy",
    config = function()
      local ok, git_worktree = pcall(require, "git-worktree")
      if not ok then
        vim.notify("Failed to load git-worktree.nvim", vim.log.levels.ERROR)
        return
      end
      git_worktree.setup()
      
      vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", { desc = "Git worktrees" })
      vim.keymap.set("n", "<leader>gW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", { desc = "Create git worktree" })
    end,
  },
}
