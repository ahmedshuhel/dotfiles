local function config()
  vim.cmd([[
    augroup LightbulbHover
      au!
      au CursorHold,CursorHoldI * lua require(nvim-lightbulb).update_lightbulb()
    augroup END
  ]])
end

return {
  config = config
}
