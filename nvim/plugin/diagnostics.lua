-- Default config
vim.diagnostic.config { virtual_lines = { only_current_line = true } }

local function lspSymbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end


lspSymbol("Error", "•")
lspSymbol("Warn", "•")
lspSymbol("Info", "•")
lspSymbol("Hint", "•")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = false,
    -- set this to true if you want diagnostics to show in insert mode
    update_in_insert = false,
})
