-- Advanced File Management - From sergiogallegos/nvim-config
return {
  -- Oil with floating windows
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        columns = { "icon", "permissions", "size", "mtime" },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        keymaps_help = {
          keymap = "<C-h>",
          description = "Show help",
        },
        skip_confirm_for_simple_edits = false,
        delete_to_trash = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          timeout_ms = 1000,
          autosave_changes = false,
        },
        constrain_cursor = "editable",
        experimental_watch_for_changes = false,
        watch_dir = nil,
      })
      
      -- Keymaps
      local set = vim.keymap.set
      set("n", "<leader>e", function() require("oil").open() end, { desc = "Open file explorer" })
      set("n", "<leader>E", function() require("oil").open_float() end, { desc = "Open floating file explorer" })
      set("n", "-", function() require("oil").open() end, { desc = "Open parent directory" })
    end,
  },
}
