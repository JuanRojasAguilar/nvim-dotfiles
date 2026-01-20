return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        build = ":MasonUpdate",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog"
        },
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✔️",
                    package_pending = "🕓",
                    package_uninstalled = "❌",
                }
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function ()
            local lspconfig = require("lspconfig")
            local mason_lsp = require("mason-lspconfig")

                vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            mason_lsp.setup({
                ensure_installed = { "lua_ls" },
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } }
                            }
                        }
                    })
                end,
            })
        end
    }
}
