return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    enabled = false, -- Temporarily disable due to compatibility issues
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local ok, null_ls = pcall(require, "null-ls")
      if not ok then
        vim.notify("Failed to load null-ls", vim.log.levels.ERROR)
        return
      end
      
      null_ls.setup({
        sources = {
          -- Formatting (only include tools that are available)
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.clang_format,
          
          -- Code actions
          null_ls.builtins.code_actions.gitsigns,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}
