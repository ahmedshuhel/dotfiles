local function config()
    vim.cmd([[
      augroup fugitivegroup
        autocmd!
        autocmd FileType gitcommit setlocal spell
      augroup END
    ]], false)

    vim.cmd 'cnoreabbrev G rightbelow G'


end

return {
    config = config
}
