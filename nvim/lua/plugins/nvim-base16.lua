local base16 = require("base16")
local theme  = vim.g.dp_theme

local function config()
  base16(base16.themes(theme), true)
  require("highlights")
end

return {
  config = config
}
