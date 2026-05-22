-- Ultimate Plugin Configuration - Best of ThePrimeagen + TJ DeVries
return {
    -- === THEPRIMEAGEN'S SIGNATURE PLUGINS ===

    -- Harpoon - ThePrimeagen's signature file navigation
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable "make" == 1 and vim.fn.has "win32" == 0,
            },
        },
        keys = {
            { "<leader>ma", desc = "Harpoon: Add file" },
            { "<leader>mm", desc = "Harpoon: Toggle quick menu" },
            { "<leader>m1", desc = "Harpoon: Go to file 1" },
            { "<leader>m2", desc = "Harpoon: Go to file 2" },
            { "<leader>m3", desc = "Harpoon: Go to file 3" },
            { "<leader>m4", desc = "Harpoon: Go to file 4" },
            { "<leader>mh", desc = "Harpoon: Previous file" },
            { "<leader>ml", desc = "Harpoon: Next file" },
        },
        config = function()
            local harpoon = require "harpoon"
            harpoon:setup()

            vim.keymap.set("n", "<leader>ma", function()
                harpoon:list():append()
            end, { desc = "Harpoon: Add file" })
            vim.keymap.set("n", "<leader>mm", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon: Toggle quick menu" })
            vim.keymap.set("n", "<leader>m1", function()
                harpoon:list():select(1)
            end, { desc = "Harpoon: Go to file 1" })
            vim.keymap.set("n", "<leader>m2", function()
                harpoon:list():select(2)
            end, { desc = "Harpoon: Go to file 2" })
            vim.keymap.set("n", "<leader>m3", function()
                harpoon:list():select(3)
            end, { desc = "Harpoon: Go to file 3" })
            vim.keymap.set("n", "<leader>m4", function()
                harpoon:list():select(4)
            end, { desc = "Harpoon: Go to file 4" })
            vim.keymap.set("n", "<leader>mh", function()
                harpoon:list():prev()
            end, { desc = "Harpoon: Previous file" })
            vim.keymap.set("n", "<leader>ml", function()
                harpoon:list():next()
            end, { desc = "Harpoon: Next file" })
        end,
    },

    -- Fugitive - ThePrimeagen's Git integration
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
        keys = {
            { "<leader>gs", desc = "Git status" },
            { "<leader>gp", desc = "Git push" },
            { "<leader>gP", desc = "Git pull" },
            { "<leader>gc", desc = "Git commit" },
            { "<leader>gb", desc = "Git blame" },
            { "<leader>gl", desc = "Git log" },
        },
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
            vim.keymap.set("n", "<leader>gp", function()
                vim.cmd "Git push"
            end, { desc = "Git push" })
            vim.keymap.set("n", "<leader>gP", function()
                vim.cmd "Git pull"
            end, { desc = "Git pull" })
            vim.keymap.set("n", "<leader>gc", function()
                vim.cmd "Git commit"
            end, { desc = "Git commit" })
            vim.keymap.set("n", "<leader>gb", function()
                vim.cmd "Git blame"
            end, { desc = "Git blame" })
            vim.keymap.set("n", "<leader>gd", function()
                vim.cmd "Gdiffsplit"
            end, { desc = "Git diff split" })
            vim.keymap.set("n", "<leader>gl", function()
                vim.cmd "Git log"
            end, { desc = "Git log" })
        end,
    },

    -- Zen mode - ThePrimeagen's focus mode
    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>z", desc = "Toggle Zen mode" },
        },
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true,
                    },
                },
            }
            vim.keymap.set("n", "<leader>z", function()
                require("zen-mode").toggle()
            end, { desc = "Toggle Zen mode" })
        end,
    },

    -- === TJ DEVRIES' PROFESSIONAL PLUGINS ===

    -- Telescope - TJ's signature fuzzy finder (Windows compatible)
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            { "<leader>f", desc = "Find files" },
            { "<leader>F", desc = "Find files in cwd" },
            { "<leader>/", desc = "Search workspace" },
            { "<leader>b", desc = "Find buffers" },
            { "<leader>?", desc = "Command palette" },
            { "<leader>'", desc = "Resume picker" },
            { "<leader>sh", desc = "Find help" },
            { "<leader>s", desc = "Document symbols" },
            { "<leader>S", desc = "Workspace symbols" },
        },
        config = function()
            local telescope = require "telescope"
            local builtin = require "telescope.builtin"
            local actions = require "telescope.actions"

            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
            }

            pcall(telescope.load_extension, "fzf")

            -- TJ's telescope keymaps (Windows compatible)
            vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>F", function()
                builtin.find_files { cwd = vim.uv.cwd() }
            end, { desc = "Find files in cwd" })
            vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Search workspace" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set("n", "<leader>?", builtin.commands, { desc = "Command palette" })
            vim.keymap.set("n", "<leader>'", builtin.resume, { desc = "Resume picker" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Find help" })
            vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "Document symbols" })
            vim.keymap.set("n", "<leader>S", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
        end,
    },

    -- Treesitter - TJ's advanced syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "c",
                    "cpp",
                    "python",
                    "java",
                    "javascript",
                    "typescript",
                    "go",
                    "rust",
                    "zig",
                    "sql",
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "json",
                    "yaml",
                    "toml",
                    "bash",
                    "fish",
                    "dockerfile",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-backspace>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            }
        end,
    },

    -- Lualine - TJ's professional status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "│", right = "│" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        {
                            "filename",
                            path = 1, -- Show full path
                            shorting_target = 40,
                            symbols = {
                                modified = " ●",
                                readonly = " 🔒",
                                unnamed = " [No Name]",
                                newfile = " [New]",
                            },
                        },
                    },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "filename",
                            path = 1, -- Show full path
                            shorting_target = 40,
                            symbols = {
                                modified = " ●",
                                readonly = " 🔒",
                                unnamed = " [No Name]",
                                newfile = " [New]",
                            },
                        },
                    },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },

    -- Which-key temporarily disabled due to Windows compatibility issues
    -- {
    --   "folke/which-key.nvim",
    --   event = "VeryLazy",
    --   config = function()
    --     require("which-key").setup({
    --       window = {
    --         border = "rounded",
    --       },
    --       show_help = true,
    --     })
    --   end,
    -- },

    -- === COMBINED BEST PRACTICES ===

    -- Undotree - Visual undo history
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", desc = "Toggle undotree" },
        },
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
        end,
    },

    -- Trouble - Diagnostic navigation
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { "<leader>d", desc = "Document diagnostics" },
            { "<leader>D", desc = "Workspace diagnostics" },
            { "<leader>x", desc = "Diagnostics" },
            { "<leader>xl", desc = "Location list" },
            { "<leader>xq", desc = "Quickfix list" },
        },
        config = function()
            require("trouble").setup()
            vim.keymap.set(
                "n",
                "<leader>d",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                { desc = "Document diagnostics" }
            )
            vim.keymap.set("n", "<leader>D", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace diagnostics" })
            vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
            vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list" })
            vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list" })
        end,
    },
}
