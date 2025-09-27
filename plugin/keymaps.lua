local set = vim.keymap.set
local k = vim.keycode
local f = require "custom.f"
local fn = f.fn

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>", { desc = "Move to split below" })
set("n", "<c-k>", "<c-w><c-k>", { desc = "Move to split above" })
set("n", "<c-l>", "<c-w><c-l>", { desc = "Move to split right" })
set("n", "<c-h>", "<c-w><c-h>", { desc = "Move to split left" })

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k "<CR>"
  end
end, { expr = true })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
set("n", "<left>", "gT")
set("n", "<right>", "gt")

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", fn(vim.diagnostic.jump, { count = 1, float = true }))
set("n", "[d", fn(vim.diagnostic.jump, { count = -1, float = true }))

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<", { desc = "Decrease split width" })
set("n", "<M-.>", "<c-w>5>", { desc = "Increase split width" })
set("n", "<M-t>", "<C-W>+", { desc = "Increase split height" })
set("n", "<M-s>", "<C-W>-", { desc = "Decrease split height" })

set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)

set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

vim.api.nvim_set_keymap("n", "<leader>t", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

set("n", "j", function(...)
  local count = vim.v.count

  if count == 0 then
    return "gj"
  else
    return "j"
  end
end, { expr = true })

set("n", "k", function(...)
  local count = vim.v.count

  if count == 0 then
    return "gk"
  else
    return "k"
  end
end, { expr = true })

-- Additional useful keymaps
set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })
set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })
set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle undo tree" })

-- Better window management
set("n", "<leader>=", "<cmd>wincmd =<cr>", { desc = "Equalize windows" })
set("n", "<leader>o", "<cmd>only<cr>", { desc = "Close other windows" })

-- Quick access to common files
set("n", "<leader>ev", "<cmd>edit ~/.config/nvim/init.lua<cr>", { desc = "Edit init.lua" })
set("n", "<leader>sv", "<cmd>source ~/.config/nvim/init.lua<cr>", { desc = "Source init.lua" })

-- Enhanced navigation
set("n", "<leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggle Aerial" })
set("n", "{", "<cmd>AerialPrev<cr>", { desc = "Previous symbol" })
set("n", "}", "<cmd>AerialNext<cr>", { desc = "Next symbol" })

-- Git integration
set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open diffview" })
set("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" })

-- Code execution
set("n", "<leader>r", "<cmd>SnipRun<cr>", { desc = "Run code snippet" })
set("v", "<leader>r", "<cmd>SnipRun<cr>", { desc = "Run selected code" })

-- Testing
set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test file" })
set("n", "<leader>ts", function()
  require("neotest").run.stop()
end, { desc = "Stop test" })
set("n", "<leader>td", function()
  require("neotest").run.run_last()
end, { desc = "Run last test" })
set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Open test output" })
set("n", "<leader>tS", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
