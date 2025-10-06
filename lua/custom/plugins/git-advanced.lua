-- Advanced Git Integration - From sergiogallegos/nvim-config
return {
  -- Diffview - Advanced git diff viewer
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local diffview = require("diffview")
      diffview.setup({
        diff_binaries = false,
        enhanced_diff_hl = false,
        git_cmd = { "git" },
        use_icons = true,
        show_help_hints = true,
        watch_index = true,
        icons = {
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
          done = "✓",
        },
        view = {
          default = {
            layout = "diff2_horizontal",
            winbar_info = false,
          },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = "diff2_horizontal",
            winbar_info = false,
          },
        },
        file_panel = {
          listing_style = "tree",
          tree_options = {
            flatten_dirs = true,
            folder_statuses = "only_folded",
          },
          win_config = {
            position = "left",
            width = 35,
            win_opts = {},
          },
        },
        file_history_panel = {
          log_options = {
            git = {
              single_file = {
                diff_merges = "combined",
              },
              multi_file = {
                diff_merges = "first-parent",
              },
            },
          },
          win_config = {
            position = "bottom",
            height = 16,
            win_opts = {},
          },
        },
        commit_log_panel = {
          win_config = {
            win_opts = {},
          },
        },
        default_args = {
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {},
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>gd", function() diffview.open() end, { desc = "Open diffview" })
      set("n", "<leader>gD", function() diffview.close() end, { desc = "Close diffview" })
      set("n", "<leader>gf", function() diffview.focus_files() end, { desc = "Focus files" })
      set("n", "<leader>gh", function() diffview.file_history() end, { desc = "File history" })
    end,
  },
  
  -- Git Conflict Resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = "copen",
        log_level = "info",
        debug = false,
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>gco", function() require("git-conflict").choose_ours() end, { desc = "Choose ours" })
      set("n", "<leader>gct", function() require("git-conflict").choose_theirs() end, { desc = "Choose theirs" })
      set("n", "<leader>gcb", function() require("git-conflict").choose_both() end, { desc = "Choose both" })
      set("n", "<leader>gc0", function() require("git-conflict").choose_none() end, { desc = "Choose none" })
      set("n", "<leader>gcn", function() require("git-conflict").next_conflict() end, { desc = "Next conflict" })
      set("n", "<leader>gcp", function() require("git-conflict").prev_conflict() end, { desc = "Prev conflict" })
    end,
  },
  
  -- Git Blame (using gitsigns instead for better compatibility)
  -- Note: Git blame functionality is already provided by gitsigns.nvim
  -- Use <leader>tb to toggle blame line
  
  -- Git Worktrees
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup({
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>gw", function() require("telescope").extensions.git_worktree.git_worktrees() end, { desc = "Git worktrees" })
      set("n", "<leader>gW", function() require("telescope").extensions.git_worktree.create_git_worktree() end, { desc = "Create git worktree" })
    end,
  },
}
