-- Ultimate Plugin Configuration - Best of ThePrimeagen + TJ DeVries
return {
  -- === THEPRIMEAGEN'S SIGNATURE PLUGINS ===
  
  -- Harpoon - ThePrimeagen's signature file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      
      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon: Add file" })
      vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle quick menu" })
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
      vim.keymap.set("n", "<leader>h", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
      vim.keymap.set("n", "<leader>l", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
    end,
  },
  
  -- Fugitive - ThePrimeagen's Git integration
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
      vim.keymap.set("n", "<leader>gp", function() vim.cmd("Git push") end, { desc = "Git push" })
      vim.keymap.set("n", "<leader>gP", function() vim.cmd("Git pull") end, { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gc", function() vim.cmd("Git commit") end, { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gb", function() vim.cmd("Git blame") end, { desc = "Git blame" })
      vim.keymap.set("n", "<leader>gd", function() vim.cmd("Gdiffsplit") end, { desc = "Git diff split" })
      vim.keymap.set("n", "<leader>gl", function() vim.cmd("Git log") end, { desc = "Git log" })
    end,
  },
  
  -- Zen mode - ThePrimeagen's focus mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {
            number = true,
            relativenumber = true,
          }
        },
      })
      vim.keymap.set("n", "<leader>z", function() require("zen-mode").toggle() end, { desc = "Toggle Zen mode" })
    end,
  },
  
  -- === TJ DEVRIES' PROFESSIONAL PLUGINS ===
  
  -- Telescope - TJ's signature fuzzy finder (Windows compatible)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      
      telescope.setup({
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
      })
      
      -- TJ's telescope keymaps (Windows compatible)
      vim.keymap.set("n", "<leader>ff", function() telescope.find_files() end, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", function() telescope.live_grep() end, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", function() telescope.buffers() end, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", function() telescope.help_tags() end, { desc = "Find help" })
    end,
  },
  
  -- Treesitter - TJ's advanced syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "c", "cpp", "python", "java", "javascript", "typescript", 
          "go", "rust", "zig", "sql", "lua", "vim", "vimdoc", "markdown",
          "json", "yaml", "toml", "bash", "fish", "dockerfile"
        },
        auto_install = true,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
  
  -- Lualine - TJ's professional status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  
  -- Which-key temporarily disabled due to Windows compatibility issues
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("which-key").setup({
  --       window = {
  --         border = "rounded",
  --       },
  --       show_help = true,
  --     })
  --   end,
  -- },
  
  -- === COMBINED BEST PRACTICES ===
  
  -- Oil - Modern file explorer (better than nvim-tree)
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        columns = { "icon", "permissions", "size", "mtime" },
        view_options = { show_hidden = true },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  
  -- Undotree - Visual undo history
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
    end,
  },
  
  -- Trouble - Diagnostic navigation
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
      vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace diagnostics" })
      vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document diagnostics" })
      vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location list" })
      vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix list" })
    end,
  },
}
