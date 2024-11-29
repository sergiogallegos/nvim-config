local M = {}

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local subscribe = require "el.subscribe"
local sections = require "el.sections"

-- Ensure global status line is enabled
vim.opt.laststatus = 3

M.setup = function()
  require("el").setup {
    generator = function()
      local segments = {}

      -- Add mode indicator
      table.insert(segments, extensions.mode)
      table.insert(segments, " ") -- Spacer for better visual separation

      -- Add git branch (updates on BufEnter)
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
          local branch = extensions.git_branch(win, buf)
          return branch or "" -- Return empty if no branch
        end)
      )

      -- Add git changes (updates on BufWritePost)
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
          local changes = extensions.git_changes(win, buf)
          return changes or "" -- Return empty if no changes
        end)
      )

      -- Add current file path
      table.insert(segments, sections.split) -- Add separator for readability
      table.insert(segments, builtin.file_relative)

      -- Add line and column position
      table.insert(segments, sections.collapse_builtin { "[", builtin.line, ":", builtin.column, "]" })

      -- Add diagnostics (errors, warnings, etc.)
      table.insert(
        segments,
        subscribe.buf_autocmd("el-diagnostics", "DiagnosticChanged", function(_, buf)
          local diagnostics = extensions.diagnostic_count(buf)
          return diagnostics or "" -- Return empty if no diagnostics
        end)
      )

      -- Add total buffer percentage progress
      table.insert(segments, sections.split) -- Add separator
      table.insert(segments, builtin.percentage_through_file)

      return segments
    end,
  }
end

return M

