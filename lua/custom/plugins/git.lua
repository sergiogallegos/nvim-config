-- Git Integration - Professional setup
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local ok, gitsigns = pcall(require, "gitsigns")
            if not ok then
                return
            end

            gitsigns.setup {
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    -- Navigation
                    vim.keymap.set("n", "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Next hunk" })

                    vim.keymap.set("n", "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Prev hunk" })

                    -- Actions
                    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
                    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
                    vim.keymap.set("v", "<leader>hs", function()
                        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
                    end, { desc = "Stage hunk" })
                    vim.keymap.set("v", "<leader>hr", function()
                        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
                    end, { desc = "Reset hunk" })
                    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
                    vim.keymap.set("n", "<leader>hb", function()
                        gs.blame_line { full = true }
                    end, { desc = "Blame line" })
                end,
            }
        end,
    },
}
