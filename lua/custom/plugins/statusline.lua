-- Status line configuration - Custom formatting
-- This file configures both main status line and command line status

return {
  -- Custom status line configuration
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()
      local ok, lualine = pcall(require, "lualine")
      if not ok then
        vim.notify("Failed to load lualine", vim.log.levels.ERROR)
        return
      end
      
      lualine.setup({
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = "",
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics", "filetype" },
          lualine_y = { "location" },
          lualine_z = { "progress" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
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
