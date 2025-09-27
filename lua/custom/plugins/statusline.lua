-- Status line configuration - Heirline.nvim
-- This file configures both main status line and command line status

return {
  -- Heirline.nvim - Extremely fast and flexible status line
  {
    "rebelot/heirline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
      local ok, heirline = pcall(require, "heirline")
      if not ok then
        vim.notify("Failed to load heirline", vim.log.levels.ERROR)
        return
      end
      
      -- Heirline configuration - Fast and clean
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")
      
      -- Define colors
      local colors = {
        bg = "#1a1a1a",
        fg = "#E0E0E0",
        blue = "#81a2be",
        green = "#8abeb7",
        orange = "#de935f",
        red = "#cc6666",
        purple = "#b294bb",
      }
      
      -- Status line components
      local StatusLine = {
        -- Left side
        {
          -- Mode indicator
          {
            provider = function()
              local mode = vim.fn.mode()
              local mode_names = {
                n = "NORMAL",
                i = "INSERT",
                v = "VISUAL",
                V = "V-LINE",
                ["\22"] = "V-BLOCK",
                c = "COMMAND",
                s = "SELECT",
                S = "S-LINE",
                ["\19"] = "S-BLOCK",
                R = "REPLACE",
                r = "REPLACE",
                ["!"] = "EX",
                t = "TERMINAL",
              }
              return mode_names[mode] or mode
            end,
            hl = function()
              local mode = vim.fn.mode()
              local mode_colors = {
                n = { fg = colors.blue, bg = colors.bg, bold = true },
                i = { fg = colors.green, bg = colors.bg, bold = true },
                v = { fg = colors.purple, bg = colors.bg, bold = true },
                V = { fg = colors.purple, bg = colors.bg, bold = true },
                ["\22"] = { fg = colors.purple, bg = colors.bg, bold = true },
                c = { fg = colors.orange, bg = colors.bg, bold = true },
                s = { fg = colors.red, bg = colors.bg, bold = true },
                S = { fg = colors.red, bg = colors.bg, bold = true },
                ["\19"] = { fg = colors.red, bg = colors.bg, bold = true },
                R = { fg = colors.red, bg = colors.bg, bold = true },
                r = { fg = colors.red, bg = colors.bg, bold = true },
                ["!"] = { fg = colors.orange, bg = colors.bg, bold = true },
                t = { fg = colors.blue, bg = colors.bg, bold = true },
              }
              return mode_colors[mode] or { fg = colors.fg, bg = colors.bg, bold = true }
            end,
          },
          {
            provider = " ",
          },
          -- File name
          {
            provider = function()
              local filename = vim.fn.expand("%:t")
              if filename == "" then
                return "[No Name]"
              end
              return filename
            end,
            hl = { fg = colors.fg, bg = colors.bg, bold = true },
          },
          -- Git branch
          {
            condition = function()
              return vim.b.gitsigns_head
            end,
            {
              provider = " ",
            },
            {
              provider = function()
                return "󰘬 " .. vim.b.gitsigns_head
              end,
              hl = { fg = colors.blue, bg = colors.bg, bold = true },
            },
          },
        },
        -- Right side
        {
          -- File type
          {
            provider = function()
              local ft = vim.bo.filetype
              if ft == "" then
                return ""
              end
              return ft:upper()
            end,
            hl = { fg = colors.fg, bg = colors.bg, bold = true },
          },
          {
            provider = " ",
          },
          -- Position
          {
            provider = function()
              local line = vim.fn.line(".")
              local col = vim.fn.col(".")
              return string.format("%d:%d", line, col)
            end,
            hl = { fg = colors.fg, bg = colors.bg, bold = true },
          },
          {
            provider = " ",
          },
          -- Percentage
          {
            provider = function()
              local line = vim.fn.line(".")
              local total = vim.fn.line("$")
              local percentage = math.floor((line / total) * 100)
              return string.format("%d%%", percentage)
            end,
            hl = { fg = colors.fg, bg = colors.bg, bold = true },
          },
        },
      }
      
      -- Setup heirline
      heirline.setup({
        statusline = StatusLine,
        opts = {
          disable_winbar_cb = function(args)
            return conditions.buffer_matches({
              buftype = { "terminal", "quickfix", "nofile", "help", "prompt" },
            }, args.buf)
          end,
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
