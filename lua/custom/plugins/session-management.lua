-- Session Management - From sergiogallegos/nvim-config
return {
  -- Persistence - Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
        pre_save = nil,
        save_empty = false,
        ignored_dirs = {},
        ignored_filetypes = { "gitcommit", "gitrebase" },
        ignored_buftypes = {},
        always_save = nil,
        load_on_session = true,
        autosave = true,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_dirs = {},
        autosave_ignore_filetypes = { "gitcommit", "gitrebase" },
        autosave_ignore_buftypes = {},
        autosave_only_in_session = false,
        autosave_ignore_ft_blacklist = {},
        autosave_ignore_bt_blacklist = {},
        autosave_ignore_rtp_blacklist = {},
        autosave_ignore_ft_whitelist = {},
        autosave_ignore_bt_whitelist = {},
        autosave_ignore_rtp_whitelist = {},
        autosave_ignore_ft_blacklist = {},
        autosave_ignore_bt_blacklist = {},
        autosave_ignore_rtp_blacklist = {},
        autosave_ignore_ft_whitelist = {},
        autosave_ignore_bt_whitelist = {},
        autosave_ignore_rtp_whitelist = {},
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
      set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
      set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't save current session" })
    end,
  },
}
