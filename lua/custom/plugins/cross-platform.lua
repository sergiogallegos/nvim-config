-- Cross-platform Plugin Configuration
local platform = require "custom.platform"

return {
    -- Which-key (platform-specific)
    {
        "folke/which-key.nvim",
        enabled = not platform.is_windows, -- Disabled on Windows
        config = function()
            if not platform.is_windows then
                require("which-key").setup {
                    win = {
                        border = "rounded",
                    },
                    show_help = true,
                }
            end
        end,
    },
    -- Platform-specific clipboard
    {
        "AckslD/nvim-neoclip.lua",
        enabled = false, -- Temporarily disabled due to sqlite.lua dependency issues
        config = function()
            if
                platform.config.clipboard.win32yank
                or platform.config.clipboard.pbcopy
                or platform.config.clipboard.xclip
            then
                require("neoclip").setup {
                    history = 1000,
                    enable_persistent_history = true,
                    length_limit = 1048576,
                    continuous_sync = false,
                    db_path = vim.fn.stdpath "data" .. "/databases/neoclip.sqlite3",
                    filter = nil,
                    preview = true,
                    prompt = nil,
                    default_register = '"',
                    default_register_macros = "q",
                    enable_macro_history = true,
                    content_spec_column = false,
                    on_paste = {
                        set_reg = false,
                    },
                    on_yank = {
                        set_reg = false,
                    },
                    keys = {
                        telescope = {
                            i = {
                                select = "<cr>",
                                paste = "<c-p>",
                                paste_behind = "<c-k>",
                                replay = "<c-q>",
                                custom = {},
                            },
                            n = {
                                select = "<cr>",
                                paste = "p",
                                paste_behind = "P",
                                replay = "q",
                                custom = {},
                            },
                        },
                        fzf = {
                            select = "default",
                            paste = "ctrl-p",
                            paste_behind = "ctrl-k",
                            custom = {},
                        },
                    },
                }
            end
        end,
    },
}
