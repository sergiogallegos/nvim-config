-- Luca.nvim - AI-powered coding assistant for Neovim
-- Cursor-like chat interface
return {
  {
    "sergiogallegos/luca.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("luca").setup({
        agents = {
          default = "ollama",
          providers = {
            ollama = {
              model = "deepseek-r1:8b",
              base_url = "http://localhost:11434",  -- Make sure this is correct
              -- requires_api_key = false,  -- Now optional, auto-detected!
              temperature = 0.7,  -- Optional: control randomness
              num_predict = 2048,  -- Optional: Ollama uses num_predict instead of max_tokens
            },
          },
        },
        
        -- UI configuration - Right top-middle, compact layout
        ui = {
          width = 0.35,  -- Adjust as needed (0.0 to 1.0)
          height = 0.4,  -- Smaller height so it doesn't cover entire window
          position = "right",  -- Right side positioning
          border = "rounded",
          winblend = 10,
          title = " Luca ",
        },
        
        -- History configuration
        history = {
          enabled = true,
          max_entries = 100,
          storage_path = vim.fn.stdpath("data") .. "/luca_history.json",
        },
        
        -- Context configuration
        context = {
          include_buffer = true,
          include_tree = true,
          max_files = 10,
          auto_attach = true,
        },
        
        -- Keymaps
        keymaps = {
          open = "<leader>lc",  -- Toggle chat window (Space + l + c)
          close = "<Esc>",
          send = "<CR>",
          history_prev = "<C-p>",
          history_next = "<C-n>",
          apply_suggestion = "<C-a>",
          reject_suggestion = "<C-r>",
        },
      })
      
      -- Explicitly set up toggle keymap (redundant but ensures it works)
      vim.keymap.set("n", "<leader>lc", function()
        require("luca.ui").toggle()
      end, { desc = "Toggle Luca chat" })
    end,
  },
}

