vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilinetokenSupport = true,
            }
        }
    },
    root_markers = { ".git" },
})
