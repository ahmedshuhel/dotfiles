local function config()
    vim.cmd([[ autocmd FileType gitcommit setlocal spell ]], false)
end

return {
    config = config
}
