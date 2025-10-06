-- Minimal keymaps - only essential ones
local set = vim.keymap.set

-- Basic navigation
set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Essential file operations
set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })

-- Window management
set("n", "<leader>=", "<cmd>wincmd =<cr>", { desc = "Equalize windows" })
set("n", "<leader>o", "<cmd>only<cr>", { desc = "Close other windows" })

-- Toggle line numbers
set("n", "<leader>n", function()
  vim.opt.number = not vim.opt.number
  vim.opt.relativenumber = not vim.opt.relativenumber
end, { desc = "Toggle line numbers" })

-- Toggle transparency
set("n", "<leader>t", function()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  if normal_hl.bg == nil or normal_hl.bg == "NONE" then
    -- Disable transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000", fg = "#ffffff" })
  else
    -- Enable transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
  end
end, { desc = "Toggle transparency" })

-- File navigation (essential)
set("n", "-", "<cmd>Oil<cr>", { desc = "Open file explorer (Oil)" })
set("n", "<leader>fd", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })

-- LSP keymaps (essential)
set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
set("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format code" })

-- Git keymaps
set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Diff this" })

-- Comment keymaps
set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", { desc = "Toggle comment" })
set("v", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle comment" })

-- Which-key
set("n", "<leader>", "<cmd>WhichKey '<leader>'<cr>", { desc = "Which-key" })

-- LSP status and control
set("n", "<leader>ls", "<cmd>LspStart<cr>", { desc = "Start LSP" })
set("n", "<leader>lS", "<cmd>LspStop<cr>", { desc = "Stop LSP" })
set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })

-- Treesitter text objects (enhanced)
set("n", "af", "<cmd>lua require('treesitter-textobjects').select()<cr>", { desc = "Select function" })
set("n", "ac", "<cmd>lua require('treesitter-textobjects').select()<cr>", { desc = "Select class" })

-- Git navigation (enhanced)
set("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })
set("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev git hunk" })

-- Colorscheme switching (professional)
set("n", "<leader>cn", function()
  require("custom.colorscheme-switcher").next_colorscheme()
end, { desc = "Next colorscheme" })
set("n", "<leader>cp", function()
  require("custom.colorscheme-switcher").prev_colorscheme()
end, { desc = "Prev colorscheme" })
set("n", "<leader>cl", function()
  require("custom.colorscheme-switcher").list_colorschemes()
end, { desc = "List colorschemes" })

-- ThePrimeagen-inspired keymaps
-- Harpoon navigation
set("n", "<leader>a", function() require("harpoon"):list():append() end, { desc = "Harpoon: Add file" })
set("n", "<leader>e", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon: Toggle quick menu" })
set("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon: Go to file 1" })
set("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon: Go to file 2" })
set("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon: Go to file 3" })
set("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon: Go to file 4" })
set("n", "<leader>h", function() require("harpoon"):list():prev() end, { desc = "Harpoon: Previous file" })
set("n", "<leader>l", function() require("harpoon"):list():next() end, { desc = "Harpoon: Next file" })

-- Zen mode
set("n", "<leader>z", function() require("zen-mode").toggle() end, { desc = "Toggle Zen mode" })