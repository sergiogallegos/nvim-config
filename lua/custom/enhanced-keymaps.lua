-- Keymaps - kept intentionally small.
-- Philosophy: a handful of memorable bindings, no deep prefix trees.
-- LSP go-to bindings (gd, gD, gr, gi, K, <C-k>) live in plugins/lsp.lua.
-- Git hunks (<leader>h*) live in plugins/git.lua. Diagnostics ([d, ]d) in
-- custom/diagnostic-help.lua. Telescope/harpoon/trouble in plugins/ultimate.lua.
local M = {}

local set = vim.keymap.set

function M.setup()
    -- Core editing
    set("n", "<leader>W", "<cmd>w<cr>", { desc = "Save" })
    set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
    set("n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
    set("n", "<leader>ct", function()
        require("custom.transparency").toggle_transparency()
    end, { desc = "Toggle transparency" })

    -- Escape from insert mode
    set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
    set("i", "jj", "<Esc>", { desc = "Escape insert mode" })

    -- Helix-like Space actions for LSP (work once a server is attached)
    set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover" })
    set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
    set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Code action" })

    -- Window navigation (built-in; no plugin)
    set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
    set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
    set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
    set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

    -- Window splits
    set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
    set("n", "<leader>ws", "<C-w>s", { desc = "Split horizontally" })
    set("n", "<leader>wq", "<C-w>q", { desc = "Close window" })
    set("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
    set("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })

    -- Buffers
    set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
    set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
    set("n", "<leader><space>", "<cmd>buffer #<cr>", { desc = "Switch to last buffer" })

    -- Terminal
    set("n", "<leader>T", "<cmd>terminal<cr>", { desc = "Open terminal" })

    -- A few quick toggles
    set("n", "<leader>on", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
    set("n", "<leader>or", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })
    set("n", "<leader>ow", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
end

return M
