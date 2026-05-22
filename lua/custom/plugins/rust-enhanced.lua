-- Enhanced Rust Development
return {
    -- Rust-specific tools
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local rt = require "rust-tools"

            rt.setup {
                tools = {
                    inlay_hints = {
                        auto = false, -- Disable auto inlay hints
                        only_current_line = false,
                        show_parameter_hints = true,
                        parameter_hints_prefix = "← ",
                        other_hints_prefix = "→ ",
                        max_len_align = false,
                        max_len_align_padding = 1,
                        right_align = false,
                        right_align_padding = 7,
                        highlight = "Comment",
                    },
                    hover_actions = {
                        border = "rounded",
                        auto_focus = false,
                    },
                },
                server = {
                    on_attach = function(client, bufnr)
                        local opts = { noremap = true, silent = true, buf = bufnr }

                        -- Rust-specific keymaps
                        vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, opts)
                        vim.keymap.set("n", "<leader>rm", rt.expand_macro.expand_macro, opts)
                        vim.keymap.set("n", "<leader>rc", rt.open_cargo_toml.open_cargo_toml, opts)
                        vim.keymap.set("n", "<leader>rp", rt.parent_module.parent_module, opts)
                        vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, opts)
                        vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions, opts)
                        vim.keymap.set("n", "<leader>ra", rt.code_action_group.code_action_group, opts)
                    end,
                },
            }
        end,
    },

    -- Cargo integration
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup {
                popup = {
                    border = "rounded",
                },
            }
        end,
    },
}
