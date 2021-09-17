local function config()
    vim.cmd([[
      augroup fugitivegroup
        autocmd!
        autocmd FileType gitcommit setlocal spell
      augroup END
    ]], false)

    vim.cmd [[command! -bang -nargs=? -range=-1 -complete=customlist,fugitive#Complete G   exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, (len("<mods>") == 0 && <q-args> != "blame" ? "rightbelow" : "<mods>"), <q-args>)]]
end

return {
    config = config
}
