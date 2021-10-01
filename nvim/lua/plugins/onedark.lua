local g = vim.g

local function config()
  g.onedark_style = 'darker'
  g.onedark_disable_terminal_colors = 1

  require('onedark').setup()
end

return {
  config = config
}
