local _ = require("underscore")

local function config()
  _.map("n", "<S-x>", "[[<Cmd>BufDel<CR>]]") -- close tab
end

return {
  config = config
}
