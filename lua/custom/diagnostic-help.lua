-- Diagnostic Help - How to read error messages
local M = {}

function M.setup()
    -- === HOW TO READ DIAGNOSTIC MESSAGES ===

    -- 1. Hover over the error indicator (E, W, H, I) to see the message
    -- 2. Use Trouble.nvim to see all diagnostics in a list
    -- 3. Use built-in Neovim commands for diagnostics

    -- === KEYMAPS FOR READING DIAGNOSTICS ===
    local set = vim.keymap.set

    -- Hover over diagnostic to see message (disabled float)
    -- set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

    -- Navigate between diagnostics (jumping opens a float with the message)
    set("n", "[d", function()
        vim.diagnostic.jump { count = -1, float = true }
    end, { desc = "Previous diagnostic" })
    set("n", "]d", function()
        vim.diagnostic.jump { count = 1, float = true }
    end, { desc = "Next diagnostic" })

    -- Full diagnostic lists live in Trouble (plugins/ultimate.lua):
    --   <leader>xx workspace, <leader>xd document, <leader>xl loclist, <leader>xq qflist

    -- === DIAGNOSTIC CONFIGURATION ===
    -- Configure diagnostic appearance
    vim.diagnostic.config {
        virtual_text = {
            prefix = "●", -- Change the prefix for virtual text
            spacing = 4,
        },
        signs = true, -- Show E, W, H, I indicators
        underline = true, -- Underline problematic code
        update_in_insert = false, -- Don't update while typing
        severity_sort = true, -- Sort by severity
        float = {
            border = "rounded",
            source = "always", -- Show source of diagnostic
            header = "",
            prefix = function(diagnostic)
                local icons = {
                    [vim.diagnostic.severity.ERROR] = "❌ ",
                    [vim.diagnostic.severity.WARN] = "⚠️ ",
                    [vim.diagnostic.severity.INFO] = "ℹ️ ",
                    [vim.diagnostic.severity.HINT] = "💡 ",
                }
                return icons[diagnostic.severity] or "● "
            end,
        },
    }

    -- Severity levels: E = Error, W = Warning, I = Info, H = Hint
end

return M
