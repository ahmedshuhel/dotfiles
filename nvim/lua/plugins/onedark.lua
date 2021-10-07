local g = vim.g

local function config()
  g.onedark_transparent_background = true
  g.onedark_style = 'deep'
  g.onedark_disable_terminal_colors = 1

  require('onedark').setup()
end

return {
  config = config
}
