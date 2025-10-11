-- LSP Configuration - Professional setup
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- "hrsh7th/cmp-nvim-lsp", -- Disabled for learning
    },
    config = function()
      -- Minimal LSP capabilities - Disable completion for learning
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Disable completion capabilities
      capabilities.textDocument.completion = nil
      capabilities.textDocument.hover = nil
      capabilities.textDocument.signatureHelp = nil
      
      -- Enhanced LSP settings
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- Minimal LSP keymaps - Only essential navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format { async = true }
        end, opts)
        
        -- Enhanced LSP features - Disable real-time inlay hints
        if client.supports_method("textDocument/inlayHints") then
          vim.lsp.inlay_hint.enable(false)
        end
      end
      
      -- Language servers with error handling
      local lspconfig = require("lspconfig")
      
      -- Helper function to safely setup LSP servers
      local function safe_setup(server_name, config)
        local ok, server = pcall(lspconfig[server_name].setup, config)
        if not ok then
          vim.notify("LSP server " .. server_name .. " not available", vim.log.levels.WARN)
        end
      end
      
      -- C/C++ (clangd)
      safe_setup("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- Python (pyright)
      safe_setup("pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- JavaScript/TypeScript (ts_ls)
      safe_setup("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- Go (gopls)
      safe_setup("gopls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- Rust (rust_analyzer) - Enhanced configuration
      safe_setup("rust_analyzer", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            check = {
              command = "clippy", -- Use clippy instead of check
              extraArgs = { "--", "-W", "clippy::all" },
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
            hover = {
              actions = {
                enable = true,
                implementations = {
                  enable = true,
                },
                references = {
                  enable = true,
                },
                run = {
                  enable = true,
                },
                debug = {
                  enable = true,
                },
                gotoTypeDef = {
                  enable = true,
                },
              },
            },
            lens = {
              enable = true,
              run = {
                enable = true,
              },
              debug = {
                enable = true,
              },
              implementations = {
                enable = true,
              },
              references = {
                enable = true,
              },
            },
            inlayHints = {
              enable = false, -- Disable inlay hints while typing
            },
          },
        },
      })
      
      -- SQL (sqls) - Only if available
      safe_setup("sqls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- C# (omnisharp) - Only if available
      safe_setup("omnisharp", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      
      -- Note: Zig (zls) removed as it's not commonly installed
      -- You can install it manually if needed: https://github.com/zigtools/zls
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "pyright",       -- Python
          "ts_ls",         -- JavaScript/TypeScript
          "gopls",         -- Go
          "rust_analyzer", -- Rust
          -- Note: sqls and omnisharp removed as they may not be available
          -- You can install them manually if needed
        },
        automatic_installation = true,
        -- Explicitly exclude problematic language servers
        exclude = {
          "elixirls",      -- Requires Elixir language
          "julials",       -- Requires Julia language
        },
      })
    end,
  },
}