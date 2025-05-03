return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim", -- LSP progress UI
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    },
    config = function()
      local is_windows = vim.loop.os_uname().sysname:match("Windows")
      local is_mac = vim.loop.os_uname().sysname == "Darwin"
      local hostname = vim.loop.os_gethostname()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local jdtls_cmd
      if is_windows and hostname == "LAPTOP-FFSU8F5B" then
        jdtls_cmd = {
          "C:\\Users\\SERGIO~1\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls.CMD",
          "-configuration", "C:\\jdtls\\config",
          "-data", "C:\\jdtls\\workspace",
        }
      elseif is_windows and hostname == "DESKTOP-SHECO" then
        jdtls_cmd = {
          "C:\\Users\\sheco\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls.CMD",
          "-configuration", "C:\\Users\\sheco\\.cache\\jdtls\\config",
          "-data", "C:\\Users\\sheco\\.cache\\jdtls\\workspace",
        }
      elseif is_mac then
        jdtls_cmd = {
          "/Users/sergiogallegos/.local/share/nvim/mason/bin/jdtls",
          "-configuration", "/Users/sergiogallegos/.cache/jdtls/config",
          "-data", "/Users/sergiogallegos/.cache/jdtls/workspace",
        }
      else
        jdtls_cmd = { "jdtls" }
      end

      local servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                logLevel = "Error",
              },
            },
          },
        },
        jdtls = {
          cmd = jdtls_cmd,
          root_dir = require("lspconfig.util").root_pattern(".git", "pom.xml", "build.gradle"),
          settings = {
            java = {
              eclipse = { downloadSources = true },
              configuration = { updateBuildConfiguration = "interactive" },
              maven = { downloadSources = true },
              implementationsCodeLens = { enabled = true },
              referencesCodeLens = { enabled = true },
              format = { enabled = true },
            },
          },
          init_options = { bundles = {} },
        },
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=bundled", "--header-insertion=iwyu" },
          init_options = { clangdFileStatus = true },
          settings = {
            ["clangd"] = {
              diagnostics = { enable = true, suppress = { "pp_include_not_found" } },
              inlayHints = { enable = true, parameterNames = true, typeHints = true },
            },
          },
        },
        tsserver = {},
        gopls = {
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
        rust_analyzer = {
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
        zls = {
          settings = {
            zig = {
              enable_build_on_save = true,
            },
          },
        },
      }

      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      }

      local lspconfig = require("lspconfig")
      for name, config in pairs(servers) do
        lspconfig[name].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, config))
      end

      vim.diagnostic.config {
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded" },
      }

      vim.keymap.set("", "<leader>l", function()
        local config = vim.diagnostic.config() or {}
        if config.virtual_text then
          vim.diagnostic.config { virtual_text = false, virtual_lines = true }
        else
          vim.diagnostic.config { virtual_text = true, virtual_lines = false }
        end
      end, { desc = "Toggle diagnostics display" })

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

      require("lsp_lines").setup()
      require("fidget").setup()
    end,
  },
}
