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
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diff', 'diagnostics' }, -- No 'branch' component
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          },
        })
        lualine.refresh()
      else
        vim.o.statusline = "%f %h%w%m%r %=%y %l,%c %P"
      end
    end, 100)
  end
  },
}