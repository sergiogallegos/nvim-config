-- Status line configuration - Custom formatting
-- This file configures both main status line and command line status

return {
  -- Feline.nvim - Minimal, stylish, and fast status line
  {
    "feline-nvim/feline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
      local ok, feline = pcall(require, "feline")
      if not ok then
        vim.notify("Failed to load feline", vim.log.levels.ERROR)
        return
      end
      
      -- Feline configuration - Simple and clean
      feline.setup({
        theme = "default",
        default_bg = "#1a1a1a",
        default_fg = "#E0E0E0",
        components = {
          active = {
            {
              {
                provider = "vi_mode",
                icon = "",
                hl = function()
                  return {
                    name = require("feline.providers.vi_mode").get_mode_highlight_name(),
                    fg = require("feline.providers.vi_mode").get_mode_color(),
                    style = "bold",
                  }
                end,
                right_sep = " ",
              },
              {
                provider = "file_info",
                hl = {
                  fg = "#E0E0E0",
                  style = "bold",
                },
                right_sep = " ",
              },
              {
                provider = "git_branch",
                icon = " ",
                hl = {
                  fg = "#81a2be",
                  style = "bold",
                },
                right_sep = " ",
              },
            },
            {
              {
                provider = "file_type",
                hl = {
                  fg = "#E0E0E0",
                  style = "bold",
                },
                right_sep = " ",
              },
              {
                provider = "position",
                hl = {
                  fg = "#E0E0E0",
                  style = "bold",
                },
                right_sep = " ",
              },
              {
                provider = "line_percentage",
                hl = {
                  fg = "#E0E0E0",
                  style = "bold",
                },
              },
            },
          },
        },
      })
      
      -- Custom command line status line format
      vim.cmd([[
        set statusline=%f\ %m\ %r\ %w\ %y\ %p%%\ %l:%c\ %{&fileencoding}\ %{&fileformat}
        set laststatus=2
        set cmdheight=0
        set showcmd
        set ruler
      ]])
      
      -- Style command line status to match main status line
      vim.api.nvim_set_hl(0, "StatusLine", { 
        bg = "#1a1a1a", 
        fg = "#E0E0E0",
        ctermbg = 0,
        ctermfg = 7
      })
      vim.api.nvim_set_hl(0, "StatusLineNC", { 
        bg = "#1a1a1a", 
        fg = "#E0E0E0",
        ctermbg = 0,
        ctermfg = 7
      })
      
      -- Make command line status appear only when needed
      vim.api.nvim_create_autocmd("CmdlineEnter", {
        callback = function()
          vim.cmd("set laststatus=2")
          vim.cmd("set cmdheight=1")
        end,
      })
      
      vim.api.nvim_create_autocmd("CmdlineLeave", {
        callback = function()
          vim.cmd("set cmdheight=0")
        end,
      })
    end,
  },
}
