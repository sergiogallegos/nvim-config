return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require "nvim-treesitter"
            local parsers = {
                "rust",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "json",
                "yaml",
                "toml",
                "bash",
            }
            ts.setup {}
            local function attach(bufnr)
                local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
                if lang and vim.tbl_contains(parsers, lang) then
                    local ok = pcall(vim.treesitter.start, bufnr)
                    if ok then
                        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end
            end
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("CustomTreesitter", { clear = true }),
                callback = function(event)
                    attach(event.buf)
                end,
            })
            -- Install missing parsers; attach to buffers opened during first-time installation.
            ts.install(parsers):await(function(err)
                if err then
                    vim.schedule(function()
                        vim.notify("Parser installation: " .. tostring(err), vim.log.levels.ERROR)
                    end)
                    return
                end
                vim.schedule(function()
                    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(bufnr) then
                            attach(bufnr)
                        end
                    end
                end)
            end)
        end,
    },
    {
        "folke/flash.nvim",
        opts = { modes = { char = { enabled = false }, search = { enabled = false } } },
        keys = {
            {
                "<C-Space>",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter {
                        actions = { ["<C-Space>"] = "next", ["<BS>"] = "prev" },
                    }
                end,
                desc = "Select syntax node (Ctrl-Space: expand, Backspace: shrink)",
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 400,
            spec = {
                { "<leader>R", group = "Rust" },
                { "<leader>g", group = "Git" },
                { "<leader>h", group = "Git hunks" },
                { "<leader>m", group = "Harpoon" },
                { "<leader>o", group = "Options" },
                { "<leader>w", group = "Windows" },
                { "<leader>x", group = "Diagnostics" },
            },
        },
    },
}
