-- Status line configuration - lualine-max (ENHANCED VERSION)
return {
  -- lualine-max - Enhanced configuration
  {
    'https://github.com/sergiogallegos/lualine-max.nvim',
    dependencies = { 
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.statusline = ""
      vim.o.laststatus = 2
      
      vim.defer_fn(function()
        local ok, lualine = pcall(require, "lualine")
        if ok then
          lualine.setup({
            options = {
              theme = 'auto',
              component_separators = { left = '', right = '' },
              section_separators = { left = '', right = '' },
              disabled_filetypes = {
                statusline = { 'alpha', 'dashboard', 'lazy', 'mason', 'TelescopePrompt' },
              },
              always_divide_middle = true,
              globalstatus = false,
              refresh = {
                statusline = 1000, -- Slower refresh for stability
              },
            },
            sections = {
              lualine_a = { 'mode' },
              lualine_b = { 'branch', 'diff', 'diagnostics' },
              lualine_c = { 'filename' },
              lualine_x = { 'encoding', 'fileformat', 'filetype' },
              lualine_y = { 'progress' },
              lualine_z = { 'location' }
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = { 'filename' },
              lualine_x = { 'location' },
              lualine_y = {},
              lualine_z = {}
            },
            -- Performance optimizations
            performance = {
              smart_caching = { enabled = true },
              lazy_loading = { enabled = true },
            },
          })
          lualine.refresh()
        else
          vim.o.statusline = "%f %h%w%m%r %=%y %l,%c %P"
        end
      end, 100)
    end,
  },
}