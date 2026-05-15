-- Enhanced Keymaps - Latest Best Practices
local M = {}

local set = vim.keymap.set

function M.setup()
    -- Core editing
    set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
    set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
    set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
    set("n", "<leader>s", "/", { desc = "Search" })
    set("n", "<leader>S", "?", { desc = "Search backwards" })
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

    -- Mini.surround
    set("n", "sa", function()
        require("mini.surround").add()
    end, { desc = "Add surround" })
    set("n", "sd", function()
        require("mini.surround").delete()
    end, { desc = "Delete surround" })
    set("n", "sf", function()
        require("mini.surround").find()
    end, { desc = "Find surround" })
    set("n", "sr", function()
        require("mini.surround").replace()
    end, { desc = "Replace surround" })

    -- Mini.bufremove
    set("n", "<leader>bd", function()
        require("mini.bufremove").delete()
    end, { desc = "Delete buffer" })
    set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
    end, { desc = "Delete buffer (force)" })

    -- Mini.files
    set("n", "<leader>mf", function()
        require("mini.files").open()
    end, { desc = "Mini files" })
    set("n", "<leader>mF", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0))
    end, { desc = "Mini files current" })

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

    -- Mini.pick
    set("n", "<leader>p", function()
        require("mini.pick").start()
    end, { desc = "Start picker" })

    -- Mini.sessions
    set("n", "<leader>ss", function()
        require("mini.sessions").save()
    end, { desc = "Save session" })
    set("n", "<leader>sl", function()
        require("mini.sessions").load()
    end, { desc = "Load session" })
    set("n", "<leader>sd", function()
        require("mini.sessions").delete()
    end, { desc = "Delete session" })

    -- Mini.trailspace
    set("n", "<leader>tw", function()
        require("mini.trailspace").trim()
    end, { desc = "Trim trailing whitespace" })

    -- === ENHANCED WORKFLOW ===

    -- Better window management
    set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
    set("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })
    set("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })
    set("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })

    -- Better buffer management
    set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
    set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
    set("n", "<leader>bb", "<cmd>buffer #<cr>", { desc = "Switch to last buffer" })

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
    set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Next quickfix" })
    set("n", "<leader>cp", "<cmd>cprevious<cr>", { desc = "Previous quickfix" })
    set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
    set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open quickfix" })

    -- Better location list
    set("n", "<leader>ln", "<cmd>lnext<cr>", { desc = "Next location" })
    set("n", "<leader>lp", "<cmd>lprevious<cr>", { desc = "Previous location" })
    set("n", "<leader>lC", "<cmd>lclose<cr>", { desc = "Close location list" }) -- Changed from lc to lC to avoid conflict with Luca
    set("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Open location list" })

    -- Better marks
    set("n", "<leader>ma", "<cmd>marks<cr>", { desc = "Show marks" })
    set("n", "<leader>mm", "m", { desc = "Set mark" })
    set("n", "<leader>mg", "`", { desc = "Go to mark" })

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
    set("n", "<leader>tt", "<cmd>terminal<cr>", { desc = "Open terminal" })
    set("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal (vertical split)" })
    set("n", "<leader>th", "<cmd>split | terminal<cr>", { desc = "Open terminal (horizontal split)" })

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
