local M = {}

-- Compute picker scope without changing cwd (terminals and other projects keep theirs).
function M.root(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(bufnr)
    local path
    if vim.bo[bufnr].filetype == "oil" then
        path = require("oil").get_current_dir(bufnr)
    elseif vim.bo[bufnr].buftype == "" and name ~= "" then
        path = vim.fs.dirname(name)
    end
    path = path or vim.uv.cwd()
    -- The repository root includes sibling crates/packages in a workspace.
    return vim.fs.root(path, { ".git", ".hg" })
        or vim.fs.root(path, { "Cargo.toml", "pyproject.toml", "package.json", "tsconfig.json", "setup.py" })
        or path
end

return M
