return {
    {
        "mason-org/mason.nvim",
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
                icons = {
                    package_installed = "✔️",
                    package_pending = "🕓",
                    package_uninstalled = "❌",
                    border = "rounded",
                }
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function ()
            local lspconfig = require("lspconfig")
            local mason_lsp = require("mason-lspconfig")

            mason_lsp.setup({
                ensure_installed = { "lua_ls" }
            })
            
            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end

            mason_lsp.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                    })
                end,
            })
        end
    }
}
