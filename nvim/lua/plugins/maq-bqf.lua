local function config()
  require("bqf").setup({
    auto_resize_height = {
      default = false,
    },
    preview = {
      auto_preview = false,
    },
  })
end

return {
  config = config,
}
