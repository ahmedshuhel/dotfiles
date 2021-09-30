local function config()
  vim.cmd([[
    augroup Lightbulb
      au!
      autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    augroup END
  ]])
end

return {
  config = config
}
