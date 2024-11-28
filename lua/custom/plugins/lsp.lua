return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim", -- LSP progress UI
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
      "b0o/SchemaStore.nvim", -- JSON/YAML schemas
    },
    config = function()
      -- Default LSP capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Define LSP servers and configurations
      local servers = {
        pyright = {}, -- Python
        jdtls = {}, -- Java
        clangd = { -- C, C++
          init_options = { clangdFileStatus = true },
        },
        gopls = { -- Go
          settings = {
            gopls = {
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
              hints = {
                assignVariableTypes = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        rust_analyzer = { -- Rust
          settings = {
            ["rust-analyzer"] = {
              diagnostics = { enable = true },
              checkOnSave = { command = "check" },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              inlayHints = { enable = true },
            },
          },
        },
        jsonls = { -- JSON
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
      }

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      }

      -- Setup LSP servers
      local lspconfig = require("lspconfig")
      for name, config in pairs(servers) do
        lspconfig[name].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, config))
      end

      -- Diagnostics configuration
      vim.diagnostic.config {
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded" },
      }

      -- Toggle diagnostics
      vim.keymap.set("", "<leader>l", function()
        local config = vim.diagnostic.config() or {}
        if config.virtual_text then
          vim.diagnostic.config { virtual_text = false, virtual_lines = true }
        else
          vim.diagnostic.config { virtual_text = true, virtual_lines = false }
        end
      end, { desc = "Toggle diagnostics display" })

      -- Key mappings for LSP features
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr })
          vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { buffer = bufnr })
        end,
      })

      -- Additional plugins
      require("lsp_lines").setup()
      require("fidget").setup()
    end,
  },
}
