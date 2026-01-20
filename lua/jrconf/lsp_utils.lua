local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

function M.on_attach(cient, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    M.set_keys(client, bufnr)
end

function M.format()
    vim.lsp.buf.format()
end

M.diagnostics_active = true

function M.toggle_diagnostics()
    M.diagnostics_active = not M.diagnostics_active
    if M.diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

function M.toggle_hints()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end

function M.format_sync()
    vim.lsp.buf.format { async = true }
end

function M.set_keys(cient, buffer)
    
end
