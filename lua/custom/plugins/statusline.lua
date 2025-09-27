return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  config = function()
    -- Force clear any existing statusline
    vim.cmd("set statusline=")
    
    local ok, lualine = pcall(require, "lualine")
    if not ok then
      vim.notify("Failed to load lualine", vim.log.levels.ERROR)
      return
    end
    
    lualine.setup({
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
    
    -- Force refresh and ensure it stays
    vim.cmd("redrawstatus")
    vim.cmd("set laststatus=2")
    
    -- Auto-refresh on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("redrawstatus")
      end,
    })
  end,
}
