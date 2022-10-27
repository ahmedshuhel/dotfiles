local _ = require("underscore")

local function keymaps()
  _.map("n", "<S-x>", "[[<Cmd>BufDel<CR>]]") -- close tab
end



return {
  keymaps = keymaps
}
