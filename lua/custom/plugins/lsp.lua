-- LSP Configuration - Professional setup
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Enhanced LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      
      -- Enhanced LSP settings
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- LSP keymaps
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
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
      -- Suppress deprecation warning by overriding vim.notify temporarily
      local original_notify = vim.notify
      vim.notify = function(msg, level, opts)
        if msg and (string.find(msg, "deprecated") or string.find(msg, "lspconfig")) then
          return
        end
        return original_notify(msg, level, opts)
      end
      
      local lspconfig = require("lspconfig")
      
      -- Restore original notify
      vim.notify = original_notify
      
      -- Helper function to safely setup LSP servers
      local function safe_setup(server_name, config)
        if lspconfig[server_name] then
          local ok, server = pcall(lspconfig[server_name].setup, config)
          if not ok then
            vim.notify("LSP server " .. server_name .. " setup failed", vim.log.levels.WARN)
          end
        else
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