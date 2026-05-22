-- Enhanced Keymaps - Latest Best Practices
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
    set("n", "<leader>on", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
    set("n", "<leader>or", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

    -- === MODERN ENHANCEMENTS ===

    -- Better escape sequences
    set("i", "jk", "<Esc>", { desc = "Escape insert mode" })
    set("i", "jj", "<Esc>", { desc = "Escape insert mode" })

    -- Smart splits
    set("n", "<C-h>", function()
        require("smart-splits").move_left()
    end, { desc = "Move left" })
    set("n", "<C-j>", function()
        require("smart-splits").move_down()
    end, { desc = "Move down" })
    set("n", "<C-k>", function()
        require("smart-splits").move_up()
    end, { desc = "Move up" })
    set("n", "<C-l>", function()
        require("smart-splits").move_right()
    end, { desc = "Move right" })

    -- Helix-like Space mode: LSP and editing actions
    set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover" })
    set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
    set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Code action" })
    set("n", "<leader>h", vim.lsp.buf.references, { desc = "References" })
    set("n", "<leader>c", "gcc", { remap = true, desc = "Toggle comment" })
    set("v", "<leader>c", "gc", { remap = true, desc = "Toggle comment" })

    -- Mini.bufremove
    set("n", "<leader>bd", function()
        require("mini.bufremove").delete()
    end, { desc = "Delete buffer" })
    set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
    end, { desc = "Delete buffer (force)" })

    -- Mini.jump
    set("n", "<CR>", function()
        require("mini.jump").jump()
    end, { desc = "Jump" })

    -- Mini.jump2d
    set("n", "<leader>j", function()
        require("mini.jump2d").start()
    end, { desc = "Jump 2D" })

    -- Mini.move
    set("n", "<M-h>", function()
        require("mini.move").move_line "left"
    end, { desc = "Move line left" })
    set("n", "<M-l>", function()
        require("mini.move").move_line "right"
    end, { desc = "Move line right" })
    set("n", "<M-j>", function()
        require("mini.move").move_line "down"
    end, { desc = "Move line down" })
    set("n", "<M-k>", function()
        require("mini.move").move_line "up"
    end, { desc = "Move line up" })

    -- Mini.trailspace
    set("n", "<leader>tw", function()
        require("mini.trailspace").trim()
    end, { desc = "Trim trailing whitespace" })

    -- === ENHANCED WORKFLOW ===

    -- Better window management
    set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
    set("n", "<leader>ws", "<C-w>s", { desc = "Split horizontally" })
    set("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
    set("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
    set("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
    set("n", "<leader>wl", "<C-w>l", { desc = "Window right" })
    set("n", "<leader>ww", "<C-w>w", { desc = "Next window" })
    set("n", "<leader>wq", "<C-w>q", { desc = "Close window" })
    set("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })
    set("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })

    -- Better buffer management
    set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
    set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
    set("n", "<leader><space>", "<cmd>buffer #<cr>", { desc = "Switch to last buffer" })

    -- Better tab management
    set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New tab" })
    set("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close tab" })
    set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

    -- Better search and replace
    set(
        "n",
        "<leader>sr",
        ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
        { desc = "Search and replace word under cursor" }
    )
    set(
        "n",
        "<leader>sR",
        ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>",
        { desc = "Search and replace word under cursor (no word boundary)" }
    )

    -- Better quickfix
    set("n", "<leader>qn", "<cmd>cnext<cr>", { desc = "Next quickfix" })
    set("n", "<leader>qp", "<cmd>cprevious<cr>", { desc = "Previous quickfix" })
    set("n", "<leader>qc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
    set("n", "<leader>qo", "<cmd>copen<cr>", { desc = "Open quickfix" })

    -- Better location list
    set("n", "<leader>ln", "<cmd>lnext<cr>", { desc = "Next location" })
    set("n", "<leader>lp", "<cmd>lprevious<cr>", { desc = "Previous location" })
    set("n", "<leader>lC", "<cmd>lclose<cr>", { desc = "Close location list" }) -- Changed from lc to lC to avoid conflict with Luca
    set("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Open location list" })

    -- Better registers
    set("n", "<leader>ra", "<cmd>reg<cr>", { desc = "Show registers" })
    set("n", "<leader>ry", '"', { desc = "Yank to register" })
    set("n", "<leader>rp", '"', { desc = "Paste from register" })

    -- Better spelling
    set("n", "<leader>se", "<cmd>set spell<cr>", { desc = "Enable spelling" })
    set("n", "<leader>sD", "<cmd>set nospell<cr>", { desc = "Disable spelling" })
    set("n", "<leader>sn", "]s", { desc = "Next spelling error" })
    set("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
    set("n", "<leader>sz", "z=", { desc = "Suggest spelling" })

    -- Better folding
    set("n", "<leader>fo", "<cmd>foldopen<cr>", { desc = "Open fold" })
    set("n", "<leader>fc", "<cmd>foldclose<cr>", { desc = "Close fold" })
    set("n", "<leader>ft", "<cmd>foldtoggle<cr>", { desc = "Toggle fold" })
    set("n", "<leader>fa", "<cmd>foldopenall<cr>", { desc = "Open all folds" })
    set("n", "<leader>fA", "<cmd>foldcloseall<cr>", { desc = "Close all folds" })

    -- Better diff
    set("n", "<leader>vdt", "<cmd>diffthis<cr>", { desc = "Diff this" })
    set("n", "<leader>vdo", "<cmd>diffoff<cr>", { desc = "Diff off" })
    set("n", "<leader>vdu", "<cmd>diffupdate<cr>", { desc = "Diff update" })

    -- Better terminal
    set("n", "<leader>T", "<cmd>terminal<cr>", { desc = "Open terminal" })
    set("n", "<leader>Tv", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal vertical" })
    set("n", "<leader>Ts", "<cmd>split | terminal<cr>", { desc = "Open terminal horizontal" })

    -- Better help
    set("n", "<leader>hh", "<cmd>help<cr>", { desc = "Open help" })
    set("n", "<leader>ht", "<cmd>helptags<cr>", { desc = "Generate help tags" })
    set("n", "<leader>hc", "<cmd>checkhealth<cr>", { desc = "Check health" })
    set("n", "<leader>hv", "<cmd>version<cr>", { desc = "Show version" })

    -- Better options
    set("n", "<leader>ow", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
    set("n", "<leader>ol", "<cmd>set list!<cr>", { desc = "Toggle list" })
    set("n", "<leader>oc", "<cmd>set cursorline!<cr>", { desc = "Toggle cursor line" })
    set("n", "<leader>os", "<cmd>set spell!<cr>", { desc = "Toggle spelling" })
    set("n", "<leader>oi", "<cmd>set ignorecase!<cr>", { desc = "Toggle ignore case" })
    set("n", "<leader>oS", "<cmd>set smartcase!<cr>", { desc = "Toggle smart case" })
end

return M
