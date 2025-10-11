-- Enhanced UI/UX
return {
  -- Better notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = true,
      })
      
      vim.notify = require("notify")
    end,
  },
  
  -- Better terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },
  
  -- Better cursor
  {
    "mawkler/modicator.nvim",
    config = function()
      require("modicator").setup({
        show_warnings = false,
        highlights = {
          defaults = {
            bold = true,
            italic = false,
          },
        },
      })
    end,
  },
  
  -- Better scrollbar (already configured in gitsigns.lua)
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = function()
  --     require("gitsigns").setup({
  --       signs = {
  --         add = { text = "│" },
  --         change = { text = "│" },
  --         delete = { text = "_" },
  --         topdelete = { text = "‾" },
  --         changedelete = { text = "~" },
  --         untracked = { text = "┆" },
  --       },
  --       signcolumn = true,
  --       numhl = false,
  --       linehl = false,
  --       word_diff = false,
  --       watch_gitdir = {
  --         interval = 1000,
  --         follow_files = true,
  --       },
  --       attach_to_untracked = true,
  --       current_line_blame = false,
  --       current_line_blame_opts = {
  --         virt_text = true,
  --         virt_text_pos = "eol",
  --         delay = 1000,
  --         ignore_whitespace = false,
  --       },
  --       sign_priority = 6,
  --       update_debounce = 100,
  --       status_formatter = nil,
  --       max_file_length = 40000,
  --       preview_config = {
  --         border = "single",
  --         style = "minimal",
  --         relative = "cursor",
  --         row = 0,
  --         col = 1,
  --       },
  --       on_attach = function(bufnr)
  --         local gs = package.loaded.gitsigns
  --         
  --         local function map(mode, l, r, opts)
  --           opts = opts or {}
  --           opts.buffer = bufnr
  --           vim.keymap.set(mode, l, r, opts)
  --         end
  --         
  --         -- Navigation
  --         map("n", "]c", function()
  --           if vim.wo.diff then return "]c" end
  --           vim.schedule(function() gs.next_hunk() end)
  --           return "<Ignore>"
  --         end, { expr = true })
  --         
  --         map("n", "[c", function()
  --           if vim.wo.diff then return "[c" end
  --           vim.schedule(function() gs.prev_hunk() end)
  --           return "<Ignore>"
  --         end, { expr = true })
  --         
  --         -- Actions
  --         map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
  --         map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
  --         map("n", "<leader>hS", gs.stage_buffer)
  --         map("n", "<leader>hu", gs.undo_stage_hunk)
  --         map("n", "<leader>hR", gs.reset_buffer)
  --         map("n", "<leader>hp", gs.preview_hunk)
  --         map("n", "<leader>hb", function() gs.blame_line { full = true } end)
  --         map("n", "<leader>tb", gs.toggle_current_line_blame)
  --         map("n", "<leader>hd", gs.diffthis)
  --         map("n", "<leader>hD", function() gs.diffthis("~") end)
  --         map("n", "<leader>td", gs.toggle_deleted)
  --         
  --         -- Text object
  --         map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  --       end,
  --     })
  --   end,
  -- },
}
