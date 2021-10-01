local g = vim.g

local function config()
  g.onedark_style = 'darker'
  require('onedark').setup()
end

return {
  config = config
}
