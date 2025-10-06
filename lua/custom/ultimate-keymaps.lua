-- Ultimate Keymaps - Best of ThePrimeagen + TJ DeVries
local M = {}

local set = vim.keymap.set

function M.setup()
  -- === THEPRIMEAGEN'S SIGNATURE KEYMAPS ===
  
  -- Harpoon navigation (ThePrimeagen's signature)
  set("n", "<leader>a", function() require("harpoon"):list():append() end, { desc = "Harpoon: Add file" })
  set("n", "<leader>e", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon: Toggle quick menu" })
  set("n", "<leader>1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon: Go to file 1" })
  set("n", "<leader>2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon: Go to file 2" })
  set("n", "<leader>3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon: Go to file 3" })
  set("n", "<leader>4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon: Go to file 4" })
  set("n", "<leader>h", function() require("harpoon"):list():prev() end, { desc = "Harpoon: Previous file" })
  set("n", "<leader>l", function() require("harpoon"):list():next() end, { desc = "Harpoon: Next file" })
  
  -- Git commands (ThePrimeagen style)
  set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
  set("n", "<leader>gp", function() vim.cmd("Git push") end, { desc = "Git push" })
  set("n", "<leader>gP", function() vim.cmd("Git pull") end, { desc = "Git pull" })
  set("n", "<leader>gc", function() vim.cmd("Git commit") end, { desc = "Git commit" })
  set("n", "<leader>gb", function() vim.cmd("Git blame") end, { desc = "Git blame" })
  set("n", "<leader>gd", function() vim.cmd("Gdiffsplit") end, { desc = "Git diff split" })
  set("n", "<leader>gl", function() vim.cmd("Git log") end, { desc = "Git log" })
  
  -- Zen mode (ThePrimeagen's focus mode)
  set("n", "<leader>z", function() require("zen-mode").toggle() end, { desc = "Toggle Zen mode" })
  
  -- === TJ DEVRIES' PROFESSIONAL KEYMAPS ===
  
  -- Telescope (TJ's signature fuzzy finder - Windows compatible)
  set("n", "<leader>ff", function() require("telescope").find_files() end, { desc = "Find files" })
  set("n", "<leader>fg", function() require("telescope").live_grep() end, { desc = "Live grep" })
  set("n", "<leader>fb", function() require("telescope").buffers() end, { desc = "Find buffers" })
  set("n", "<leader>fh", function() require("telescope").help_tags() end, { desc = "Find help" })
  
  -- Oil file explorer (modern alternative to nvim-tree)
  set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  
  -- Undotree (visual undo history)
  set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
  
  -- Trouble diagnostics (TJ's diagnostic navigation)
  set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
  set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace diagnostics" })
  set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document diagnostics" })
  set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location list" })
  set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix list" })
  
  -- === COMBINED BEST PRACTICES ===
  
  -- Basic navigation
  set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
  set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
  set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
  set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
  
  -- Save and quit
  set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
  set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
  
  -- Search
  set("n", "<leader>s", "/", { desc = "Search" })
  set("n", "<leader>S", "?", { desc = "Search backwards" })
  
  -- Line numbers
  set("n", "<leader>ln", function()
    vim.opt.number = not vim.opt.number
    vim.opt.relativenumber = not vim.opt.relativenumber
  end, { desc = "Toggle line numbers" })
  
  -- Transparency toggle (ThePrimeagen style)
  set("n", "<leader>ct", function()
    require("custom.transparency").toggle_transparency()
  end, { desc = "Toggle transparency" })
  
  -- Colorscheme switching
  set("n", "<leader>cn", function()
    require("custom.colorscheme-switcher").next_colorscheme()
  end, { desc = "Next colorscheme" })
  set("n", "<leader>cp", function()
    require("custom.colorscheme-switcher").prev_colorscheme()
  end, { desc = "Prev colorscheme" })
  set("n", "<leader>cl", function()
    require("custom.colorscheme-switcher").list_colorschemes()
  end, { desc = "List colorschemes" })
  
  -- LSP keymaps (professional)
  set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
  set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
  set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
  set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
  set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
  set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
  set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  set("n", "gr", vim.lsp.buf.references, { desc = "References" })
  set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
  
  -- Git navigation (enhanced)
  set("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })
  set("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev git hunk" })
  
  -- Treesitter text objects (TJ's approach)
  set("n", "af", "<cmd>lua require('treesitter-textobjects').select()<cr>", { desc = "Select function" })
  set("n", "ac", "<cmd>lua require('treesitter-textobjects').select()<cr>", { desc = "Select class" })
end

return M
