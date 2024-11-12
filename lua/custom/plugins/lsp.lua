return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
      "stevearc/conform.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      -- Enable termguicolors (also add this in init.lua)
      vim.opt.termguicolors = true

      -- Setup Lua for Neovim development
      require("neodev").setup()

      -- Define LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      -- Define LSP servers
      local lspconfig = require "lspconfig"
      local servers = {
        bashls = true,               -- Bash
        clangd = {                   -- C, C++
          init_options = { clangdFileStatus = true },
        },
        jdtls = true,                -- Java
        pyright = true,              -- Python
        rust_analyzer = true,        -- Rust
        gopls = {                    -- Go
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        sqlls = true,                -- SQL
        vimls = true,                -- Vim Script
        lua_ls = {                   -- Lua
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
        zls = true,                  -- Zig
        mojo = true,                 -- Mojo (remove `manual_install` to auto-install)
        ocamllsp = {                 -- OCaml
          cmd = { "dune", "exec", "ocamllsp" },
          settings = {
            codelens = { enable = true },
            inlayHints = { enable = true },
            syntaxDocumentation = { enable = true },
          },
          filetypes = { "ocaml", "ocaml.interface", "reason" },
        },
        hls = true,                  -- Haskell
        omnisharp = true,            -- C#
        ts_ls = true,                -- TypeScript (replacing deprecated tsserver)
      }

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      -- Configure each LSP server
      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config.capabilities = capabilities
        lspconfig[name].setup(config)
      end

      -- Setup autoformatting
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          sql = { "sqlfluff" },
        },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          require("conform").format {
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          }
        end,
      })

      -- LSP diagnostic lines setup
      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = true, virtual_lines = false }

      -- Toggle for diagnostic lines
      vim.keymap.set("", "<leader>l", function()
        local config = vim.diagnostic.config() or {}
        vim.diagnostic.config {
          virtual_text = not config.virtual_text,
          virtual_lines = not config.virtual_lines,
        }
      end, { desc = "Toggle lsp_lines" })
    end,
  },
}
