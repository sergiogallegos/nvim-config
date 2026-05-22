-- Advanced Git Integration - From sergiogallegos/nvim-config
return {
    -- Diffview - Advanced git diff viewer
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewFileHistory",
            "DiffviewFocusFiles",
        },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
            { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
            { "<leader>gf", "<cmd>DiffviewFocusFiles<cr>", desc = "Focus diffview files" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
        },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup {
                diff_binaries = false,
                enhanced_diff_hl = false,
                git_cmd = { "git" },
                use_icons = true,
                show_help_hints = true,
                watch_index = true,
                icons = {
                    folder_closed = "",
                    folder_open = "",
                },
                signs = {
                    fold_closed = "",
                    fold_open = "",
                    done = "✓",
                },
                view = {
                    default = {
                        layout = "diff2_horizontal",
                        winbar_info = false,
                    },
                    merge_tool = {
                        layout = "diff3_horizontal",
                        disable_diagnostics = true,
                        winbar_info = true,
                    },
                    file_history = {
                        layout = "diff2_horizontal",
                        winbar_info = false,
                    },
                },
                file_panel = {
                    listing_style = "tree",
                    tree_options = {
                        flatten_dirs = true,
                        folder_statuses = "only_folded",
                    },
                    win_config = {
                        position = "left",
                        width = 35,
                        win_opts = {},
                    },
                },
                file_history_panel = {
                    log_options = {
                        git = {
                            single_file = {
                                diff_merges = "combined",
                            },
                            multi_file = {
                                diff_merges = "first-parent",
                            },
                        },
                    },
                    win_config = {
                        position = "bottom",
                        height = 16,
                        win_opts = {},
                    },
                },
                commit_log_panel = {
                    win_config = {
                        win_opts = {},
                    },
                },
                default_args = {
                    DiffviewOpen = {},
                    DiffviewFileHistory = {},
                },
                hooks = {},
            }
        end,
    },

    -- Git Conflict Resolution
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local original_highlight = vim.highlight

            if vim.hl then
                vim.highlight = vim.hl
            end

            if not vim.g.git_conflict_validate_compat then
                local original_validate = vim.validate
                local type_aliases = {
                    b = "boolean",
                    c = "callable",
                    f = "function",
                    n = "number",
                    s = "string",
                    t = "table",
                }

                local function normalize_validator(arg_validator)
                    if type(arg_validator) == "string" then
                        return type_aliases[arg_validator] or arg_validator
                    end

                    if type(arg_validator) == "table" then
                        return vim.tbl_map(normalize_validator, arg_validator)
                    end

                    return arg_validator
                end

                vim.validate = function(name, value, validator, optional_or_msg, message)
                    if type(name) == "table" and value == nil then
                        for arg_name, spec in pairs(name) do
                            local arg_value = spec[1]
                            local arg_validator = normalize_validator(spec[2])
                            local optional = spec[3] == true
                            local arg_message = spec[4]

                            if not (optional and arg_value == nil) then
                                original_validate(arg_name, arg_value, arg_validator, optional, arg_message)
                            end
                        end
                        return
                    end

                    return original_validate(name, value, validator, optional_or_msg, message)
                end

                vim.g.git_conflict_validate_compat = true
            end

            local git_conflict = require "git-conflict"

            vim.highlight = original_highlight

            git_conflict.setup {
                default_mappings = true,
                default_commands = true,
                disable_diagnostics = false,
                list_opener = "copen",
                log_level = "info",
                debug = false,
            }

            local set = vim.keymap.set
            set("n", "<leader>gco", function()
                require("git-conflict").choose_ours()
            end, { desc = "Choose ours" })
            set("n", "<leader>gct", function()
                require("git-conflict").choose_theirs()
            end, { desc = "Choose theirs" })
            set("n", "<leader>gcb", function()
                require("git-conflict").choose_both()
            end, { desc = "Choose both" })
            set("n", "<leader>gc0", function()
                require("git-conflict").choose_none()
            end, { desc = "Choose none" })
            set("n", "<leader>gcn", function()
                require("git-conflict").next_conflict()
            end, { desc = "Next conflict" })
            set("n", "<leader>gcp", function()
                require("git-conflict").prev_conflict()
            end, { desc = "Prev conflict" })
        end,
    },

    -- Git Worktrees
    {
        "ThePrimeagen/git-worktree.nvim",
        cmd = { "GitWorktree" },
        keys = {
            {
                "<leader>gw",
                function()
                    pcall(require("telescope").load_extension, "git_worktree")
                    require("telescope").extensions.git_worktree.git_worktrees()
                end,
                desc = "Git worktrees",
            },
            {
                "<leader>gW",
                function()
                    pcall(require("telescope").load_extension, "git_worktree")
                    require("telescope").extensions.git_worktree.create_git_worktree()
                end,
                desc = "Create git worktree",
            },
        },
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("git-worktree").setup {
                change_directory_command = "cd",
                update_on_change = true,
                update_on_change_command = "e .",
                clearjumps_on_change = true,
                autopush = false,
            }
        end,
    },
}
