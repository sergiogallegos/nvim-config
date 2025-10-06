-- Cross-platform Plugin Configuration
local platform = require("custom.platform")

return {
  -- Platform-specific plugin configurations
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      -- Cross-platform configuration
      local config = {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
      
      -- Platform-specific settings
      if platform.is_windows then
        -- Windows: Use built-in functionality (no fzf-native)
        config.defaults.file_ignore_patterns = {
          "node_modules/",
          ".git/",
          "*.exe",
          "*.dll",
        }
      elseif platform.is_macos then
        -- macOS: Can use fzf-native if available
        config.defaults.file_ignore_patterns = {
          "node_modules/",
          ".git/",
          ".DS_Store",
        }
      else
        -- Linux
        config.defaults.file_ignore_patterns = {
          "node_modules/",
          ".git/",
        }
      end
      
      telescope.setup(config)
      
      -- Cross-platform keymaps
      local set = vim.keymap.set
      set("n", "<leader>ff", function() telescope.find_files() end, { desc = "Find files" })
      set("n", "<leader>fg", function() telescope.live_grep() end, { desc = "Live grep" })
      set("n", "<leader>fb", function() telescope.buffers() end, { desc = "Find buffers" })
      set("n", "<leader>fh", function() telescope.help_tags() end, { desc = "Find help" })
    end,
  },
  
  -- Which-key (platform-specific)
  {
    "folke/which-key.nvim",
    enabled = not platform.is_windows, -- Disabled on Windows
    config = function()
      if not platform.is_windows then
        require("which-key").setup({
          window = {
            border = "rounded",
          },
          show_help = true,
        })
      end
    end,
  },
  
  -- Auto-save (cross-platform)
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = {
          message = function()
            return ""
          end,
          delay = 0,
        },
        trigger_events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135,
      })
    end,
  },
  
  -- Smart splits (cross-platform)
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      require("smart-splits").setup({
        ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
        ignored_buftypes = { "nofile" },
        default_amount = 3,
        at_edge = "stop",
        cursor_follows_handle = {
          enabled = true,
          border = "single",
        },
        resize_mode = {
          quit_key = "<ESC>",
          resize_keys = { "h", "j", "k", "l" },
          silent = false,
          hooks = {
            on_enter = nil,
            on_leave = nil,
          },
        },
        multiplexer_integration = nil,
        ignored_events = {
          win_enter = {},
          buf_enter = {},
        },
        log_level = "info",
      })
    end,
  },
  
  -- Platform-specific clipboard
  {
    "AckslD/nvim-neoclip.lua",
    enabled = platform.config.clipboard.win32yank or platform.config.clipboard.pbcopy or platform.config.clipboard.xclip,
    config = function()
      if platform.config.clipboard.win32yank or platform.config.clipboard.pbcopy or platform.config.clipboard.xclip then
        require("neoclip").setup({
          history = 1000,
          enable_persistent_history = true,
          length_limit = 1048576,
          continuous_sync = false,
          db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
          filter = nil,
          preview = true,
          prompt = nil,
          default_register = '"',
          default_register_macros = 'q',
          enable_macro_history = true,
          content_spec_column = false,
          on_paste = {
            set_reg = false,
          },
          on_yank = {
            set_reg = false,
          },
          keys = {
            telescope = {
              i = {
                select = '<cr>',
                paste = '<c-p>',
                paste_behind = '<c-k>',
                replay = '<c-q>',
                custom = {},
              },
              n = {
                select = '<cr>',
                paste = 'p',
                paste_behind = 'P',
                replay = 'q',
                custom = {},
              },
            },
            fzf = {
              select = 'default',
              paste = 'ctrl-p',
              paste_behind = 'ctrl-k',
              custom = {},
            },
          },
        })
      end
    end,
  },
}
