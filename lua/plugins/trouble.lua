local function config()
  require("trouble").setup({
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    icons = true, -- use devicons for filenames
  })
end

return {
  config = config
}
