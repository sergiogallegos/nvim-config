-- LSP Configuration - Professional setup
return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
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
                    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                    if client and client:supports_method("textDocument/inlayHint", bufnr) then
                        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                    end
                end,
            })

            local servers = {
                pyright = {
                    settings = { pyright = { disableOrganizeImports = true } },
                },
                ruff = {
                    on_attach = function(client)
                        client.server_capabilities.hoverProvider = false
                    end,
                },
                ts_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                taplo = {},

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
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup {
                ui = {
                    border = "rounded",
                },
            }
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            local servers = {
                "pyright",
                "ruff",
                "ts_ls",
                "lua_ls",
                "taplo",
                "rust_analyzer",
            }
            require("mason-lspconfig").setup {
                ensure_installed = servers,
                automatic_enable = false, -- Enabled once above, with our settings.
            }
        end,
    },
}
