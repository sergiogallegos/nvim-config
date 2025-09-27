return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "SmiteshP/nvim-navic",
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      local lualine = require("lualine")
      local gitsigns = require("gitsigns")
      
      -- Custom components for enhanced status line
      local function get_lsp_name()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients > 0 then
          return clients[1].name
        end
        return ""
      end
      
      local function get_git_status()
        local status = gitsigns.get_status()
        if status and status ~= "" then
          return status
        end
        return ""
      end
      
      local function get_file_encoding()
        local encoding = vim.bo.fileencoding
        if encoding == "" then
          encoding = vim.o.encoding
        end
        return encoding ~= "utf-8" and encoding or ""
      end
      
      local function get_file_format()
        local format = vim.bo.fileformat
        return format ~= "unix" and format or ""
      end
      
      local function get_file_size()
        local file = vim.fn.expand("%:p")
        if vim.fn.filereadable(file) == 1 then
          local size = vim.fn.getfsize(file)
          if size > 0 then
            if size < 1024 then
              return size .. "B"
            elseif size < 1024 * 1024 then
              return string.format("%.1f", size / 1024) .. "K"
            else
              return string.format("%.1f", size / (1024 * 1024)) .. "M"
            end
          end
        end
        return ""
      end
      
      local function get_cursor_position()
        local line = vim.fn.line(".")
        local col = vim.fn.col(".")
        local total_lines = vim.fn.line("$")
        local percentage = math.floor((line / total_lines) * 100)
        return string.format("%d:%d [%d%%]", line, col, percentage)
      end
      
      local function get_search_results()
        local search_count = vim.fn.searchcount()
        if search_count.total > 0 then
          return string.format("%d/%d", search_count.current, search_count.total)
        end
        return ""
      end
      
      -- Custom theme for better integration with colorbuddy
      local custom_theme = {
        normal = {
          a = { fg = "#000000", bg = "#bbbbbb", gui = "bold" },
          b = { fg = "#d3d3d3", bg = "#333333" },
          c = { fg = "#E0E0E0", bg = "NONE" },
          x = { fg = "#E0E0E0", bg = "NONE" },
          y = { fg = "#d3d3d3", bg = "#333333" },
          z = { fg = "#000000", bg = "#bbbbbb" },
        },
        insert = {
          a = { fg = "#000000", bg = "#99cc99", gui = "bold" },
          b = { fg = "#d3d3d3", bg = "#333333" },
          c = { fg = "#E0E0E0", bg = "NONE" },
          x = { fg = "#E0E0E0", bg = "NONE" },
          y = { fg = "#d3d3d3", bg = "#333333" },
          z = { fg = "#000000", bg = "#99cc99" },
        },
        visual = {
          a = { fg = "#000000", bg = "#f8fe7a", gui = "bold" },
          b = { fg = "#d3d3d3", bg = "#333333" },
          c = { fg = "#E0E0E0", bg = "NONE" },
          x = { fg = "#E0E0E0", bg = "NONE" },
          y = { fg = "#d3d3d3", bg = "#333333" },
          z = { fg = "#000000", bg = "#f8fe7a" },
        },
        replace = {
          a = { fg = "#000000", bg = "#cc6666", gui = "bold" },
          b = { fg = "#d3d3d3", bg = "#333333" },
          c = { fg = "#E0E0E0", bg = "NONE" },
          x = { fg = "#E0E0E0", bg = "NONE" },
          y = { fg = "#d3d3d3", bg = "#333333" },
          z = { fg = "#000000", bg = "#cc6666" },
        },
        command = {
          a = { fg = "#000000", bg = "#8e6fbd", gui = "bold" },
          b = { fg = "#d3d3d3", bg = "#333333" },
          c = { fg = "#E0E0E0", bg = "NONE" },
          x = { fg = "#E0E0E0", bg = "NONE" },
          y = { fg = "#d3d3d3", bg = "#333333" },
          z = { fg = "#000000", bg = "#8e6fbd" },
        },
        inactive = {
          a = { fg = "#bbbbbb", bg = "NONE" },
          b = { fg = "#bbbbbb", bg = "NONE" },
          c = { fg = "#bbbbbb", bg = "NONE" },
          x = { fg = "#bbbbbb", bg = "NONE" },
          y = { fg = "#bbbbbb", bg = "NONE" },
          z = { fg = "#bbbbbb", bg = "NONE" },
        },
      }
      
      lualine.setup({
        options = {
          theme = custom_theme,
          section_separators = { left = "", right = "" },
          component_separators = { left = "│", right = "│" },
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = { "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "help" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 
            { "mode", fmt = function(str) return str:sub(1, 1) end, separator = { left = "", right = "│" } }
          },
          lualine_b = { 
            { "branch", icon = "󰘬", separator = { left = "", right = "│" } },
            { "diff", 
              symbols = { added = "󰐕 ", modified = "󰏫 ", removed = "󰍴 " },
              separator = { left = "", right = "│" }
            },
            { get_git_status, separator = { left = "", right = "│" } },
          },
          lualine_c = { 
            { "filename", 
              path = 1, 
              symbols = { modified = " ●", readonly = " 󰌾", unnamed = " 󰈙" },
              separator = { left = "", right = "│" }
            },
            { "navic", 
              cond = function() return require("nvim-navic").is_available() end,
              separator = { left = "", right = "│" }
            },
          },
          lualine_x = {
            { "diagnostics", 
              sources = { "nvim_diagnostic" },
              symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
              colored = true,
              separator = { left = "│", right = "" }
            },
            { get_lsp_name, 
              icon = "󰒋", 
              cond = function() return get_lsp_name() ~= "" end,
              separator = { left = "│", right = "" }
            },
            { "filetype", 
              icon_only = true,
              separator = { left = "│", right = "" }
            },
            { get_file_encoding, 
              cond = function() return get_file_encoding() ~= "" end,
              separator = { left = "│", right = "" }
            },
            { get_file_format, 
              cond = function() return get_file_format() ~= "" end,
              separator = { left = "│", right = "" }
            },
            { get_file_size, 
              cond = function() return get_file_size() ~= "" end,
              separator = { left = "│", right = "" }
            },
          },
          lualine_y = { 
            { get_cursor_position, separator = { left = "│", right = "" } },
            { get_search_results, 
              cond = function() return get_search_results() ~= "" end,
              separator = { left = "│", right = "" }
            },
          },
          lualine_z = { 
            { "progress", separator = { left = "│", right = "" } }
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy", "mason", "trouble", "quickfix" },
      })
    end,
  },
}
