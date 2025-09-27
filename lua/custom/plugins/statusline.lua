-- Status line configuration - lualine-max (WORKING VERSION)
return {
  -- lualine-max - Working configuration that fixes black statusline
  {
    'https://github.com/sergiogallegos/lualine-max.nvim',
    dependencies = { 
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    priority = 1000,
    config = function()
      -- CRITICAL: Clear any existing statusline
      vim.o.statusline = ""
      vim.o.laststatus = 2
      vim.o.ruler = true
      
      -- Wait for Neovim to be fully loaded
      vim.defer_fn(function()
        local ok, lualine = pcall(require, "lualine")
        if not ok then
          -- Fallback to basic statusline if lualine fails
          vim.o.statusline = "%f %h%w%m%r %=%y %l,%c %P"
          vim.notify("lualine-max failed, using basic statusline", vim.log.levels.WARN)
          return
        end
        
        -- Working configuration
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
              statusline = 1000,
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
        })
        
        -- Force refresh
        lualine.refresh()
        vim.cmd("redraw!")
        
      end, 100) -- Wait 100ms before loading
    end,
  },
}