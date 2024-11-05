return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright",            -- Python
        "jdtls",              -- Java
        "clangd",             -- C/C++
        "gopls",              -- Go
        "rust_analyzer",      -- Rust
        "zls",                -- Zig
        "lua_ls",             -- Lua
        "vimls",              -- Vim Script
        "html",               -- HTML
        "cssls",              -- CSS
        "sqlls",              -- SQL
        "omnisharp",          -- C#
        "tailwindcss",        -- CSS Framework
        "svelte",             -- Svelte
        "graphql",            -- GraphQL
        "emmet_ls",           -- Emmet
        "prismals",           -- Prisma
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",           -- Formatter for JavaScript, HTML, CSS
        "stylua",             -- Formatter for Lua
        "isort",              -- Sort imports for Python
        "black",              -- Formatter for Python
        "pylint",             -- Linter for Python
        "eslint_d",           -- Linter for JavaScript, TypeScript
        "clang-format",       -- Formatter for C/C++
        "rustfmt",            -- Formatter for Rust
        "sql-formatter",      -- Formatter for SQL
        "csharpier",          -- Formatter for C#
      },
    })

    -- Setup LSP
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({})
    lspconfig.pyright.setup({})
    -- Add other LSP configurations here
  end,
}
