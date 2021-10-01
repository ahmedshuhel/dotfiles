local _ = require("underscore")
local comment = require("nvim_comment")

local function config()
  comment.setup()

  _.map("n", "<leader>/", ":CommentToggle<CR>")
  _.map("v", "<leader>/", ":CommentToggle<CR>")
end

return {
  config = config
}
