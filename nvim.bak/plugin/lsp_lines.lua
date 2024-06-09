local ok, lsp_lines = pcall(require, "lsp_lines")

if not ok then
    return
end

lsp_lines.setup()
