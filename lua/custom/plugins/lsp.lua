-- LSP Configuration - Professional setup
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local bufnr = event.buf
          local opts = { noremap = true, silent = true, buffer = bufnr }

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

          if client and client.supports_method("textDocument/inlayHints") then
            vim.lsp.inlay_hint.enable(false)
          end
        end,
      })

      local servers = {
        clangd = {},
        pyright = {},
        ts_ls = {},
        gopls = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = true,
              check = {
                command = "clippy",
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
                enable = false,
              },
            },
          },
        },
      }

      local function setup_server(server_name, config)
        config.capabilities = capabilities

        local ok = pcall(vim.lsp.config, server_name, config)
        if not ok then
          vim.notify("LSP config " .. server_name .. " not available", vim.log.levels.WARN)
          return
        end

        vim.lsp.enable(server_name)
      end

      for server_name, config in pairs(servers) do
        setup_server(server_name, config)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
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
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "pyright",
          "ts_ls",
          "gopls",
          "rust_analyzer",
        },
        automatic_enable = {
          "clangd",
          "pyright",
          "ts_ls",
          "gopls",
          "rust_analyzer",
        },
      })
    end,
  },
}
