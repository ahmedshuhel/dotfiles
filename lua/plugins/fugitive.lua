local function config()
    vim.cmd([[
      augroup fugitivegroup
        autocmd!
        autocmd FileType gitcommit setlocal spell
      augroup END
    ]], false)
end

return {
    config = config
}
