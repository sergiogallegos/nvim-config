-- Enhanced Plugins - Latest Best Practices from ThePrimeagen & TJ DeVries
return {
  -- === MODERN ENHANCEMENTS ===
  
  -- Indent Blankline - Disabled (user preference)
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   config = function()
  --     require("ibl").setup({
  --       indent = {
  --         char = "│",
  --         tab_char = "│",
  --       },
  --       scope = {
  --         enabled = false,
  --       },
  --       exclude = {
  --         filetypes = {
  --           "help",
  --           "alpha",
  --           "dashboard",
  --           "neo-tree",
  --           "Trouble",
  --           "lazy",
  --           "mason",
  --           "notify",
  --           "toggleterm",
  --           "lazyterm",
  --         },
  --       },
  --     })
  --   end,
  -- },
  
  -- Auto-save - Modern auto-save functionality
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
  
  -- Better escape - Disabled (deprecation warnings)
  -- {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup({
  --       mapping = { "jk", "jj" },
  --       timeout = vim.o.timeoutlen,
  --       clear_empty_lines = false,
  --       keys = "<Esc>",
  --       -- Updated API for latest version
  --       enabled = true,
  --       silent = false,
  --       only_first_key = false,
  --     })
  --   end,
  -- },
  
  -- Smart splits - Better window management
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
  
  -- Mini.ai - Enhanced text objects
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup({
        n_lines = 50,
        custom_textobjects = {
          o = false,
          a = false,
        },
      })
    end,
  },
  
  -- Mini.surround - Better surround functionality
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
        },
      })
    end,
  },
  
  -- Mini.comment - Better commenting
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({
        options = {
          custom_commentstring = nil,
          ignore_blank_line = false,
          ignore_rule = nil,
          start_of_line = false,
          wrap = true,
        },
        mappings = {
          comment = "gc",
          comment_line = "gcc",
          textobject = "gc",
        },
        hooks = {
          pre = function()
            require("ts_context_commentstring.internal").update_commentstring()
          end,
        },
      })
    end,
  },
  
  -- Mini.pairs - Better auto-pairs
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  
  -- Mini.bufremove - Better buffer management
  {
    "echasnovski/mini.bufremove",
    config = function()
      require("mini.bufremove").setup()
    end,
  },
  
  -- Mini.files - Modern file explorer
  {
    "echasnovski/mini.files",
    config = function()
      require("mini.files").setup({
        content = {
          filter = nil,
          group = nil,
          sort = nil,
        },
        options = {
          use_as_default_explorer = true,
          permanent_delete = false,
          windows = {
            preview = true,
            width_focus = 50,
            width_nofocus = 15,
            width_preview = 25,
            winhl = {
              NormalFloat = "MiniFilesNormalFloat",
              FloatBorder = "MiniFilesBorder",
            },
          },
        },
        windows = {
          preview = true,
          width_focus = 50,
          width_nofocus = 15,
          width_preview = 25,
          winhl = {
            NormalFloat = "MiniFilesNormalFloat",
            FloatBorder = "MiniFilesBorder",
          },
        },
      })
    end,
  },
  
  -- Mini.animate - Smooth animations
  {
    "echasnovski/mini.animate",
    config = function()
      require("mini.animate").setup({
        cursor = {
          enable = false,
        },
        scroll = {
          enable = false,
        },
        resize = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 50, unit = "total" }),
        },
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
      })
    end,
  },
  
  -- Mini.indentscope - Disabled (user preference)
  -- {
  --   "echasnovski/mini.indentscope",
  --   config = function()
  --     require("mini.indentscope").setup({
  --       draw = {
  --         delay = 0,
  --         animation = require("mini.indentscope").gen_animation.none(),
  --         priority = 2,
  --       },
  --       options = {
  --         border = "both",
  --         indent_at_cursor = true,
  --         try_as_border = true,
  --       },
  --       symbol = "│",
  --       mappings = {
  --         goto_top = "[i",
  --         goto_bottom = "]i",
  --       },
  --     })
  --   end,
  -- },
  
  -- Mini.statusline - Lightweight status line
  {
    "echasnovski/mini.statusline",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 75 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 })
            local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = statusline.section_location({ trunc_width = 75 })
            
            return statusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
              "%<",
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=",
              { hl = "MiniStatuslineDevinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            })
          end,
          inactive = function()
            return statusline.combine_groups({
              "hlstatus",
              "%<",
              { hl = "MiniStatuslineInactive", strings = { "filename" } },
              "%=",
              { hl = "MiniStatuslineInactive", strings = { "fileinfo" } },
            })
          end,
        },
        use_icons = true,
        set_vim_settings = false,
      })
    end,
  },
  
  -- Mini.tabline - Better tab line
  {
    "echasnovski/mini.tabline",
    config = function()
      require("mini.tabline").setup({
        show_icons = true,
        tabpage_section = "left",
        truncate_name = 40,
        truncate_prefix = "…",
        truncate_suffix = "",
        tabs = {
          name = function()
            return ""
          end,
          truncate_name = function(name)
            return vim.fn.pathshorten(name)
          end,
        },
      })
    end,
  },
  
  -- Mini.hipatterns - Better highlighting patterns
  {
    "echasnovski/mini.hipatterns",
    config = function()
      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = {
            pattern = "#%x%x%x%x%x%x",
            group = "MiniHipatternsHex",
          },
        },
      })
    end,
  },
  
  -- Mini.operators - Better operators
  {
    "echasnovski/mini.operators",
    config = function()
      require("mini.operators").setup()
    end,
  },
  
  -- Mini.jump - Better jumping
  {
    "echasnovski/mini.jump",
    config = function()
      require("mini.jump").setup()
    end,
  },
  
  -- Mini.jump2d - Better 2D jumping
  {
    "echasnovski/mini.jump2d",
    config = function()
      require("mini.jump2d").setup({
        view = {
          dim = true,
          n_steps_ahead = 1,
        },
        mappings = {
          start_jumping = "<CR>",
        },
      })
    end,
  },
  
  -- Mini.move - Better moving
  {
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup({
        mappings = {
          left = "<M-h>",
          right = "<M-l>",
          down = "<M-j>",
          up = "<M-k>",
          line_left = "<M-h>",
          line_right = "<M-l>",
          line_down = "<M-j>",
          line_up = "<M-k>",
        },
        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
  
  -- Mini.pick - Better picking
  {
    "echasnovski/mini.pick",
    config = function()
      require("mini.pick").setup()
    end,
  },
  
  -- Mini.sessions - Better session management
  {
    "echasnovski/mini.sessions",
    config = function()
      require("mini.sessions").setup({
        autoread = false,
        autowrite = true,
        force = { read = false, write = true, delete = true },
        hooks = {
          pre = { read = nil, write = nil },
          post = { read = nil, write = nil },
        },
        name = "Session.vim",
        read = "force",
        store = {
          hooks = {
            post = {},
            pre = {},
          },
        },
        verbose = { read = false, write = false },
      })
    end,
  },
  
  -- Mini.starter - Disabled (user preference - no recent files on startup)
  -- {
  --   "echasnovski/mini.starter",
  --   config = function()
  --     local starter = require("mini.starter")
  --     starter.setup({
  --       autoopen = true,
  --       evaluate_single = true,
  --       header = "",
  --       footer = "",
  --       items = {
  --         starter.sections.recent_files(10, true),
  --         starter.sections.recent_files(10, false),
  --         starter.sections.telescope(),
  --         starter.sections.builtin_actions(),
  --         starter.sections.sessions(5, true),
  --         starter.sections.sessions(5, false),
  --       },
  --       content_hooks = {
  --         starter.gen_hook.adding_bullet(),
  --         starter.gen_hook.indexing("all", { "Builtin actions" }),
  --         starter.gen_hook.padding(3, 2),
  --       },
  --       query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
  --       silent = true,
  --     })
  --   end,
  -- },
  
  -- Mini.trailspace - Better trailing whitespace
  {
    "echasnovski/mini.trailspace",
    config = function()
      require("mini.trailspace").setup()
    end,
  },
  
  -- Mini.visits - Better visits
  {
    "echasnovski/mini.visits",
    config = function()
      require("mini.visits").setup()
    end,
  },
}
