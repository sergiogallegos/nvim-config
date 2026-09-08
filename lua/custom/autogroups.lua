-- Autogroups - Professional autocmd management (ThePrimeagen style)
local M = {}

-- Create autogroup for organized autocmds
local function create_autogroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Yank highlighting (ThePrimeagen style)
function M.setup_yank_highlighting()
    local yank_group = create_autogroup "YankHighlight"

    vim.api.nvim_create_autocmd("TextYankPost", {
        group = yank_group,
        pattern = "*",
        callback = function()
            vim.hl.on_yank {
                higroup = "IncSearch",
                timeout = 40,
            }
        end,
    })
end

-- Auto resize splits
function M.setup_auto_resize()
    local resize_group = create_autogroup "AutoResize"

    vim.api.nvim_create_autocmd("VimResized", {
        group = resize_group,
        pattern = "*",
        callback = function()
            vim.cmd "wincmd ="
        end,
    })
end

-- Initialize all autogroups
function M.setup()
    M.setup_yank_highlighting()
    M.setup_auto_resize()
    vim.api.nvim_create_autocmd("BufReadPost", {
        group = create_autogroup "RestoreCursor",
        callback = function(event)
            if vim.bo[event.buf].buftype ~= "" or vim.bo[event.buf].filetype == "gitcommit"
                or vim.api.nvim_buf_get_name(event.buf):match("[\\/]COMMIT_EDITMSG$") then
                return
            end
            local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
            if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(event.buf) then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end,
    })
end

return M
