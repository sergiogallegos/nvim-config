return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup {
      options = {
        -- other options
        close_command = "bdelete! %d",       -- This is the default command to close a buffer
        right_mouse_command = "bdelete! %d", -- This is the default command to close a buffer with the right mouse button
      },
    }

    -- Add an autocommand to avoid closing the last buffer
    vim.api.nvim_create_autocmd('BufDelete', {
      pattern = '*',
      callback = function()
        if #vim.fn.getbufinfo({buflisted = 1}) == 1 then
          vim.cmd('enew')  -- Create a new empty buffer if the last buffer is closed
        end
      end,
    })
  end,
}
